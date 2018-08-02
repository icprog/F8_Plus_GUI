#ifndef PROTOCOLV4PKGBODY_H
#define PROTOCOLV4PKGBODY_H
#include "stdlib.h"

class ProtocolV4PkgBody
{
    char* _buff = nullptr;
    int _len;
public:
    ProtocolV4PkgBody( char* buff,int len);
    ~ProtocolV4PkgBody();
    //发送本包体到socket
    int send(int socket);
    //从socket接收一个len长度的协议包体，失败返回null
    static ProtocolV4PkgBody* recv(int socket,int len);
};

#endif // PROTOCOLV4PKGBODY_H
