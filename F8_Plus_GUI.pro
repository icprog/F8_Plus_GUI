QT += qml quick widgets

CONFIG += c++11

SOURCES += src/model/configurationnetworkmodel.cpp \
    src/model/basemodel.cpp \
    src/modelmanager.cpp \
    src/main.cpp \
    src/modelmonitor.cpp \
    src/protocol_v4_cli/protocol_v4_common/protocolv4manager.cpp \
    src/protocol_v4_cli/protocol_v4_common/protocolv4pkg.cpp \
    src/protocol_v4_cli/protocol_v4_common/protocolv4pkgbody.cpp \
    src/protocol_v4_cli/protocol_v4_common/protocolv4pkghead.cpp \
    src/protocol_v4_cli/protocolv4connector.cpp \
    src/qtlog.cpp \
    src/model/deviceinfomodel.cpp \
    src/translatorhelper.cpp \
    src/translator.cpp \
    src/utility.cpp


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
    src/modelmonitor.h \
    src/protocol_v4_cli/protocol_v4_common/prot_cfg.h \
    src/protocol_v4_cli/protocol_v4_common/protocol_v4_common.h \
    src/protocol_v4_cli/protocol_v4_common/protocolv4manager.h \
    src/protocol_v4_cli/protocol_v4_common/protocolv4pkg.h \
    src/protocol_v4_cli/protocol_v4_common/protocolv4pkgbody.h \
    src/protocol_v4_cli/protocol_v4_common/protocolv4pkghead.h \
    src/protocol_v4_cli/protocolv4connector.h \
    src/project_cfg.h \
    src/qtlog.h \
    src/model/deviceinfomodel.h \
    src/translatorhelper.h \
    src/translator.h \
    src/utility.h


# 设置生成的语言库存放的路径，我这边是放在resources文件夹下面，生成中文和英文两种，不要认为是直接翻译好的，这两个文件刚生成的时内容是一样的，需要自己去翻译，这个后面会说。
TRANSLATIONS += resource/tr_zh.ts \
               resource/tr_en.ts
lupdate_only {
    SOURCES += resource/view/*.qml
}
