#ifndef FIREWAREVERSIONITEM_H
#define FIREWAREVERSIONITEM_H

#include <QObject>

class FirewareVersionItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(const QString& devName READ devName   NOTIFY devNameChanged)
    Q_PROPERTY(const QString& version READ version   NOTIFY versionChanged)
    QString m_devName;
    QString m_version;
public:
    FirewareVersionItem(const QString& devName,const QString& version,QObject *parent = 0) :  QObject(parent)
    {
        m_devName = devName;
        m_version = version;
    }
    const QString& devName() { return m_devName;}
    const QString& version() { return m_version;}

signals:
    void devNameChanged();
    void versionChanged();
};

#endif // FIREWAREVERSIONITEM_H
