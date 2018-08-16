#ifndef TRANSLATORHELPER_H
#define TRANSLATORHELPER_H

#include <QObject>
#include <QTranslator>
#include <QApplication>
#include "translator.h"
class TranslatorHelper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject* translator READ translator  NOTIFY translatorChanged)   //动态语言绑定的实现基础
    explicit TranslatorHelper(QObject *parent = 0);

    //void changeLanguage(const QString& lang);
public:
    static TranslatorHelper* getInstance();
    QObject* translator();
signals:
    void translatorChanged();   //当语言选项发生变化是出发通知
public slots:

    void update();
};

#endif // TRANSLATORHELPER_H
