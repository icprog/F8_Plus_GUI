/**
* @projectName   F8_Plus_GUI
* @brief         该类实现具体的网络配置业务，包含网络信息具体参数及与外部具体交换数据的接口
* @author        Zhangxr
* @date          2018-07-09
*/
#ifndef DEVICE_IP_MODEL_H
#define DEVICE_IP_MODEL_H

#include <QObject>
#include "basemodel.h"

class DeviceIpModel : public BaseModel
{
    Q_OBJECT
    /** 使用Q_PROPERTY宏定义qml域属性 **/
    Q_PROPERTY( QString mac READ mac  NOTIFY macChanged)//mac地址
    Q_PROPERTY( QList<int> ip READ ip WRITE setIp NOTIFY ipChanged)//ip地址
    Q_PROPERTY( QList<int> subnetMask READ subnetMask WRITE setSubnetMask NOTIFY subnetMaskChanged)//子网掩码
    Q_PROPERTY( QList<int> gateway READ gateway  NOTIFY gatewayChanged)//网关
    explicit DeviceIpModel(QObject *parent = 0);
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
public:
    DECLARE_GET_INSTANCE(DeviceIpModel)

    QString mac();
    QList<int> ip();
    QList<int> subnetMask();
    QList<int> gateway();


    void setIp(QList<int> ip);
    void setSubnetMask( QList<int> netMask);
    void setGateway( QList<int> gateWay);


signals:
    void macChanged();
    void ipChanged();
    void subnetMaskChanged();
    void gatewayChanged();

};

#endif // DEVICE_IP_MODEL_H
