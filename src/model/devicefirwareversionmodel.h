#ifndef DEVICEFIRWAREVERSIONMODEL_H
#define DEVICEFIRWAREVERSIONMODEL_H
#include "basemodel.h"
#include <QList>
class DeviceFirwareVersionModel : public BaseModel
{
    Q_OBJECT
     Q_PROPERTY(const QList<QObject*>& generalDevices READ generalDevices  NOTIFY generalDevicesChanged)
    Q_PROPERTY(const QList<QObject*>& inputCardDevices READ inputCardDevices  NOTIFY inputCardDevicesChanged)
    Q_PROPERTY(const QList<QObject*>& outputCardDevices READ outputCardDevices  NOTIFY outputCardDevicesChanged)
    DeviceFirwareVersionModel();
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
public:
    DECLARE_GET_INSTANCE(DeviceFirwareVersionModel)

    const QList<QObject*>& generalDevices();
    const QList<QObject*>& inputCardDevices();
    const QList<QObject*>& outputCardDevices();
signals:
    void generalDevicesChanged();
    void inputCardDevicesChanged();
    void outputCardDevicesChanged();
};

#endif // DEVICEFIRWAREVERSIONMODEL_H
