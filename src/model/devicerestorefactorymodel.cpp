#include "devicerestorefactorymodel.h"

DeviceRestoreFactoryModel::DeviceRestoreFactoryModel()
{
    setMonitorInterval(0);
    //connect(this,SIGNAL(dataChanged()),this,SIGNAL(restoreTypeChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("DeviceRestoreFactory.json");
#endif
}
int DeviceRestoreFactoryModel::restoreType()
{
    int type = getValue("restoreType").toInt();
    if(type == 2 || type == 3)
        type--;
    return type;
}
void DeviceRestoreFactoryModel::setRestoreType(int restoreType)
{
    if(restoreType == 2)
        restoreType++;
    setValue("restoreType",restoreType);
}
