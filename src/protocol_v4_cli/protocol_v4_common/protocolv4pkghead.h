#ifndef PROTOCOLV4PKGHEAD_H
#define PROTOCOLV4PKGHEAD_H
#include <stdlib.h>

//测试用例简单暂定包长为4
//55H   -   AAH     //固定协议头
//LEN_L -   LEN_B   //包体长,小段存放
class ProtocolV4PkgHead
{

    char* _buff = nullptr;                  //包头缓冲区
public:
    static const int LEN = 4;               //包头长度
    ProtocolV4PkgHead(char* buff,int len);
    ~ProtocolV4PkgHead();                   //释放包头对象中的动态内存

    //发送本包头到socket
    int send(int socket);
    //从socket接收一个协议包头，失败返回null
    static ProtocolV4PkgHead* recv(int socket);
    int bodyLen();

    //协议包头其他字段...

};

#endif // PROTOCOLV4PKGHEAD_H
