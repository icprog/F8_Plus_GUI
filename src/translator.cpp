#include "translator.h"

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
        return str;
}
