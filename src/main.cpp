#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include "modelmanager.h"
#include "model/languagemodel.h"

#include "qtlog.h"
#include "translatorhelper.h"
#include "utility.h"
#include <QFontDatabase>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QFont font;
     //font.setPointSize(16);
     font.setFamily(("Microsoft YaHei"));
     app.setFont(font);
    //qInstallMessageHandler(outputMessage);



    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("ModelManager", ModelManager::getInstance());
    engine.rootContext()->setContextProperty("TranslatorHelper", TranslatorHelper::getInstance());
    engine.rootContext()->setContextProperty("Utility", Utility::getInstance());
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    QTimer::singleShot(0, ModelManager::getInstance(),SLOT(init()));
    return app.exec();
}
