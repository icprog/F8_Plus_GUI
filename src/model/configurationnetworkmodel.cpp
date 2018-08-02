#include "configurationnetworkmodel.h"
#include <QDebug>

ConfigurationNetworkModel::ConfigurationNetworkModel(QObject *parent) : BaseModel(parent)
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(macAddrChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(ipDHCPChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(ipAddrChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(netMaskChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(gateWayChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("NetWork.json");
#endif
}

QString ConfigurationNetworkModel::macAddr()
{
    return 0 ? "test":getValue("MAC_ADDR").toString();
}
QString ConfigurationNetworkModel::ipDHCP()
{
    return getValue("IP_DHCP").toString();
}
QString ConfigurationNetworkModel::ipAddr()
{
    return getValue("IP_ADDR").toString();
}
QString ConfigurationNetworkModel::netMask()
{
    return getValue("NET_MASK").toString();
}
QString ConfigurationNetworkModel::gateWay()
{
    return getValue("GATE_WAY").toString();
}

void ConfigurationNetworkModel::setMacAddr(const QString& macAddr)
{
    setValue("MAC_ADDR", macAddr);
}
void ConfigurationNetworkModel::setIpDHCP(const QString& ipDHCP)
{
    setValue("IP_DHCP", ipDHCP);
}
void ConfigurationNetworkModel::setIpAddr(const QString& ipAddr)
{
    setValue("IP_ADDR", ipAddr);
}
void ConfigurationNetworkModel::setNetMask(const QString& netMask)
{
    setValue("NET_MASK", netMask);
}
void ConfigurationNetworkModel::setGateWay(const QString& gateWay)
{
    setValue("GATE_WAY", gateWay);
}



#ifndef DEBUG_WITHOUT_MIDDLEWARE
QJsonObject ConfigurationNetworkModel::readLowLevel()
{
    QFile f( "./NetWork.json");
    if( false == f.open(QIODevice::ReadOnly))
    {
        qDebug("open the json file failure");
        return QJsonObject();
    }
    QByteArray byteArr = f.readAll();
    f.close();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(byteArr);
    return  jsonDoc.object();

}
int ConfigurationNetworkModel::writeLowLevel(const QJsonObject& json)
{
     QJsonDocument jsonDoc(json);
     QFile f("../F8_Plus_GUI/NetWork.json");
     if( false == f.open(QIODevice::WriteOnly))
     {
         qDebug("open the json file failure");
         return -1;
     }
     f.write(jsonDoc.toJson());
     f.close();
     return 0;
}
#endif//DEBUG_WITHOUT_MIDDLEWARE
