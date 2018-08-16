#include "preset.h"

Preset::Preset(const QJsonObject& json,QObject *parent) : QObject(parent)
{
    if(json.isEmpty())
        m_presetId = -1;
    else
    {
        m_name = json.value("name").toString();
        m_presetId = json.value("presetId").toInt();
    }

}
