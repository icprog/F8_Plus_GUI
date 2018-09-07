#include "devicedetailmodel.h"
#include "src/modelmanager.h"
RIGSTER_MODEL(DeviceDetailModel)
DeviceDetailModel::DeviceDetailModel()
{
    Arg1 = 0x0100;
    fromWhere = 0;
    setMonitorInterval(60*1000);
    setFileName("DeviceDetail.json");
    setClassName("DeviceDetailModel");
}

