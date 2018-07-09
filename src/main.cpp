#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "modelmanager.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    ModelManager::getInstance()->init();

    QQmlApplicationEngine engine;
    qmlRegisterType<BaseModel>("Backend",1,0,"BaseModel");
    engine.rootContext()->setContextProperty("ModelManager", ModelManager::getInstance());
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
