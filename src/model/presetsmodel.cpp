#include "presetsmodel.h"
#include <QJsonArray>
PresetsModel::PresetsModel()
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(presets1Changed()));
     connect(this,SIGNAL(dataChanged()),this,SIGNAL(presets2Changed()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("Presets.json");
#endif
}
void PresetsModel::loadModel(const QJsonObject & json)
{
    for(int i = 0 ;i < m_presetsList1.count();i++)
        delete m_presetsList1[i];
    m_presetsList1.clear();
    for(int i = 0 ;i < m_presetsList2.count();i++)
        delete m_presetsList2[i];
    m_presetsList2.clear();
     QJsonArray array = json.value("presets").toArray();
     Preset* set = nullptr;
     for( int i = 0; i< array.count()/2;i++)
     {
         set = new Preset(array[i*2].toObject());
         m_presetsList1.append(set);
         set = new Preset(array[i*2+1].toObject());
         m_presetsList2.append(set);
     }
     if(array.count()%2 == 1)
     {
        set = new Preset(array[array.count()-1].toObject());
        m_presetsList1.append(set);
        set = new Preset(QJsonObject());
        m_presetsList2.append(set);
     }
}
PresetsModel::~PresetsModel()
{
    for(int i = 0 ;i < m_presetsList1.count();i++)
        delete m_presetsList1[i];
    m_presetsList1.clear();
    for(int i = 0 ;i < m_presetsList2.count();i++)
        delete m_presetsList2[i];
    m_presetsList2.clear();

}
