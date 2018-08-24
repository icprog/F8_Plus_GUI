#ifndef TRANSLATOR_H
#define TRANSLATOR_H
#include <QObject>
//#include <QTranslator>
#include "custom_declare.h"
class Translator : public QObject
{
    Q_OBJECT
    explicit Translator(QObject *parent = 0);
public:

    DECLARE_GET_INSTANCE(Translator)
    Q_INVOKABLE QString tr(const QString& str); //获得文本翻译版

};

#endif // TRANSLATOR_H
