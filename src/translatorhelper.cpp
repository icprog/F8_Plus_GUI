#include "translatorhelper.h"
#include "model/languagemodel.h"
#include <QDebug>
#include "model/devicefirwareversionmodel.h"
TranslatorHelper::TranslatorHelper(QObject *parent) : QObject(parent)
{
    connect(LanguageModel::getInstance(),SIGNAL(langChanged()),this,SLOT(update()));
}
TranslatorHelper* TranslatorHelper::getInstance(){
        static TranslatorHelper* _instance = nullptr;
        if(_instance == nullptr)
            _instance = new TranslatorHelper;
        return _instance;
    }
QObject* TranslatorHelper::translator(){
    return Translator::getInstance();
}
//void TranslatorHelper::changeLanguage(const QString& lang){
//        QTranslator trans;
//        trans.load(":/tr_"+lang+".qm");
//        qApp->installTranslator(&trans);
//        emit translatorChanged();
//    }

 void TranslatorHelper::update()
{
             static QTranslator trans;
             QString lan = dynamic_cast<LanguageModel*>(LanguageModel::getInstance())->lang() == "zh" ? "zh" : "en";
             trans.load(":/tr_"+lan+".qm");
             qApp->installTranslator(&trans);
             emit translatorChanged();
}
