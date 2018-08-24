#ifndef PROTOCOLV4MANAGER_H
#define PROTOCOLV4MANAGER_H
#include <QTcpSocket>
#include "protocolv4pkg.h"
#include "src/custom_declare.h"
class ProtocolV4Manager : public QObject
{
    Q_OBJECT
    //unix域socket描述符
    QTcpSocket _client;
    ProtocolV4Manager();
    bool _isConnected;
public:
    void init(QThread* workThread);
    DECLARE_GET_INSTANCE(ProtocolV4Manager)

    ProtocolV4Pkg& recvPkg();           //接收数据包,返回非空指针成功,否则失败
    int sendPkg( ProtocolV4Pkg& pkg);   //发数据包,返回0成功,-1失败
    bool isConnected(){
        return _isConnected == true;
    }
public slots:
    void tryConnect();
    void onError(QAbstractSocket::SocketError err);
    void onConnected( );
signals:
    void connected();
};

#endif // PROTOCOLV4MANAGER_H
