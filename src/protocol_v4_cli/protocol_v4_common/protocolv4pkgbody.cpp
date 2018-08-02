#include "protocolv4pkgbody.h"
#include <unistd.h>
#include <string.h>
ProtocolV4PkgBody::ProtocolV4PkgBody( char* buff,int len)
{
    _buff = buff;
    _len = len;
}
ProtocolV4PkgBody::~ProtocolV4PkgBody()
{
    if(_buff)
        free(_buff);
}


int ProtocolV4PkgBody::send(int socket)
{
    int offset = 0;
    do
    {
        int cnt = write(socket,_buff,_len - offset);
        if(cnt < 0)
            return -1;
        offset += cnt;
    }while(offset < _len);
    return 0;
}
ProtocolV4PkgBody* ProtocolV4PkgBody::recv(int socket,int len)
{
    int offset = 0;
    int readCnt = 0;
    char* bodyBuff = (char*)malloc(len);
    memset(bodyBuff,0,len);

    do{
        readCnt = read(socket,bodyBuff+offset,len - offset);
        if(readCnt < 0)
        {
            free(bodyBuff);
            return nullptr;
        }
        offset += readCnt;
    }while(offset < len);

    return new ProtocolV4PkgBody(bodyBuff,len);
}
