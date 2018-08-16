#include "DeviceIpModel.h"
#include <QDebug>
#include <QNetworkInterface>
DeviceIpModel::DeviceIpModel(QObject *parent) : BaseModel(parent)
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(ipChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(subnetMaskChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(gatewayChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("DeviceIp.json");
#endif
}

QString DeviceIpModel::mac()
{
    QList<QNetworkInterface> nets = QNetworkInterface::allInterfaces();// 获取所有网络接口列表
        int nCnt = nets.count();
        QString strMacAddr = "";
        for(int i = 0; i < nCnt; i ++)
        {
            // 如果此网络接口被激活并且正在运行并且不是回环地址，则就是我们需要找的Mac地址
            if(nets[i].flags().testFlag(QNetworkInterface::IsUp) && nets[i].flags().testFlag(QNetworkInterface::IsRunning) && !nets[i].flags().testFlag(QNetworkInterface::IsLoopBack))
            {
                strMacAddr = nets[i].hardwareAddress();
                break;
            }
        }
        return strMacAddr;
}
QList<int> DeviceIpModel::ip()
{
    QJsonObject obj = getValue("ip").toObject();
    QList<int>list ;
    list.append(obj["ip0"].toInt());
    list.append(obj["ip1"].toInt());
    list.append(obj["ip2"].toInt());
    list.append(obj["ip3"].toInt());
    return list;
}
QList<int> DeviceIpModel::subnetMask()
{
    QJsonObject obj = getValue("subnetMask").toObject();
    QList<int>list ;
    list.append(obj["subnetMask0"].toInt());
    list.append(obj["subnetMask1"].toInt());
    list.append(obj["subnetMask2"].toInt());
    list.append(obj["subnetMask3"].toInt());
    return list;
}
QList<int> DeviceIpModel::gateway()
{
    QJsonObject obj = getValue("gateway").toObject();
    QList<int>list ;
    list.append(obj["gateway0"].toInt());
    list.append(obj["gateway1"].toInt());
    list.append(obj["gateway2"].toInt());
    list.append(obj["gateway3"].toInt());
    return list;
}


void DeviceIpModel::setIp(QList<int> ip)
{
    QJsonObject obj;
    obj["ip0"] = ip[0];
    obj["ip1"] = ip[1];
    obj["ip2"] = ip[2];
    obj["ip3"] = ip[3];
    setValue("ip",obj);
}
void DeviceIpModel::setSubnetMask(QList<int> subnetMask)
{
    QJsonObject obj;
    obj["subnetMask0"] = subnetMask[0];
    obj["subnetMask1"] = subnetMask[1];
    obj["subnetMask2"] = subnetMask[2];
    obj["subnetMask3"] = subnetMask[3];
    setValue("subnetMask",obj);
}
void DeviceIpModel::setGateway(QList<int> gateway)
{
    QJsonObject obj;
    obj["gateway0"] = gateway[0];
    obj["gateway1"] = gateway[1];
    obj["gateway2"] = gateway[2];
    obj["gateway3"] = gateway[3];
    setValue("gateway",obj);
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
