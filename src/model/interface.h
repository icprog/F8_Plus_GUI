#ifndef INTERFACE_H
#define INTERFACE_H

#include <QObject>
#include <QJsonObject>
class Interface : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int interfaceType READ interfaceType NOTIFY interfaceTypeChanged)
    Q_PROPERTY(int iSignal READ iSignal NOTIFY iSignalChanged)
    int m_interfaceType;
    int m_iSignal;
public:
    explicit Interface(const QJsonObject& json,QObject *parent = 0);
    int interfaceType(){return m_interfaceType;}
    int iSignal(){
        return m_iSignal;
    }

signals:
    void interfaceTypeChanged();
     void iSignalChanged();
public slots:
};

#endif // INTERFACE_H
