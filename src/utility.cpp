#include "utility.h"

Utility::Utility(QObject *parent) : QObject(parent)
{

}
Utility* Utility::getInstance()
{
    static Utility* _instance = nullptr;
    if(_instance == nullptr)
        _instance = new Utility;
    return _instance;
}
void Utility::msleep(unsigned long msecs)
{
    QEventLoop loop;
    QTimer::singleShot(msecs,&loop,SLOT(quit()));
    loop.exec();
}
