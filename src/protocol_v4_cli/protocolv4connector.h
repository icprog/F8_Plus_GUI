#ifndef PROTOCOLV4CONNECTOR_H
#define PROTOCOLV4CONNECTOR_H
#include <sys/socket.h>
#include <sys/un.h>
#include "protocol_v4_common/protocolv4manager.h"
class ProtocolV4Connector
{
    //用于侦听的中间件协议客户端
    ProtocolV4Manager* _cli = nullptr;
    ProtocolV4Connector(ProtocolV4Manager* cli);
    //创建一个中间件协议连接器，若失败则返回null
    static ProtocolV4Connector* createConnector(const char* servName);
public:
    static ProtocolV4Connector* getInstance(const char* servName);

    ProtocolV4Manager* getClient();

};

#endif // PROTOCOLV4CONNECTOR_H
