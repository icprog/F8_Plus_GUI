#ifndef PROTOCOLV4MANAGER_H
#define PROTOCOLV4MANAGER_H
#include "protocolv4pkg.h"

class ProtocolV4Manager
{
    //unix域socket描述符
    int _fd = -1;
public:

    ProtocolV4Manager(int socketFd);

    ProtocolV4Pkg* recvPkg();           //接收数据包,返回非空指针成功,否则失败
    int sendPkg(ProtocolV4Pkg* pkg);   //发数据包,返回0成功,-1失败

};

#endif // PROTOCOLV4MANAGER_H
