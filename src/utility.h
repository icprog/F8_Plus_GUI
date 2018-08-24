#ifndef UTILITY_H
#define UTILITY_H

#include <QObject>
#include <QThread>
#include <QEventLoop>
#include <QTimer>
#include <QMutex>
#include "custom_declare.h"

class Utility : public QObject
{
    Q_OBJECT
    explicit Utility(QObject *parent = 0);
public:
    DECLARE_GET_INSTANCE(Utility)
    Q_INVOKABLE quint64 createMutext()
    {
        return (quint64)new QMutex;
    }
    Q_INVOKABLE bool tryLock(quint64 lock)
    {
        return ((QMutex*)lock)->tryLock();
    }
    Q_INVOKABLE void unLock(quint64 lock)
    {
        ((QMutex*)lock)->unlock();
    }
    //Q_INVOKABLE void msleep(unsigned long msecs);


signals:

public slots:
};

#endif // UTILITY_H
