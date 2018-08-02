#include "modelmanager.h"
#include "model/configurationnetworkmodel.h"
#include "model/deviceinfomodel.h"
ModelManager::ModelManager(QObject *parent) : QObject(parent)
{

}

void ModelManager::init()
{
    registerModelClass<ConfigurationNetworkModel>();
    registerModelClass<DeviceInfoModel>();
}
ModelManager* ModelManager::getInstance()
    {
        static  ModelManager* __instance = NULL;
        if(__instance == NULL)
            __instance = new ModelManager;
        return __instance;
    }

template<typename T>
void ModelManager::registerModelClass()
{
    modelInfos[T::getInstance()->metaObject()->className()] = &T::getInstance;
}

QObject* ModelManager::getModel(const QString& modelName)
{
    if(!modelInfos.contains(modelName))
    {
        qWarning("%s not register in ModelManager.",modelName.toUtf8().data());
        return nullptr;
    }
    return modelInfos[modelName]();
}
