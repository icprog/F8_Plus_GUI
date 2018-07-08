#include "cglobal.h"

CGlobal::CGlobal(QObject *parent) : QObject(parent)
{

}
CGlobal* CGlobal::getInstance()
{
    if(_instance == NULL)
        _instance = new CGlobal;
    return _instance;
}
BaseModel* CGlobal::getModel(const QString& modelName)
{
    if(!modelContainer.contains(modelName))
        modelContainer[modelName] = 1;
    return modelContainer[modelName];

}
