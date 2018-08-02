#include "basemodel.h"
#include "src/modelmonitor.h"
BaseModel::BaseModel(QObject *parent) : QObject(parent)
{
    connect(this,SIGNAL(completed()),this,SLOT(onCompleted()),Qt::QueuedConnection);
    emit completed();
}
//为了保证初始化操作确实在子类构造完成后才执行,把初始化操作以槽的形式实现
void BaseModel::onCompleted()
{
    _monitorTimer.setInterval(3000);
    _monitorTimer.setSingleShot(false);
    _monitorTimer.start();
    connect(&_monitorTimer,SIGNAL(timeout()),this,SIGNAL(requestLoad()),Qt::QueuedConnection);
    ModelMonitor::getInstance()->registerModel(this); //注册自身到数据模型监视器
    enableSync();
    emit requestLoad(); //立即请求装载一次数据
}

QJsonValue BaseModel::getValue(const QString& key)
{
    return _buffJson.value(key);
}
void BaseModel::setValue(const QString& key,const QJsonValue& value)
{
    _buffJson[key] = value;
}
int BaseModel::load()
{
    QJsonObject rdJson = readLowLevel();
    if(rdJson != _rawJson)
    {
        _rawJson = rdJson;
        if(_syncFlag)
            revert();
    }
    return 0;
}
void BaseModel::revert()
{
    if(_buffJson != _rawJson)
    {
        _buffJson = _rawJson;
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

