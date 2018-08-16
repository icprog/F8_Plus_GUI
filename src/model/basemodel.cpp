#include "basemodel.h"
#include "src/modelmonitor.h"
BaseModel::BaseModel(QObject *parent) : QObject(parent)
{
    connect(this,SIGNAL(completed()),this,SLOT(onCompleted()),Qt::QueuedConnection);
    connect(this,SIGNAL(revertSignal()),this,SLOT(revert()),Qt::QueuedConnection);
    emit completed();
}
//为了保证初始化操作确实在子类构造完成后才执行,把初始化操作以槽的形式实现
void BaseModel::setMonitorInterval(int msecs)
{
    _monitorInterval = msecs;
}
void BaseModel::onCompleted()
{
    _monitorTimer.setInterval(_monitorInterval);
    _monitorTimer.setSingleShot(false);
    if(_monitorInterval != 0)
        _monitorTimer.start();
    connect(&_monitorTimer,SIGNAL(timeout()),this,SIGNAL(requestLoad()),Qt::QueuedConnection);
    if(_monitorInterval != 0)
        ModelMonitor::getInstance()->registerModel(this); //注册自身到数据模型监视器
    enableSync();
    //emit requestLoad(); //立即请求装载一次数据
}
static bool __emitSignal = true;//此处getValue并重入安全，但此案例应该无碍
QJsonValue BaseModel::getValue(const QString& key)
{
    if(_rawJson.isEmpty() && _buffJson.isEmpty())
    {
        __emitSignal = false; //getValue中装载数据禁掉信号，避免引起qml Binding loop detected
        load();
        __emitSignal = true;
    }
    return _buffJson.value(key);
}
void BaseModel::setValue(const QString& key,const QJsonValue& value)
{
    _buffJson[key] = value;
}
#include <QMutex>
int BaseModel::load()
{
    /**
        load()有可能在界面线程(主要是初始getValue()中)和ModelMonitor线程同时调用
        此处加锁考虑以下方面:
        1. readLowLevel涉及全局IO资源例如socket。

    **/
    static QMutex mutex;    //，而load()readLowLevel涉及全局IO资源例如socket，
    mutex.lock();
    QJsonObject rdJson = readLowLevel();
    if(rdJson != _rawJson)
    {
        _rawJson = rdJson;
        if(_syncFlag)
            emit revertSignal();
    }
    mutex.unlock();
    return 0;
}
void BaseModel::revert()
{
    if(_buffJson != _rawJson)
    {
        _buffJson = _rawJson;
        loadModel(_buffJson);
        if(__emitSignal)
            emit dataChanged();
    }

}
int BaseModel::flush()
{
    int err = 0;
    if(_rawJson != _buffJson)
    {
        err = writeLowLevel(_buffJson);
        if( err != 0 )
            return err;
        _rawJson = _buffJson;
        emit dataChanged();
    }
    return 0;

}

#ifdef DEBUG_WITHOUT_MIDDLEWARE
#include <QFile>
#include <QJsonDocument>
#include <QDebug>
#include <QFileInfo>
QJsonObject BaseModel::readLowLevel()
{
    if(_fileName == "")
    {
        qWarning("class %s not set the json file.",metaObject()->className());
        return QJsonObject();
    }

    if(!QFile::exists(_filePath+_fileName))
    {
        QFile::copy(_defaultFilePath+_fileName,_filePath+_fileName);
        QFile f(_filePath+_fileName);
        f.setPermissions(f.permissions()|QFile::WriteOwner);
    }

    QFile f(_filePath+_fileName);
    if( false == f.open(QIODevice::ReadOnly))
    {
        qDebug("open the json file for read failure");
        return QJsonObject();
    }
    QJsonDocument jsonDoc = QJsonDocument::fromJson(f.readAll());
    f.close();
    return  jsonDoc.object();


}
int BaseModel::writeLowLevel(const QJsonObject& json)
{
    QJsonDocument jsonDoc(json);
    QFile f(_filePath+_fileName);
    if( false == f.open(QIODevice::WriteOnly))
    {
        qWarning("open the json file for write failure.");
        return -1;
    }
    f.write(jsonDoc.toJson());
    f.close();
    return 0;
}

#endif//DEBUG_WITHOUT_MIDDLEWARE

