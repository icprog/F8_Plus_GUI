#include <stdlib.h>
#include <unistd.h>
#include <unistd.h>
#include <string.h>
#include "protocolv4manager.h"
#include <QByteArray>
#include "src/custom_declare.h"
#include <QTimer>
#include "prot_cfg.h"
ProtocolV4Manager::ProtocolV4Manager( ):QObject(NULL)
{
    _client.setParent(this);
}
static int lastErr = 100;
void ProtocolV4Manager::onError(QAbstractSocket::SocketError err)
{
    _isConnected = false;
    if(err != lastErr)
    {
        qWarning("网络错误： %s。",_client.errorString().toUtf8().data());
        lastErr = err;
    }
    QTimer::singleShot(5000,this,SLOT(tryConnect()));
    //qDebug("connect to %s:%d failured.",SERVER_NAME,SERVER_PORT);

}
void ProtocolV4Manager::tryConnect()
{
    if(_client.state() == QTcpSocket::ConnectedState)
    {
        _client.disconnectFromHost();
    }
    _client.connectToHost(SERVER_NAME,SERVER_PORT);

}
void ProtocolV4Manager::onConnected( )
{
    lastErr = 100;
    _isConnected = true;
    qInfo("connect to %s:%d success.",SERVER_NAME,SERVER_PORT);
    emit connected();

}
void ProtocolV4Manager::init( QThread* workThread)
{

    moveToThread(workThread);
    connect(&_client,SIGNAL(error(QAbstractSocket::SocketError)),this,SLOT(onError(QAbstractSocket::SocketError)));
    connect(&_client,SIGNAL(connected()),this,SLOT(onConnected()));
    QTimer::singleShot(0,this,SLOT(tryConnect()));
}

ProtocolV4Pkg& ProtocolV4Manager::recvPkg()
{
    static ProtocolV4Pkg pkg;
    if(!isConnected())
    {
        pkg.isValid = false;
        return pkg;
    }
    return ProtocolV4Pkg::recvPkg(_client,pkg);
}

int ProtocolV4Manager::sendPkg( ProtocolV4Pkg& pkg)
{
    if(!isConnected())
    {
        return -1;
    }
    return pkg.sendPkg(_client);
}
