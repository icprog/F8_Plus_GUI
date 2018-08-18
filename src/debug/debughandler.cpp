#include "debughandler.h"
#include <QJsonDocument>
#include <QJsonObject>
#define GROUP_ADDR "239.255.43.21"
#define GROUP_PORT 45454
DebugHandler::DebugHandler(QObject *parent) : QThread(parent)
{
    moveToThread(this);
    start();
}
void DebugHandler::run()
{
          m_client.bind(QHostAddress::AnyIPv4, GROUP_PORT, QUdpSocket::ShareAddress);
          m_client.joinMulticastGroup(QHostAddress(GROUP_ADDR));
          connect(&m_client, SIGNAL(readyRead()),
                        this, SLOT(processPendingDatagrams()),Qt::QueuedConnection);
          connect(this, SIGNAL(readyRead()),
                        this, SLOT(sendDatagrams()),Qt::QueuedConnection);
    exec();
}

DebugHandler& DebugHandler::getInstance(){
    static DebugHandler _instance;
    return _instance;
}
void DebugHandler::addString(const QString& str)
{
    m_mutexStrList.lock();
    m_strList.append(str);
    m_mutexStrList.unlock();
}
QString DebugHandler::takeString()
{
    QString str ;
    m_mutexStrList.lock();
    if(!m_strList.isEmpty())
        str= m_strList.takeFirst();
    m_mutexStrList.unlock();
    return str;
}
void DebugHandler::processPendingDatagrams()
  {
    QByteArray datagram;
      while (m_client.hasPendingDatagrams()) {
          datagram.resize(m_client.pendingDatagramSize());
          m_client.readDatagram(datagram.data(), datagram.size());

      }
      QJsonObject obj = QJsonDocument::fromJson(datagram).object();
      if(obj.value("enable").toBool() == true)
          enable = true;
      else
          enable = false;
  }
void DebugHandler::sendDatagrams()
    {
        QString str;
        str = takeString();
        while(str != "")
        {
            QJsonObject obj;
            obj.insert("print",str);
            QJsonDocument jsonDoc(obj);
            jsonDoc.toJson();
            m_client.writeDatagram(jsonDoc.toJson(),QHostAddress(GROUP_ADDR),GROUP_PORT);
            str = takeString();
        }
    }
