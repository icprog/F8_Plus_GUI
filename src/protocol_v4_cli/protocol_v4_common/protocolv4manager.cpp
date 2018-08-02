#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "protocolv4manager.h"
#include "protocolv4pkghead.h"

ProtocolV4Manager::ProtocolV4Manager(int socketFd)
{
    _fd = socketFd;
}


ProtocolV4Pkg* ProtocolV4Manager::recvPkg()
{
    return ProtocolV4Pkg::recv(_fd);

}

int ProtocolV4Manager::sendPkg(ProtocolV4Pkg* pkg)
{
    return pkg->send(_fd);
}
