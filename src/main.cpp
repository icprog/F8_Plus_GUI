#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "modelmanager.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    qmlRegisterType<ModelManager>("Backend",1,0,"ModelManager");
    ModelManager::getInstance()->init();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
