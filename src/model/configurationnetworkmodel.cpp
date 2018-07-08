#include "configurationnetworkmodel.h"

ConfigurationNetworkModel::ConfigurationNetworkModel(QObject *parent) : QObject(parent)
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(macAddrChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(ipDHCPChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(ipAddrChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(netMaskChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(gateWayChanged()));
}
const QString& ConfigurationNetworkModel::gateWay()
{
    return getValue("MAC_ADDR").toString();
}
