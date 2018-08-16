#ifndef TRANSLATOR_H
#define TRANSLATOR_H
#include <QObject>
//#include <QTranslator>
class Translator : public QObject
{
    Q_OBJECT
    explicit Translator(QObject *parent = 0);
public:

    static Translator* getInstance();           //获取单例
    Q_INVOKABLE QString tr(const QString& str); //获得文本翻译版

};

#endif // TRANSLATOR_H
