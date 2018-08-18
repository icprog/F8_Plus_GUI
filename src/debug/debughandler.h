#ifndef DEBUGHANDLER_H
#define DEBUGHANDLER_H

#include <QThread>
#include <QUdpSocket>
#include <QMutex>
class DebugHandler : public QThread
{
    Q_OBJECT
    QUdpSocket m_client;
    QStringList m_strList;
    QMutex m_mutexStrList;

    bool enable = false;
    void run();
    explicit DebugHandler(QObject *parent = 0);
public:
    static DebugHandler& getInstance();
    void addString(const QString& str);
    QString takeString();

signals:
    void readyRead();
public slots:
void processPendingDatagrams();
void sendDatagrams();
};

#endif // DEBUGHANDLER_H
