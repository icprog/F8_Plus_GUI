#ifndef DEVICEFIRWAREVERSIONMODEL_H
#define DEVICEFIRWAREVERSIONMODEL_H
#include "basemodel.h"
#include <QList>
class DeviceFirwareVersionModel : public BaseModel
{
    DeviceFirwareVersionModel();
public:
    DECLARE_GET_INSTANCE_FOR_MODEL(DeviceFirwareVersionModel)
};

#endif // DEVICEFIRWAREVERSIONMODEL_H
