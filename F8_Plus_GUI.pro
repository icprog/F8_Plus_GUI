QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    src/basemodel.cpp \
    src/model/configurationnetworkmodel.cpp \
    src/model/basemodel.cpp \
    src/cglobal.cpp \
    src/model/modelmanager.cpp \
    src/modelmanager.cpp \
    src/main.cpp

RESOURCES += \
    resource/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    qmldir

HEADERS += \
    src/basemodel.h \
    src/model/configurationnetworkmodel.h \
    src/model/basemodel.h \
    src/cglobal.h \
    src/model/modelmanager.h \
    src/modelmanager.h
