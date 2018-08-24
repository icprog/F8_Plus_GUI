#include "utility.h"
#include <sys/socket.h>
 int connect_(int s, const struct sockaddr * name, int namelen)
 {
     return connect(s,name,namelen);
 }
Utility::Utility(QObject *parent) : QObject(parent)
{

}

//void Utility::msleep(unsigned long msecs)
//{
//    QEventLoop loop;
//    QTimer::singleShot(msecs,&loop,SLOT(quit()));
//    loop.exec();
//}
