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
#include  "custom_declare.h"
#include <QThread>


#define RIGSTER_MODEL(CLASS_NAME) \
    static class  __RIGISTER_MODEL_HELPER_CLASS_ ## CLASS_NAME\
    {   \
        public: \
        __RIGISTER_MODEL_HELPER_CLASS_ ## CLASS_NAME()  \
        {   \
            ModelManager::getInstance()->registerModelClass(#CLASS_NAME, CLASS_NAME::getInstance());  \
        }   \
    } __TEMP_OBJECT;

class ModelManager : public QObject
{
    Q_OBJECT
    ModelManager* __instance = NULL;
    //存储具体模型对象的内部私有的结构
    //QHash<const QString,BaseModel* (*)()> modelInfos;
    QHash< QString,BaseModel* > modelInfos;
    explicit ModelManager(QObject *parent = 0);
    QThread _workThread;



public:
    //注册模型对象
    void registerModelClass(const QString& className,BaseModel* model);
    //具体模型需要在此函数内注册入该管理类


    //根据模型类名获取具体模型对象，使用Q_INVOKABLE宏将该函数声明到qml空间
    Q_INVOKABLE QObject* getModel(const QString& modelName);

    DECLARE_GET_INSTANCE(ModelManager)
public slots:
    void init();
    void loadModel( );
private slots:
    void _initModelFromFile();
    void _initModelFromMiddleWare();
signals:
        void requestInit();

};

#endif // MODELMANAGER_H
