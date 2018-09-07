QT += qml quick quickwidgets

CONFIG += c++11
CONFIG += link_pkgconfig
PKGCONFIG += gstreamer-1.0
LIBS += -lgstvideo-1.0
DEFINES += QT_NO_OPENGL_ES_3
DEFINES += QT_NO_OPENGL_ES_3_1

TEMP_VAR = $$(ARCH)
if(contains(TEMP_VAR,arm)){
    DEFINES += ARM
}else{
    DEFINES += X86
}

message($$DEFINES)
SOURCES += \
    src/model/basemodel.cpp \
    src/modelmanager.cpp \
    src/main.cpp \
    src/qtlog.cpp \
    src/translatorhelper.cpp \
    src/translator.cpp \
    src/utility.cpp \
    src/model/languagemodel.cpp \
    src/model/devicegeneralmodel.cpp \
    src/model/DeviceIpModel.cpp \
    src/model/devicerestorefactorymodel.cpp \
    src/model/devicefirwareversionmodel.cpp \
    src/model/devicedetailmodel.cpp \
    src/model/mvrenablemodel.cpp \
    src/model/devicegenlockmodel.cpp \
    src/model/presetsmodel.cpp \
    src/debug/debughandler.cpp \
    src/protocol_v4_cli/protocolv4manager.cpp \
    src/protocol_v4_cli/protocolv4pkg.cpp \
    src/player.cpp


RESOURCES += \
    resource/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)



HEADERS += \
    src/model/basemodel.h \
    src/modelmanager.h \
    src/project_cfg.h \
    src/qtlog.h \
    src/translatorhelper.h \
    src/translator.h \
    src/utility.h \
    src/model/languagemodel.h \
    src/model/DeviceGeneralModel.h \
    src/model/DeviceIpModel.h \
    src/model/devicerestorefactorymodel.h \
    src/model/devicefirwareversionmodel.h \
    src/model/firewareversionitem.h \
    src/model/devicedetailmodel.h \
    src/model/mvrenablemodel.h \
    src/model/devicegenlockmodel.h \
    src/model/presetsmodel.h \
    src/debug/debughandler.h \
    src/custom_declare.h \
    src/protocol_v4_cli/prot_cfg.h \
    src/protocol_v4_cli/protocol_v4_common.h \
    src/protocol_v4_cli/protocolv4manager.h \
    src/protocol_v4_cli/protocolv4pkg.h \
    src/player.h


# 设置生成的语言库存放的路径，我这边是放在resources文件夹下面，生成中文和英文两种，不要认为是直接翻译好的，这两个文件刚生成的时内容是一样的，需要自己去翻译，这个后面会说。
TRANSLATIONS += resource/tr_zh.ts \
               resource/tr_en.ts
lupdate_only {
    SOURCES += resource/view/*.qml
SOURCES += resource/view/impl/*.qml
SOURCES += resource/controls/*.qml
SOURCES += resource/controls/floating/*.qml
    SOURCES += src/model/*.cpp
}



