#include "modelmanager.h"
#include "model/configurationnetworkmodel.h"
ModelManager::ModelManager(QObject *parent) : QObject(parent)
{

}

void ModelManager::init()
{
    registerModelClass<ConfigurationNetworkModel>("ConfigurationNetworkModel");
}
void ModelManager::registerModelClass<T>()
{
    modelInfos[T::getInstance()->metaObject()->className()] = &T::getInstance;
}
BaseModel* ModelManager::getModel(const QString& modelName)
{
    return modelName[modelName]();
}
