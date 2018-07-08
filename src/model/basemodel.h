#ifndef BASEMODEL_H
#define BASEMODEL_H

#include <QObject>
#include <QJsonObject>
#include <QTimer>

#define DECLARE_GET_INSTANCE(CLASS_NAME)    \
    static CLASS_NAME* getInstance()\
    {\
        static  CLASS_NAME* __instance = NULL;\
        if(__instance == NULL)\
            __instance = new CLASS_NAME;\
    }


class BaseModel : public QObject
{
    Q_OBJECT
    QTimer monitorTimer;
    QJsonObject buffJson;
    QJsonObject rawJson;
private:
    explicit BaseModel(QObject *parent = 0);
    QJsonValue getValue(const QString& key);
    int load();
    virtual QJsonObject readLowLevel() = 0;
    int flush();
    virtual int writeLowLevel(const QJsonObject& json) = 0;
public:
    static virtual BaseModel* getInstance() = 0;

signals:
    void dataChanged();
public slots:
};

#endif // BASEMODEL_H
