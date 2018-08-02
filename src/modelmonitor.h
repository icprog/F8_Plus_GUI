/**
* @projectName   F8_Plus_GUI
* @brief         该类用于监控模型数据对应的外部数据变化，确保模型数据对象与外部真实数据保持一致
* @author        Zhangxr
* @date          2018-07-09
*/
#ifndef MODELMONITOR_H
#define MODELMONITOR_H
#include <QThread>
#include "model/basemodel.h"
class ModelMonitor : public QThread
{
    Q_OBJECT
    ModelMonitor();
public:
    static ModelMonitor* getInstance();
    //注册待监控模型数据对象
    void registerModel( BaseModel* model);
    void run();
public slots:
    void loadModel( );
};

#endif // MODELMONITOR_H
