#ifndef CONFIGURATIONNETWORKMODEL_H
#define CONFIGURATIONNETWORKMODEL_H

#include <QObject>
#include "basemodel.h"

class ConfigurationNetworkModel : public BaseModel
{
    Q_OBJECT
    Q_PROPERTY(const QString& macAddr READ macAddr WRITE setMacAddr NOTIFY macAddrChanged)
    Q_PROPERTY(const QString& ipDHCP READ ipDHCP WRITE setIpDHCP NOTIFY ipDHCPChanged)
    Q_PROPERTY(const QString& ipAddr READ ipAddr WRITE setMacAddr NOTIFY ipAddrChanged)
    Q_PROPERTY(const QString& netMask READ netMask WRITE setMacAddr NOTIFY netMaskChanged)
    Q_PROPERTY(const QString& gateWay READ gateWay WRITE setMacAddr NOTIFY gateWayChanged)
    explicit ConfigurationNetworkModel(QObject *parent = 0);
public:
    DECLARE_GET_INSTANCE(ConfigurationNetworkModel)

    const QString& gateWay();

signals:
    void macAddrChanged();
public slots:

};

#endif // CONFIGURATIONNETWORKMODEL_H
