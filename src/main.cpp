#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include "modelmanager.h"
#include "model/languagemodel.h"
#include "protocol_v4_cli/protocolv4connector.h"
#include "protocol_v4_cli/protocol_v4_common/prot_cfg.h"
#include "qtlog.h"
#include "translatorhelper.h"
#include "utility.h"
#include <QFontDatabase>
static void initLanguage()
{
    TranslatorHelper::getInstance()->update();
}
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QFont font;
     //font.setPointSize(16);
     font.setFamily(("Microsoft YaHei"));
     app.setFont(font);
    //qInstallMessageHandler(outputMessage);

    ModelManager::getInstance()->init();//所有的model会在这里被创建
    ProtocolV4Connector::getInstance(MD_SRV_ADDR);
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ModelManager", ModelManager::getInstance());
    engine.rootContext()->setContextProperty("TranslatorHelper", TranslatorHelper::getInstance());
    engine.rootContext()->setContextProperty("Utility", Utility::getInstance());
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    QTimer::singleShot(10,initLanguage);
    //qDebug("%d\n",5/0);
    return app.exec();
}
