#include "translatorhelper.h"

TranslatorHelper::TranslatorHelper(QObject *parent) : QObject(parent)
{

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
void TranslatorHelper::changeLanguage(const QString& lang){
        QTranslator trans;
        trans.load(":/tr_"+lang+".qm");
        qApp->installTranslator(&trans);
        emit translatorChanged();
    }
