#include "protocolv4connector.h"
#include "protocol_v4_common/prot_cfg.h"
#include <string.h>
#include <stdio.h>
#include <unistd.h>
ProtocolV4Connector::ProtocolV4Connector(ProtocolV4Manager* cli)
{
    _cli = cli;
}
ProtocolV4Connector* ProtocolV4Connector::createConnector(const char* servName)
{
    struct sockaddr_un    un;
    int fd = -1;

    memset(&un,0,sizeof(un));
    un.sun_family = AF_UNIX;
    strcpy(un.sun_path, GUI_CLI_ADDR);

    if((fd = socket(AF_UNIX, SOCK_STREAM, 0)) < 0)
    {
        printf("socket failed.\n");
        goto err;
    }
    if(bind(fd, (struct sockaddr *)&un, sizeof(struct sockaddr_un)) < 0)
    {
        printf("bind failed.\n");
        goto err_close_socket;
    }


    strcpy(un.sun_path, servName);
    if(connect(fd,(struct sockaddr*)&un,sizeof(struct sockaddr_un) ) < 0)    /* tell kernel we're a server */
    {
        printf("connect failed.\n");
        goto err_close_socket;
    }
    printf("connect UNIX domain socket success.\n");
    return new ProtocolV4Connector(new ProtocolV4Manager(fd));
err_close_socket:
    close(fd);
err:
    return nullptr;
}
ProtocolV4Connector* ProtocolV4Connector::getInstance(const char* servName)
{
    static ProtocolV4Connector* _instance = nullptr;
    if(_instance == nullptr)
        _instance = createConnector(servName);
    return _instance;
}
ProtocolV4Manager* ProtocolV4Connector::getClient(){return _cli;}
