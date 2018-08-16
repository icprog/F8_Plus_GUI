#include "modelmanager.h"
#include "model/DeviceIpModel.h"
#include "model/DeviceGeneralModel.h"
#include "model/devicerestorefactorymodel.h"
#include "model/languagemodel.h"
#include "model/devicefirwareversionmodel.h"
#include "model/devicedetailmodel.h"
#include "model/mvrenablemodel.h"
#include "model/devicegenlockmodel.h"
#include "model/presetsmodel.h"

ModelManager::ModelManager(QObject *parent) : QObject(parent)
{

}

void ModelManager::init()
{
    registerModelClass<DeviceIpModel>();
    registerModelClass<DeviceGeneralModel>();
    registerModelClass<LanguageModel>();
    registerModelClass<DeviceRestoreFactoryModel>();
    registerModelClass<DeviceFirwareVersionModel>();
    registerModelClass<DeviceDetailModel>();
    registerModelClass<MVREnableModel>();
    registerModelClass<DeviceGenlockModel>();
    registerModelClass<PresetsModel>();
}
ModelManager* ModelManager::getInstance()
    {
//        static  ModelManager* __instance = NULL;
//        if(__instance == NULL)
//            __instance = new ModelManager;
    static  ModelManager __instance;
        return &__instance;
    }

template<typename T>
void ModelManager::registerModelClass()
{
    modelInfos[T::getInstance()->metaObject()->className()] = T::getInstance();
}

QObject* ModelManager::getModel(const QString& modelName)
{
    if(!modelInfos.contains(modelName))
    {
        qWarning("%s not register in ModelManager.",modelName.toUtf8().data());
        return nullptr;
    }
    //qDebug("get getInstance of model : %s(%p).",modelName.toUtf8().data(),modelInfos[modelName]);

    return modelInfos[modelName];
}
