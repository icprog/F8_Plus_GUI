#ifndef PROTOCOLV4PKG_H
#define PROTOCOLV4PKG_H
#include "protocolv4pkghead.h"
#include "protocolv4pkgbody.h"
class ProtocolV4Pkg
{
    ProtocolV4PkgHead* _head = nullptr;
    ProtocolV4PkgBody* _body = nullptr;
public:
    ProtocolV4Pkg(ProtocolV4PkgHead* head,ProtocolV4PkgBody* body);
    ~ProtocolV4Pkg();

    static ProtocolV4Pkg* recv(int socket);
    int send(int socket);

};

#endif // PROTOCOLV4PKG_H
