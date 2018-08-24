#include "DeviceIpModel.h"
#include <QNetworkInterface>
#include <QProcess>
#include "src/modelmanager.h"
RIGSTER_MODEL(DeviceIpModel)
//10.66 5200
DeviceIpModel::DeviceIpModel(QObject *parent) : BaseModel(parent)
{
    setFileName("DeviceIp.json");
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


bool DeviceIpModel::testIp(const QString& ip)
{
    QProcess cmd(this);
    cmd.start("ping -c 1 " + ip);

    bool ret = cmd.waitForFinished(100);
    qDebug("%d",ret);
    qDebug()<<cmd.readAllStandardOutput();
    qDebug()<<cmd.readAllStandardError();
    return !ret;
}
