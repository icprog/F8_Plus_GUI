#include "modelmanager.h"
#include <QtDebug>
#include <QEventLoop>
#include <QApplication>
#include "protocol_v4_cli/protocolv4manager.h"
ModelManager::ModelManager(QObject *parent) : QObject(parent)
{

}




void ModelManager::_initModelFromFile()
{
    QList< QString> classNames = modelInfos.keys();
    for(int i = 0 ; i < classNames.length();i++)
    {
        if(modelInfos[classNames[i]]->isFromFile() && modelInfos[classNames[i]]->init() != 0)
            qDebug("init model %s failured.",classNames[i].toUtf8().data());
    }
    qInfo("ModelManager::init completed.");
}
void ModelManager::_initModelFromMiddleWare()
{
    QList< QString> classNames = modelInfos.keys();
    for(int i = 0 ; i < classNames.length();i++)
    {
        if(modelInfos[classNames[i]]->isFromMiddleWare() && modelInfos[classNames[i]]->init() != 0)
            qDebug("init model %s failured.",classNames[i].toUtf8().data());
    }
    qInfo("ModelManager::init completed.");
}
void ModelManager::init()
{
    moveToThread(&_workThread);
    connect(this,SIGNAL(requestInit()),this,SLOT(_initModelFromFile()));
    connect(ProtocolV4Manager::getInstance(),SIGNAL(connected()),this,SLOT(_initModelFromMiddleWare()));

    ProtocolV4Manager::getInstance()->init(&_workThread);
    _workThread.start();
    QTimer::singleShot(0,this,SLOT(_initModelFromFile()));
}

void ModelManager::loadModel( )
{
    if(ProtocolV4Manager::getInstance()->isConnected())
        dynamic_cast<BaseModel*>( sender())->load();
}

void ModelManager::registerModelClass(const QString& className,BaseModel* model)
{
    modelInfos[className] = model;
    connect(model,SIGNAL(requestLoad()),this,SLOT(loadModel()));
}

QObject* ModelManager::getModel(const QString& modelName)
{
    if(!modelInfos.contains(modelName))
    {
        qWarning("%s not register in ModelManager.",modelName.toUtf8().data());
        return nullptr;
    }
    return modelInfos[modelName];
}
