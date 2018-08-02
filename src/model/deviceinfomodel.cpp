#include "deviceinfomodel.h"

#include "../translatorhelper.h"
DeviceInfoModel::DeviceInfoModel(QObject *parent) : BaseModel(parent)
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(devNameChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(langChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("DevInfo.json");
#endif
}
QString DeviceInfoModel::devName()
{
    return getValue("DEV_NAME").toString();
}
void DeviceInfoModel::setDevName(const QString& devName)
{
    setValue("DEV_NAME",devName);
}


QString DeviceInfoModel::lang()
{
    QString lang = getValue("LANG").toString();
    return lang == ""?"zh":lang;
}
void DeviceInfoModel::setLang(const QString& lang)
{
    if(lang != getValue("LANG").toString())
    {
        setValue("LANG", lang);
        TranslatorHelper::getInstance()->changeLanguage(lang);
    }

}
