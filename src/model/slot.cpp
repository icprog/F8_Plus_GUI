#include "slot.h"
#include <QJsonArray>
#include "interface.h"
Slot::Slot(const QJsonObject& json,QObject *parent) : QObject(parent)
{
    QJsonArray array = json.value("interfaces").toArray();
    m_type = json.value("cardType").toInt();
    for(int i = 0;i < array.count();i++)
    {
        Interface* inerface = new Interface(array[i].toObject());
        m_interfaceList.append(inerface);
    }

}
QList<QObject*> Slot::interfaceList()
{
    return m_interfaceList;
}
Slot::~Slot()
{
    for(int i = 0;i < m_interfaceList.count();i++)
        delete m_interfaceList[i];
    m_interfaceList.clear();
}
