#ifndef SLOT_H
#define SLOT_H

#include <QObject>
#include <QJsonObject>
class Slot : public QObject
{
    Q_OBJECT
    QList<QObject*> m_interfaceList;
    Q_PROPERTY(QList<QObject*> interfaceList READ interfaceList   NOTIFY interfaceListChanged)
    int m_type;
public:
    explicit Slot(const QJsonObject& json,QObject *parent = 0);
    QList<QObject*> interfaceList();
    ~Slot();
signals:
    void interfaceListChanged();
public :
    int type(){return m_type;}

};

#endif // SLOT_H
