#include "protocolv4pkg.h"
#include "protocolv4pkghead.h"
ProtocolV4Pkg::ProtocolV4Pkg(ProtocolV4PkgHead* head,ProtocolV4PkgBody* body)
{
    _head = head;
    _body = body;
}
ProtocolV4Pkg::~ProtocolV4Pkg()
{
    if(_head)
        delete _head;
    if(_body)
        delete _body;
}

ProtocolV4Pkg* ProtocolV4Pkg::recv(int socket)
{
    ProtocolV4PkgHead* head = ProtocolV4PkgHead::recv(socket);
    if(head == nullptr)
        return nullptr;
    if( 0 == head->bodyLen() )
        return new ProtocolV4Pkg(head,nullptr);
    ProtocolV4PkgBody* body =  ProtocolV4PkgBody::recv(socket,head->bodyLen());
    if(body == nullptr)
    {
        delete head;
        return nullptr;
    }
    return new ProtocolV4Pkg(head,body);
}

int ProtocolV4Pkg::send(int socket)
{
    if(_head->send(socket) < 0)
        return -1;

    if(_body == nullptr )
        return 0;
    if(_body->send(socket) < 0 )
            return -1;
    return 0;
}
