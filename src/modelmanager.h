#ifndef MODELMANAGER_H
#define MODELMANAGER_H

#include <QObject>
#include "model/basemodel.h"
#include <QHash>
class ModelManager : public QObject
{
    Q_OBJECT
    ModelManager* __instance = NULL;
    QHash<const QString&,BaseModel* (*)()> modelInfos;
    explicit ModelManager(QObject *parent = 0);
    void registerModelClass<T>();

public:
    void init();
    Q_INVOKABLE BaseModel* getModel(const QString& modelName);

    DECLARE_GET_INSTANCE(ModelManager)
signals:

public slots:
};

#endif // MODELMANAGER_H
