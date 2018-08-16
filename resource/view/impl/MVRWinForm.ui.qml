import QtQuick 2.4
import "../../controls"
import "../base"

BaseView {
    width: 1280
    height: 800
    property alias text1: text1
    property alias btnReturn: btnReturn
    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/image/common/background.png"
        DevNameLabel {
            x: 796
            y: 62
        }
        ReturnButton {
            id: btnReturn
            x: 36
            y: 56
            width: 130
            height: 56
            text: "预监"
        }

        Rectangle {
            id: rectangle
            x: 32
            y: 140
            width: 1214
            height: 622
            color: "#00ffffff"
            border.width: 1
            border.color: "#2a436e"

            Rectangle {
                id: rectangle1
                x: 148
                width: 1094
                height: 616
                color: "#040a28"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: image1
                    y: 165
                    width: 191
                    height: 148
                    fillMode: Image.Stretch
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/image/mvr_page/invalid.png"
                }

                Text {
                    id: text1
                    x: 458
                    color: "#8ea0c0"
                    text: "预监尚未开启"
                    anchors.top: image1.bottom
                    anchors.topMargin: 33
                    anchors.horizontalCenter: image1.horizontalCenter
                    font.pixelSize: 30
                }
            }
        }
    }
}
