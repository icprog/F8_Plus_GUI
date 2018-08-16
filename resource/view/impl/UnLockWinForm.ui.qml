import QtQuick 2.4
import "../base"
import "../../controls"

BaseView {
    width: 1280
    height: 800
    property alias text7: text7
    property alias text1: text1
    property alias numberKeyboard: numberKeyboard
    property alias text6: text6
    property alias returnButton: returnButton
    property int m_state: 0
    property var pwd: [-1, -1, -1, -1]

    Image {
        id: image
        anchors.fill: parent
        source: "../../image/common/background.png"

        ReturnButton {
            id: returnButton
            x: 64
            y: 66
            text: "取消"
        }

        Text {
            id: text1
            x: 71
            y: 161
            color: "#ffffff"
            text: "输入4位数字密码"
            font.pixelSize: 32
        }

        Rectangle {
            id: rectangle
            x: 71
            y: 333
            width: 124
            height: 4
            color: m_state >= 0 ? "#00c8fa" : "#8ea0c0"
        }

        Rectangle {
            id: rectangle1
            x: 219
            y: 333
            width: 124
            height: 4
            color: m_state >= 1 ? "#00c8fa" : "#8ea0c0"
        }

        Rectangle {
            id: rectangle2
            x: 368
            y: 333
            width: 124
            height: 4
            color: m_state >= 2 ? "#00c8fa" : "#8ea0c0"
        }

        Rectangle {
            id: rectangle3
            x: 516
            y: 333
            width: 124
            height: 4
            color: m_state >= 3 ? "#00c8fa" : "#8ea0c0"
        }

        Text {
            id: text2
            x: 121
            y: 276
            color: "#ffffff"
            text: qsTr("*")
            visible: m_state >= 1 ? true : false
            anchors.horizontalCenter: rectangle.horizontalCenter
            font.pixelSize: 50
        }

        Text {
            id: text3
            x: 269
            y: 276
            color: "#ffffff"
            text: qsTr("*")
            visible: m_state >= 2 ? true : false
            anchors.horizontalCenterOffset: 148
            anchors.horizontalCenter: rectangle.horizontalCenter
            font.pixelSize: 50
        }

        Text {
            id: text4
            x: 418
            y: 276
            color: "#ffffff"
            text: qsTr("*")
            visible: m_state >= 3 ? true : false
            anchors.horizontalCenterOffset: 298
            anchors.horizontalCenter: rectangle.horizontalCenter
            font.pixelSize: 50
        }

        Text {
            id: text5
            x: 566
            y: 276
            color: "#ffffff"
            text: qsTr("*")
            anchors.horizontalCenterOffset: 446
            visible: m_state >= 4 ? true : false
            anchors.horizontalCenter: rectangle.horizontalCenter
            font.pixelSize: 50
        }

        Rectangle {
            id: rectangle4
            x: 541
            y: 86
            width: 198
            height: 58
            color: "#000000"
            radius: 29
            visible: m_state >= 5 ? true : false
            anchors.verticalCenter: text1.verticalCenter

            Image {
                id: image2
                x: 17
                y: 12
                width: 34
                height: 34
                source: "../../image/common/icon_warning.png"
            }

            Text {
                id: text7
                x: 71
                y: 20
                color: "#ffffff"
                text: "密码错误"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 26
            }
        }
        NumberKeyboard {
            id: numberKeyboard
            x: 693
            y: 252
            enterVisible: false
        }

        Rectangle {
            id: rectangle5
            x: 64
            y: 383
            width: text6.x + text6.width
            height: 34
            color: "#00ffffff"
            visible: m_state >= 5 ? true : false

            Image {
                id: image1
                x: 0
                y: 0
                width: 34
                height: 34
                source: "../../image/unlock_page/icon_warning.png"
            }

            Text {
                id: text6
                x: 50
                y: -51
                color: "#8ea0c0"
                text: "忘记密码请在******中修改。"
                anchors.verticalCenter: image1.verticalCenter
                font.pixelSize: 26
            }
        }
    }
}
