import QtQuick 2.4
import "../base"
import "../../../controls"

BaseFloatingPanel {
    width: 1280
    height: 800
    property alias text1: text1
    property alias hollowButton1: hollowButton1
    property alias hollowButton: hollowButton

    Rectangle {
        id: rectangle
        color: "#80000000"
        anchors.fill: parent

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
        Rectangle {
            id: rectangle1
            x: 293
            y: 231
            width: 607
            height: 342
            color: "#111b48"
            z: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: image
                x: 254
                y: 32
                width: 69
                height: 74
                source: "../../../image/shutdown_page/icon_shutdown.png"
            }

            Text {
                id: text1
                x: 65
                y: 117
                width: 481
                height: 90
                color: "#ffffff"
                text: "你确定现在将设备关机吗？"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
            }

            HollowButton {
                id: hollowButton
                x: 115
                y: 226
                text: "取消"
            }
            HollowButton {
                id: hollowButton1
                x: 326
                y: 226
                text: "确定"
            }
        }
    }
}
