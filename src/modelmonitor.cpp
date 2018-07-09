#include "modelmonitor.h"
ModelMonitor::ModelMonitor()
{
    start();
    moveToThread(this);
}
void ModelMonitor::run()
{
    exec();
}
void ModelMonitor::registerModel( BaseModel* model)
{
    connect(model,SIGNAL(requestLoad()),this,SLOT(loadModel()),Qt::QueuedConnection);
}
void ModelMonitor::loadModel( )
{
    dynamic_cast<BaseModel*>( sender())->load();
}
