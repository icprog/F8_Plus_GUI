#ifndef DEVICEINFOMODEL_H
#define DEVICEINFOMODEL_H
#include "basemodel.h"

class DeviceInfoModel : public BaseModel
{
    Q_OBJECT
    /** 使用Q_PROPERTY宏定义qml域属性 **/
    Q_PROPERTY(const QString& devName READ devName WRITE setDevName NOTIFY devNameChanged)//设备名称
    Q_PROPERTY(const QString& lang READ lang WRITE setLang NOTIFY langChanged)//语言，暂时放这里

    explicit DeviceInfoModel(QObject *parent = 0);
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
public:
    DECLARE_GET_INSTANCE(DeviceInfoModel)

    QString devName();
    void setDevName(const QString& macAddr);
    QString lang();
    void setLang(const QString& lang);
signals:
    void devNameChanged();
    void langChanged();
public slots:
};

#endif // DEVICEINFOMODEL_H
