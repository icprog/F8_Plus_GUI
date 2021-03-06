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
#include "../project_cfg.h"
#include "../custom_declare.h"

#define DECLARE_GET_INSTANCE_FOR_MODEL(CLASS_NAME)    __DECLARE_GET_INSTANCE(CLASS_NAME,BaseModel)


class BaseModel : public QObject
{
    Q_OBJECT
    QString _className = "Undefined";
    QTimer _monitorTimer;
    int _monitorInterval = 3000;//监控周期
    QJsonObject _buffJson;  //数据编辑缓存
    QJsonObject _rawJson;   //真实数据关联缓存，时刻与系统真实数据保持一致
    bool _syncFlag = true;         //同步标志，若为真则保持_rawJson的变化立刻反映到_buffJson,否则不立即反映

    Q_PROPERTY(QJsonObject json READ json WRITE setJson  NOTIFY dataChanged)
private:

    QJsonObject _readLowLevelFromMiddleWare();
    QJsonObject _readLowLevelFromFile();
    virtual QJsonObject readLowLevel();
    int _writeLowLevelToMiddleWare(const QJsonObject& );
    int _writeLowLevelToFile(const QJsonObject& json);
    virtual int writeLowLevel(const QJsonObject& ) ;
protected:
    int Arg1;//高8bit基础码+低8bit功能码
    unsigned char Arg2[4] = {0};
    int fromWhere = 0;//model数据来源，0 文件，1 中间件
    void setMonitorInterval(int msecs);
    virtual void loadModel(const QJsonObject& ){}

    void setClassName(const QString& name){_className = name;}
    QString className(){return _className;}
public:
    int init();//做初始装载用
    explicit BaseModel(QObject *parent = 0);
    Q_INVOKABLE void enableSync(){_syncFlag = true;}//开启后台数据自动更新界面显示的功能
    Q_INVOKABLE void disableSync(){_syncFlag = false;}//禁用后台数据自动更新界面显示的功能
    Q_INVOKABLE int flush();                        //把界面数据立即刷入系统环境
    Q_INVOKABLE int load();                         //从系统加载数据
    QJsonValue getValue(const QString& key);        //从数据缓存中解析指定数据项 (供子类调用)
    void setValue(const QString& key,const QJsonValue& value);  //改变指定数据项到数据缓存  (供子类调用)
    int isFromFile(){return fromWhere == 0;}
    int isFromMiddleWare(){return fromWhere == 1;}
public slots:
    Q_INVOKABLE  void revert();                     //_rawJson恢复_buffJson(供子类调用之丢弃界面修改)
    QJsonObject& json();
    void setJson(const QJsonObject& json){_buffJson = json;}

signals:
    void dataChanged(); //数据改变通知,实现供界面数据绑定机制使用
    void requestLoad(); //周期性请求同步底层数据,供数据监控模块机制使用
    void completed();   //对象构建完成通知,实现在基类主动的在子类确实构建完成后执行一些初始化效果
    void revertSignal();

private slots:
    void onCompleted(); //对象构建完成通知处理逻辑,在子类确实构建完成后通过回调执行

/**************** json文件调试 **********************/
private:
    const char* _filePath = "./";
    const char* _defaultFilePath = ":/test-json/";

protected:
        QString _fileName;
        void setFileName(const QString name){_fileName = name;}

};

#endif // BASEMODEL_H
