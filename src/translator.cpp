#include "translator.h"
#include <QSettings>
#include "model/languagemodel.h"
#include <QDebug>
#include <QFile>
#include <QTextCodec>
Translator::Translator(QObject *parent) : QObject(parent)
{

}
Translator* Translator::getInstance()
{
    static Translator* _instance = nullptr;
    if(_instance == nullptr)
        _instance = new Translator;
    return _instance;
}
QString Translator::tr(const QString& str){
//    static QSettings configIniRead(":/language.ini", QSettings::IniFormat);

//    LanguageModel* lan = dynamic_cast<LanguageModel*>(LanguageModel::getInstance());
//    if(lan->lang() == "zh")
//        return str;
//    QString key = "/"+QString::fromLatin1( str.toUtf8().data())+"/"+lan->lang();//QSettings 不支持中文作为section，这里转换成lating

//    return configIniRead.value(key).toString();
    return str;
}
