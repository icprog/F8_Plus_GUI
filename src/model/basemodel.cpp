#include "basemodel.h"

BaseModel::BaseModel(QObject *parent) : QObject(parent)
{

}
BaseModel* BaseModel::createInstance<T>()
{
    return new T;
}
QJsonValue BaseModel::getValue(const QString& key)
{
    return buffJson.value(key);
}
int BaseModel::load()
{
    QJsonObject rdJson = readLowLevel();
    if(rdJson != rawJson)
    {
        rawJson = rdJson;
        emit dadaChanged();
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
