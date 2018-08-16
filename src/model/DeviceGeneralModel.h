#ifndef DEVICE_GENERAL_MODEL_H
#define DEVICE_GENERAL_MODEL_H
#include "basemodel.h"

class DeviceGeneralModel : public BaseModel
{
    Q_OBJECT
    /** 使用Q_PROPERTY宏定义qml域属性 **/
    Q_PROPERTY(const QString name READ name WRITE setName NOTIFY nameChanged)//设备名称

    explicit DeviceGeneralModel(QObject *parent = 0);
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
public:
    DECLARE_GET_INSTANCE(DeviceGeneralModel)

    QString name();
    void setName(const QString& macAddr);

signals:
    void nameChanged();
};

#endif // DEVICE_GENERAL_MODEL_H
