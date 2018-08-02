import QtQuick 2.4
import QtQuick.Controls 2.0
import "../controls"

Item {
    width: 1280
    height: 800
    property alias btnSence: btnSence
    property alias btnLanguage: btnLanguage
    property alias btnAbout: btnAbout
    property alias btnMVR: btnMVR
    property alias btnDevice: btnDevice
    property alias txtIP: txtIP
    property alias txtDevName: txtDevName
    property alias btnSetting: btnSetting

    Image {
        source: "../image/common/background.png"
        anchors.fill: parent
        TitleButton {
            id: btnDevice
            x: 34
            y: 233
            width: 393
            height: 242
            text: "设备"
            //text: TranslatorHelper.translator.tr(qsTr("设备"))
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
            source: "../image/main_page/logo.png"
        }

        Image {
            id: image1
            x: 349
            y: 79
            width: 35
            height: 35
            source: "../image/main_page/icon_dev_name.png"
        }

        Text {
            id: txtDevName
            x: 400
            y: 83
            color: "#8ea0c0"
            text: qsTr("")
            font.pixelSize: 24
        }

        Image {
            id: image2
            x: 623
            y: 80
            width: 34
            height: 34
            source: "../image/main_page/icon_ip.png"
        }

        Text {
            id: txtIP
            x: 674
            y: 84
            color: "#8ea0c0"
            text: qsTr("")
            font.pixelSize: 24
        }

        TitleButton {
            id: btnLock
            x: 1046
            y: 57
            width: 52
            height: 56
            backgroundImage: "../image/main_page/lock.png"
        }

        TitleButton {
            id: btnPowerOff
            x: 1181
            y: 58
            width: 52
            height: 56
            backgroundImage: "../image/main_page/power_off.png"
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
