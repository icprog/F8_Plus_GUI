/**
* @projectName   F8_Plus_GUI
* @brief         该类作为数据模型的容器，将需要用的数据对象注册其中，以便统一存取/处理
* @author        Zhangxr
* @date          2018-07-09
*/
#ifndef MODELMANAGER_H
#define MODELMANAGER_H

#include <QObject>
#include "model/basemodel.h"
#include <QHash>
class ModelManager : public QObject
{
    Q_OBJECT
    ModelManager* __instance = NULL;
    //存储具体模型对象的内部私有的结构
    QHash<const QString,BaseModel* (*)()> modelInfos;
    explicit ModelManager(QObject *parent = 0);

    //注册模型对象，模板参数T应为具体数据模型类名
    template<typename T>
    void registerModelClass();

public:
    //具体模型需要在此函数内注册入该管理类
    void init();

    //根据模型类名获取具体模型对象，使用Q_INVOKABLE宏将该函数声明到qml空间
    Q_INVOKABLE BaseModel* getModel(const QString& modelName);

    static ModelManager* getInstance()
    {
        static  ModelManager* __instance = NULL;
        if(__instance == NULL)
            __instance = new ModelManager;
        return __instance;
    }


signals:

public slots:
};

#endif // MODELMANAGER_H
