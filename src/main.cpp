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
#include "player.h"
#include <gst/gst.h>
#include <QMainWindow>
#include <QQuickWidget>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_DontCreateNativeWidgetSiblings);
    QApplication app(argc, argv);
    gst_init(&argc, &argv);
    QFont font;
     //font.setPointSize(16);
     font.setFamily(("Microsoft YaHei"));
     app.setFont(font);
    //qInstallMessageHandler(outputMessage);
    QMainWindow mainWin;

    mainWin.setGeometry(QRect(0, 0, 1280, 800));


    QQuickWidget engine(&mainWin);

    Player* player = Player::Create(&mainWin);
    if(player )
        engine.rootContext()->setContextProperty("player",  player);
    engine.rootContext()->setContextProperty("ModelManager", ModelManager::getInstance());
    engine.rootContext()->setContextProperty("TranslatorHelper", TranslatorHelper::getInstance());
    engine.rootContext()->setContextProperty("Utility", Utility::getInstance());
    engine.setSource(QUrl(QLatin1String("qrc:/main.qml")));
    QTimer::singleShot(0, ModelManager::getInstance(),SLOT(init()));
    mainWin.show();
#ifdef ARM
    mainWin.showFullScreen();
#else
    mainWin.show();
#endif
    return app.exec();
}
