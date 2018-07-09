#include "modelmanager.h"
#include "model/configurationnetworkmodel.h"
ModelManager::ModelManager(QObject *parent) : QObject(parent)
{

}

void ModelManager::init()
{
    registerModelClass<ConfigurationNetworkModel>();
}


template<typename T>
void ModelManager::registerModelClass()
{
    modelInfos[T::getInstance()->metaObject()->className()] = &T::getInstance;
}

BaseModel* ModelManager::getModel(const QString& modelName)
{
    return modelInfos[modelName]();
}
