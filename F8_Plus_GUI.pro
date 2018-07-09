QT += qml quick

CONFIG += c++11

SOURCES += src/model/configurationnetworkmodel.cpp \
    src/model/basemodel.cpp \
    src/modelmanager.cpp \
    src/main.cpp \
    src/modelmonitor.cpp

RESOURCES += \
    resource/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    qmldir

HEADERS += \
    src/model/configurationnetworkmodel.h \
    src/model/basemodel.h \
    src/modelmanager.h \
    src/modelmonitor.h
