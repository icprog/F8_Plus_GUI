#include "basemodel.h"
#include "src/modelmonitor.h"
BaseModel::BaseModel(QObject *parent) : QObject(parent)
{
    monitorTimer.setInterval(3000);
    monitorTimer.setSingleShot(false);
    monitorTimer.start();
    connect(&monitorTimer,SIGNAL(timeout()),this,SIGNAL(requestLoad()));

    ModelMonitor::getInstance()->registerModel(this); //注册自身到数据模型监视器
    emit requestLoad(); //立即请求装载一次数据
}

QJsonValue BaseModel::getValue(const QString& key)
{
    return buffJson.value(key);
}
void BaseModel::setValue(const QString& key,const QJsonValue& value)
{
    buffJson[key] = value;
}
int BaseModel::load()
{
    QJsonObject rdJson = readLowLevel();
    if(rdJson != rawJson)
    {
        rawJson = rdJson;
    }
    return 0;
}
void BaseModel::revert()
{
    if(buffJson != rawJson)
    {
        buffJson = rawJson;
        emit dataChanged();
    }

}
int BaseModel::flush()
{
    int err = 0;
    if(rawJson != buffJson)
    {
        err = writeLowLevel(buffJson);
        if( err != 0 )
            return err;
        rawJson = buffJson;
    }
    return 0;

}
