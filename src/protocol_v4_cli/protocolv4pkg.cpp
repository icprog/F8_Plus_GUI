#include "protocolv4pkg.h"
#include <QJsonArray>
ProtocolV4Pkg::ProtocolV4Pkg()
{

}
void ProtocolV4Pkg::load(const QByteArray& buff)
{
    int dataLen = *(quint16*)(buff.data()+16) - 14;
    QByteArray jsonStr(buff.data()+32,dataLen);
    json =  QJsonDocument::fromJson(jsonStr).array()[0].toObject();
        Ack = buff[2];
}



ProtocolV4Pkg& ProtocolV4Pkg::recvPkg( QTcpSocket& socket,ProtocolV4Pkg& pkg)
{
    QByteArray buff;
     int dataLen = 0;
    do{
        if(!socket.waitForReadyRead(3000))
            goto err;
        buff += socket.readAll();
    }while(buff.length() < 34);
    dataLen = *((int*)(buff.data()+16)) - 14; //需要减去4代扩充头
    if(dataLen > 0)
    {
        while(buff.length() <dataLen + 34)
        {
            if(!socket.waitForReadyRead(3000))
                goto err;
            buff += socket.readAll();
        }
    }
    pkg.isValid = true;
    pkg.load(buff);
    return pkg;
err:
    pkg.isValid = false;
    return pkg;
}
QByteArray ProtocolV4Pkg::getBuff()
{
    QByteArray jsonStr;
    if(!json.isEmpty())
    {
        QJsonArray array;
        array.append(json);
        jsonStr =QJsonDocument ( array).toJson();
    }

    QByteArray buff(jsonStr.length()+34,0);
    memcpy(buff.data(),&Flag,2);
    memcpy(buff.data(),&Flag,2);
    buff[6] = DeviceType;
    buff[10] = Code;
    buff[11] = PacketType;
    *(quint16*)(buff.data()+16) = 14+jsonStr.length();
    buff[20] = ApolloCode;
     *(quint16*)(buff.data()+25) =Arg1;
    buff[27] = Arg2[3];
    buff[28] = Arg2[2];
    buff[29] = Arg2[1];
    buff[30] = Arg2[0];
    memcpy(buff.data()+32,jsonStr.data(),jsonStr.length());
    return buff;
}
int ProtocolV4Pkg::sendPkg( QTcpSocket& socket)    //发数据包,返回0成功,-1失败
{
    QByteArray buff = getBuff();
    int offset = 0;
    do
    {
        int cnt = socket.write(buff.data(),buff.length() - offset);
        if(cnt < 0)
            return -1;
        offset += cnt;
    }while(offset < buff.length() );
    return 0;
}
