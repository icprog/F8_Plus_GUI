import QtQuick 2.4
import "../../controls"
import "../base"

BaseView {
    width: 1280
    height: 800
    dispDevName:  false
    dispReturnButton: false
    property alias btnPowerOff: btnPowerOff
    property alias rectangle: rectangle
    property alias mouseArea: mouseArea
    property alias text1: text1
    property int initY: 438
    property int offsetY: 200

    DevNameLabel {
        x: 349
        y: 79
    }
    Image {
        id: image1
        x: 34
        y: 41
        width: 293
        height: 92
        source: "qrc:/image/main_page/logo.png"
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
        x: 516
        y: initY
        width: 224
        height: 262
        color: "#00ffffff"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: text1
            x: 65
            y: 0
            color: "#ffffff"
            text: "滑动解锁"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 36
        }

        Image {
            id: image2
            x: 56
            y: 66
            width: 56
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../../image/lock_page/icon_up.png"
        }

        Image {
            id: image3
            x: 34
            y: 112
            width: 146
            height: 146
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../../image/lock_page/icon_lock.png"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            drag.target: rectangle
            drag.axis: "YAxis"
            drag.minimumY: initY - offsetY
            drag.maximumY: initY
        }
    }

}
