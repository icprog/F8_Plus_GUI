#include "languagemodel.h"
#include "../translatorhelper.h"
#include "src/modelmanager.h"
RIGSTER_MODEL(LanguageModel)
LanguageModel::LanguageModel()
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(langChanged()));
    setFileName("Language.json");
    setClassName("LanguageModel");
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
