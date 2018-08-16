import QtQuick 2.4
import QtQuick.Controls 2.0
import "../../controls"
import "../base"

BaseView {
    width: 1280
    height: 800
    property alias btnPowerOff: btnPowerOff
    property alias btnLock: btnLock
    property alias btnSence: btnSence
    property alias btnLanguage: btnLanguage
    property alias btnAbout: btnAbout
    property alias btnMVR: btnMVR
    property alias btnDevice: btnDevice
    property alias btnSetting: btnSetting

    Image {
        source: "qrc:/image/common/background.png"
        anchors.fill: parent
        DevNameLabel {
            x: 349
            y: 79
        }
        TitleButton {
            id: btnDevice
            x: 34
            y: 233
            width: 393
            height: 242
            text: "设备"
            backgroundImage: "qrc:/image/main_page/device.png"
        }
        TitleButton {
            id: btnSence
            x: 444
            y: 233
            width: 393
            height: 502
            text: qsTr("场景")
            backgroundImage: "qrc:/image/main_page/sence.png"
        }
        TitleButton {
            id: btnSetting
            x: 854
            y: 233
            width: 393
            height: 242
            text: qsTr("设置")
            backgroundImage: "qrc:/image/main_page/setting.png"
        }
        TitleButton {
            id: btnMVR
            x: 34
            y: 493
            width: 393
            height: 242
            text: qsTr("预监")
            backgroundImage: "qrc:/image/main_page/mvr.png"
        }
        TitleButton {
            id: btnLanguage
            x: 854
            y: 493
            width: 188
            height: 242
            text: "语言/En"
            backgroundImage: "qrc:/image/main_page/language.png"
        }
        TitleButton {
            id: btnAbout
            x: 1059
            y: 493
            width: 188
            height: 242
            text: qsTr("关于")
            backgroundImage: "qrc:/image/main_page/about.png"
        }

        Image {
            id: image
            x: 34
            y: 41
            width: 293
            height: 92
            source: "qrc:/image/main_page/logo.png"
        }

        TitleButton {
            id: btnLock
            x: 1046
            y: 57
            width: 52
            height: 56
            backgroundImage: "qrc:/image/common/lock.png"
        }

        TitleButton {
            id: btnPowerOff
            x: 1181
            y: 58
            width: 52
            height: 56
            backgroundImage: "qrc:/image/main_page/power_off.png"
        }

        Rectangle {
            id: rectangle
            x: 1141
            y: 63
            width: 1
            height: 49
            color: "#283a5c"
        }

        Text {
            id: text1
            x: 543
            y: 762
            width: 199
            color: "#7fe1fd"
            text: "Pixelhue Texchnology Ltd"
            font.pixelSize: 16
        }
    }
}
