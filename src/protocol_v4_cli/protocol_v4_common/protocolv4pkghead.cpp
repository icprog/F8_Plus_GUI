#include "protocolv4pkghead.h"
#include <stdio.h>
#include <unistd.h>
#include <string.h>
ProtocolV4PkgHead::ProtocolV4PkgHead( char *buff, int len)
{
    _buff = buff;
    if(len != LEN)
        printf("创建协议包头对象时长度异常.\n");
}
ProtocolV4PkgHead::~ProtocolV4PkgHead()
{
    if(_buff)
        free(_buff);
}

int ProtocolV4PkgHead::bodyLen()
{
    return *(int*)(_buff+2);
}
int ProtocolV4PkgHead::send(int socket)
{
    int offset = 0;
    do
    {
        int cnt = write(socket,_buff,LEN - offset);
        if(cnt < 0)
            return -1;
        offset += cnt;
    }while(offset < LEN);
    return 0;
}
ProtocolV4PkgHead* ProtocolV4PkgHead::recv(int socket)
{
    int offset = 0;
    int readCnt = 0;
    char* buff = (char*)malloc(LEN);
    memset(buff,0,LEN);

    do{
        readCnt = read(socket,buff+offset,LEN - offset);
        if(readCnt < 0)
        {
            free(buff);
            return nullptr;
        }
        offset += readCnt;
    }while(offset < LEN);

    return new ProtocolV4PkgHead(buff,LEN);
}
