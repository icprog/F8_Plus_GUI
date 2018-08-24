#ifndef PROTOCOLV4PKG_H
#define PROTOCOLV4PKG_H
#include <QByteArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QTcpSocket>
class ProtocolV4Pkg
{
    QByteArray getBuff();
public:
    bool isValid = true;
    static const int Flag = 0xaa55;
    static const int DeviceType = 0x04;
    static const int PacketType = 0x30;
    int Code = 0;//0 读/1 写
    int ApolloCode = 1;//1 读/2 写
    int  Arg1 = 0x1000;//高8基础码，低8功能码
    unsigned char Arg2[4] = {0};
    QJsonObject json;
    ProtocolV4Pkg();
    void load(const QByteArray & buff);
    static  ProtocolV4Pkg& recvPkg( QTcpSocket& socket,ProtocolV4Pkg& pkg);
    int sendPkg( QTcpSocket& socket) ;   //发数据包,返回0成功,-1失败

};

#endif // PROTOCOLV4PKG_H
