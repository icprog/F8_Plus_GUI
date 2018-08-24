#include <QJsonDocument>
#include <QFile>
#include <QDebug>
#include <QFileInfo>
#include "basemodel.h"
#include "src/modelmanager.h"
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
    connect(&_monitorTimer,SIGNAL(timeout()),this,SIGNAL(requestLoad()));
    enableSync();
    //emit requestLoad(); //立即请求装载一次数据
}
int BaseModel::init()
{
    return load();
}

QJsonObject& BaseModel::json(){
    return _buffJson;
}
QJsonValue BaseModel::getValue(const QString& key)
{
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


QJsonObject BaseModel::readLowLevel()
{
    switch (fromWhere) {
    case 0:
        return _readLowLevelFromFile();
        break;
    case 1:
        return _readLowLevelFromMiddleWare();
    default:
        return QJsonObject();
        break;
    }
}
#include "src/protocol_v4_cli/protocolv4manager.h"
QJsonObject BaseModel::_readLowLevelFromMiddleWare()
{
    ProtocolV4Pkg pkg;
    pkg.Code = 0;
    pkg.ApolloCode = 1;
    pkg.Arg1 = Arg1;
    memcpy(pkg.Arg2,Arg2,4);
    if(0 != ProtocolV4Manager::getInstance()->sendPkg(pkg))
    {
        qWarning("send %s failure",this->className().toUtf8().data());
        return QJsonObject();
    }
    ProtocolV4Pkg& recvPkg = ProtocolV4Manager::getInstance()->recvPkg();
    if(!recvPkg.isValid)
    {
        qWarning("recv %s failure",this->className().toUtf8().data());
        return QJsonObject();
    }
    return recvPkg.json;
}
QJsonObject BaseModel::_readLowLevelFromFile()
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
        qWarning("open the json file for read failure");
        return QJsonObject();
    }

    QJsonDocument jsonDoc = QJsonDocument::fromJson(f.readAll());
    f.close();
    return  jsonDoc.object();


}
int BaseModel::writeLowLevel(const QJsonObject& json)
{
    int ret = 0;
    switch (fromWhere) {
    case 0:
        ret = _writeLowLevelToFile(json);
        break;
    case 1:
        ret = _writeLowLevelToMiddleWare(json);
    default:
        ret = -1;
        break;
    }
    if(ret != 0 )
        qWarning( "%s writeLowLevel failure.",this->metaObject()->className() );
    return ret;
}
int BaseModel::_writeLowLevelToMiddleWare(const QJsonObject& )
{
    return 0;
}
int BaseModel::_writeLowLevelToFile(const QJsonObject& json)
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


