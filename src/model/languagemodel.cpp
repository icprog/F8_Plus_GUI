#include "languagemodel.h"
#include "../translatorhelper.h"
LanguageModel::LanguageModel()
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(langChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("Language.json");
#endif
}
QString LanguageModel::lang()
{
    QString lang = getValue("lang").toString();
    return lang == ""?"zh":lang;
}
void LanguageModel::setLang(const QString& lang)
{
    if(lang != getValue("lang").toString())
    {
        setValue("lang", lang);
    }

}
