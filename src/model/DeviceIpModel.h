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
    explicit DeviceIpModel(QObject *parent = 0);
public:
    DECLARE_GET_INSTANCE_FOR_MODEL(DeviceIpModel)

    QString mac();
    Q_INVOKABLE bool testIp(const QString& ip);


signals:
    void macChanged();

};

#endif // DEVICE_IP_MODEL_H
