#include "devicefirwareversionmodel.h"
#include "firewareversionitem.h"
#include <QJsonArray>
#include "languagemodel.h"
#include <QApplication>
#include <QDebug>
#include <QTranslator>
#include "../translatorhelper.h"
DeviceFirwareVersionModel::DeviceFirwareVersionModel()
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(generalDevicesChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(inputCardDevicesChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(outputCardDevicesChanged()));

    connect(TranslatorHelper::getInstance(),SIGNAL(translatorChanged()),this,SIGNAL(dataChanged()));
    //connect(LanguageModel::getInstance(),SIGNAL(langChanged()),this,SIGNAL(dataChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("DeviceFirwareVersion.json");
#endif
}
const QList<QObject*>& DeviceFirwareVersionModel::generalDevices()
{
    static  QList<QObject*>list;
    for(int i = 0;i<  list.count();i++) {
        delete list[i];
    }
    list.clear();

    FirewareVersionItem* item = new FirewareVersionItem (tr("主控卡"),getValue("version").toString());
    list.append(item);
    item = new FirewareVersionItem (tr("背板"),getValue("backplane").toObject()["version"].toString());
    list.append(item);
    return list;
}

const QList<QObject*>& DeviceFirwareVersionModel::inputCardDevices()
{
    static  QList<QObject*>list;
    for(int i = 0;i<  list.count();i++) {
        delete list[i];
    }
    list.clear();
    QJsonArray array = getValue("inputCard" ).toArray();
    FirewareVersionItem* item = nullptr;
    for(int i = 0; i< array.count();i++)
    {
        item = new FirewareVersionItem (tr("输入卡槽")+QString::number(i+1),array[i].toObject().value("version").toString());
        list.append(item);
    }
    return list;
}

const QList<QObject*>& DeviceFirwareVersionModel::outputCardDevices()
{
    static  QList<QObject*>list;
    for(int i = 0;i<  list.count();i++) {
        delete list[i];
    }
    list.clear();
    QJsonArray array = getValue("outputCard" ).toArray();
    FirewareVersionItem* item = nullptr;
    for(int i = 0; i< array.count();i++)
    {
        item = new FirewareVersionItem (tr("输出卡槽")+QString::number(i+1),array[i].toObject().value("version").toString());
        list.append(item);
    }
    return list;
}
