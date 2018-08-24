#include "DeviceGeneralModel.h"
#include "src/modelmanager.h"
RIGSTER_MODEL(DeviceGeneralModel)
DeviceGeneralModel::DeviceGeneralModel(QObject *parent) : BaseModel(parent)
{
    setFileName("DeviceGeneral.json");
}
