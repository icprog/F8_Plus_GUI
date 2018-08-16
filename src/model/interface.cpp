#include "interface.h"

Interface::Interface(const QJsonObject& json,QObject *parent) : QObject(parent)
{
    m_interfaceType = json.value("interfaceType").toInt();
    m_iSignal =  json.value("iSignal").toInt();
}
