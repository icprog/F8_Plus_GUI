/**
* @projectName   F8_Plus_GUI
* @brief         该类作为业务模型类的基类提供基本通用功能实现
* @author        Zhangxr
* @date          2018-07-09
*/

#ifndef BASEMODEL_H
#define BASEMODEL_H

#include <QObject>
#include <QJsonObject>
#include <QTimer>

#define DECLARE_GET_INSTANCE(CLASS_NAME)    \
    static BaseModel* getInstance()\
    {\
        static  BaseModel* __instance = NULL;\
        if(__instance == NULL)\
            __instance = new CLASS_NAME;\
        return __instance;\
    }


class BaseModel : public QObject
{
    Q_OBJECT
    QTimer monitorTimer;
    QJsonObject buffJson;
    QJsonObject rawJson;

private:

    /** readLowLevel/writeLowLevel设计为虚函数留给具体业务子类确定具体数据与外部交互的形式，
     * 这里为了符合注册入qml引擎的条件，采用简单实现代替纯虚函数。 **/
    virtual QJsonObject readLowLevel() {return QJsonObject();}

    virtual int writeLowLevel(const QJsonObject& ) {return 0;}
public:
    Q_INVOKABLE int flush();
    Q_INVOKABLE int load();
    QJsonValue getValue(const QString& key);
    void setValue(const QString& key,const QJsonValue& value);
    Q_INVOKABLE  void revert();//rawJson恢复buffJson

    explicit BaseModel(QObject *parent = 0);
signals:
    void dataChanged();
    void requestLoad();
public slots:
};

#endif // BASEMODEL_H
