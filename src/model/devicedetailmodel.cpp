#include "devicedetailmodel.h"
#include "interface.h"
#include "../translatorhelper.h"
DeviceDetailModel::DeviceDetailModel()
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(slotListChanged()));
    connect(TranslatorHelper::getInstance(),SIGNAL(translatorChanged()),this,SIGNAL(inputListChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("DeviceDetail.json");
#endif
}
QList<QObject*> DeviceDetailModel::slotList(){
    return m_slotList;
}
QStringList DeviceDetailModel::inputList()
{
    int id = 0;
    m_inputList.clear();
    m_inputList.append( "Genlock");
    QJsonArray array =  getValue("slotList").toArray();
    for(int i = 0;i < array.count();i++)
    {
        QJsonObject json = array[i].toObject();
        int type = json.value("cardType").toInt();
        if(type== 2 )
        {
            QJsonArray interfaceArr = json.value("interfaces").toArray();
            for(int i = 0 ;i < interfaceArr.count();i++)
            {
                  m_inputList.append(tr("输入源")+QString::number(id++));
            }
        }
    }
    return m_inputList;
}
void DeviceDetailModel::loadModel(const QJsonObject& json){

    for(int i = 0 ; i < m_slotList.count(); i ++)
        delete m_slotList[i];
    m_slotList.clear();

    m_inputTotal = 0;
    m_inputUsed  = 0;
    m_inputUnUsed = 0;
    m_outputTotal = 0;
    m_outputUsed = 0;
    m_outputUnUsed = 0;

    QJsonArray array =  json.value("slotList").toArray();
    for(int i = 0;i < array.count();i++)
    {
        Slot* slot =  new Slot(array[i].toObject());
        m_slotList.append(slot);

        if(slot->type() == 2 || slot->type() == 3)
        {
             int* total = nullptr;
             int* used = nullptr;
             int* unused = nullptr;
             if( slot->type() == 2 )
             {
                  total = &m_inputTotal;
                  used = &m_inputUsed;
                  unused = &m_inputUnUsed;
             }
             else
             {
                 total = &m_outputTotal;
                 used = &m_outputUsed;
                 unused = &m_outputUnUsed;
             }
            for(int i = 0;i < slot->interfaceList().count();i++)
            {
                (*total)++;
                Interface *interface = dynamic_cast<Interface*>(slot->interfaceList()[i]);
                if(interface->iSignal() == 0)
                    (*used)++;
                else
                    (*unused)++;
            }
        }
    }
}
