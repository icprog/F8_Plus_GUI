#include "DeviceGeneralModel.h"


DeviceGeneralModel::DeviceGeneralModel(QObject *parent) : BaseModel(parent)
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(nameChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("DeviceGeneral.json");
#endif
}
QString DeviceGeneralModel::name()
{
    return getValue("name").toString();
}
void DeviceGeneralModel::setName(const QString& name)
{
    setValue("name",name);
}


