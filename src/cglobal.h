#ifndef CGLOBAL_H
#define CGLOBAL_H

#include <QObject>
#include <QMap>
#include "model/basemodel.h"
#include <QList>
class CGlobal : public QObject
{
    Q_OBJECT
    QMap<const QString&,BaseModel*> modelContainer;

    explicit CGlobal(QObject *parent = 0);
    CGlobal* _instance = NULL;
public:
    CGlobal* getInstance();
    BaseModel* getModel(const QString& modelName);

signals:

public slots:
};

#endif // CGLOBAL_H
