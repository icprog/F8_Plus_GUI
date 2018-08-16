#ifndef DEVICERESTOREFACTORYMODEL_H
#define DEVICERESTOREFACTORYMODEL_H
#include "../model/basemodel.h"

class DeviceRestoreFactoryModel : public BaseModel
{
    Q_OBJECT
    Q_PROPERTY(int restoreType READ restoreType WRITE setRestoreType NOTIFY restoreTypeChanged)
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
    DeviceRestoreFactoryModel();
public:
    DECLARE_GET_INSTANCE(DeviceRestoreFactoryModel)

    int restoreType();
    void setRestoreType(int restoreType);
signals:
    void restoreTypeChanged();
};

#endif // DEVICERESTOREFACTORYMODEL_H
