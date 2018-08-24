#ifndef DEVICE_GENERAL_MODEL_H
#define DEVICE_GENERAL_MODEL_H
#include "basemodel.h"

class DeviceGeneralModel : public BaseModel
{
    explicit DeviceGeneralModel(QObject *parent = 0);

public:
    DECLARE_GET_INSTANCE_FOR_MODEL(DeviceGeneralModel)

};

#endif // DEVICE_GENERAL_MODEL_H
