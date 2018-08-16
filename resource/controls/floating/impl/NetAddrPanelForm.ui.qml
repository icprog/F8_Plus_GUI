import QtQuick 2.4
import "../../../controls/"
import "../base/"
BaseFloatingPanel {
    width: 1280
    height: 800
    property alias xButton: xButton
    property alias numberKeyboard: numberKeyboard
    property int m_state: 0 //0 输入第一字节 ，1 输入第二字节，2 输入第三字节，3 输入第四字节
    property bool addrInvalid: false
    property NetAddrInput netAddrInput:context
    context: NetAddrInput {
        visible: false
    }
    property var addr: [-1, -1, -1, -1]
    Rectangle {
        id: rectangle
        x: 686
        y: 0
        width: 592
        height: 800
        color: "#131d4d"

        XButton {
            id: xButton
            x: 47
            y: 47
        }

        Text {
            id: text1
            x: 43
            y: 133
            color: "#8ea0c0"
            text: "IP地址"
            font.pixelSize: 32
        }

        Rectangle {
            id: rectangle1
            x: 197
            y: 120
            width: 252
            height: 58
            color: "#0d1435"
            radius: 29
            visible: addrInvalid

            Image {
                id: image
                x: 22
                y: 13
                width: 34
                height: 34
                source: "../../../../image/common/icon_warning.png"
            }

            Text {
                id: text2
                x: 73
                y: 16
                height: 26
                color: "#ffffff"
                text: qsTr("IP地址不合规")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 26
            }
        }

        Text {
            id: text3
            x: 63
            y: 200
            width: 60
            height: 29
            color: "#ffffff"
            //text: m_state <0 ? "" : addr[0]
            text: m_state <0 || addr[0] === -1 ? "" : addr[0]
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 36
        }

        Rectangle {
            id: rectangle2
            x: 41
            y: 246
            width: 103
            height: 4
            color: "#00c8fa"
        }

        Text {
            id: text4
            y: 193
            width: 8
            height: 7
            color: "#ffffff"
            text: qsTr(".")
            anchors.left: rectangle2.right
            anchors.leftMargin: 16
            font.pixelSize: 50
        }

        Rectangle {
            id: rectangle3
            y: 246
            width: 103
            height: 4
            color: m_state > 0 ? "#00c8fa" : "#8ea0c0"
            anchors.left: text4.right
            anchors.leftMargin: 16
        }

        Text {
            id: text5
            y: 193
            width: 8
            height: 7
            color: "#ffffff"
            text: qsTr(".")
            font.pixelSize: 50
            anchors.leftMargin: 16
            anchors.left: rectangle3.right
        }

        Rectangle {
            id: rectangle4
            y: 246
            width: 103
            height: 4
            color: m_state > 1 ? "#00c8fa" : "#8ea0c0"
            anchors.leftMargin: 16
            anchors.left: text5.right
        }

        Text {
            id: text6
            x: -3
            y: 193
            width: 8
            height: 7
            color: "#ffffff"
            text: qsTr(".")
            font.pixelSize: 50
            anchors.leftMargin: 16
            anchors.left: rectangle4.right
        }

        Rectangle {
            id: rectangle5
            y: 246
            width: 103
            height: 4
            color: m_state > 2 ? "#00c8fa" : "#8ea0c0"
            anchors.leftMargin: 16
            anchors.left: text6.right
        }

        NumberKeyboard {
            id: numberKeyboard
            x: 40
            y: 280
        }

        Text {
            id: text7
            x: 206
            y: 200
            width: 60
            height: 29
            color: "#ffffff"
            //text: m_state <1 ? "" : addr[1]
            text: m_state <1 || addr[1] === -1 ? "" : addr[1]
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text8
            x: 349
            y: 200
            width: 60
            height: 29
            color: "#ffffff"
            //text: m_state <2? "" : addr[2]
            text: m_state <2 || addr[2] === -1 ? "" : addr[2]
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: text9
            x: 492
            y: 200
            width: 60
            height: 29
            color: "#ffffff"
            //text: m_state<3 ? "" : addr[3]
            text:m_state <3 ||  addr[3] === -1 ? "" : addr[3]
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
