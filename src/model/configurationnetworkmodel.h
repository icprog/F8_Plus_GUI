/**
* @projectName   F8_Plus_GUI
* @brief         该类实现具体的网络配置业务，包含网络信息具体参数及与外部具体交换数据的接口
* @author        Zhangxr
* @date          2018-07-09
*/
#ifndef CONFIGURATIONNETWORKMODEL_H
#define CONFIGURATIONNETWORKMODEL_H

#include <QObject>
#include "basemodel.h"

class ConfigurationNetworkModel : public BaseModel
{
    Q_OBJECT
    /** 使用Q_PROPERTY宏定义qml域属性 **/
    Q_PROPERTY(const QString& macAddr READ macAddr WRITE setMacAddr NOTIFY macAddrChanged)//物理地址
    Q_PROPERTY(const QString& ipDHCP READ ipDHCP WRITE setIpDHCP NOTIFY ipDHCPChanged)//IP配置方式
    Q_PROPERTY(const QString& ipAddr READ ipAddr WRITE setMacAddr NOTIFY ipAddrChanged)//ip地址
    Q_PROPERTY(const QString& netMask READ netMask WRITE setMacAddr NOTIFY netMaskChanged)//子网掩码
    Q_PROPERTY(const QString& gateWay READ gateWay WRITE setMacAddr NOTIFY gateWayChanged)//网关
    explicit ConfigurationNetworkModel(QObject *parent = 0);
    QJsonObject readLowLevel();
    int writeLowLevel(const QJsonObject& json);
public:
    DECLARE_GET_INSTANCE(ConfigurationNetworkModel)

    QString macAddr();
    QString ipDHCP();
    QString ipAddr();
    QString netMask();
    QString gateWay();

    void setMacAddr(const QString& macAddr);
    void setIpDHCP(const QString& ipDHCP);
    void setIpAddr(const QString& ipAddr);
    void setNetMask(const QString& netMask);
    void setGateWay(const QString& gateWay);


signals:
    void macAddrChanged();
    void ipDHCPChanged();
    void ipAddrChanged();
    void netMaskChanged();
    void gateWayChanged();
public slots:

};

#endif // CONFIGURATIONNETWORKMODEL_H
