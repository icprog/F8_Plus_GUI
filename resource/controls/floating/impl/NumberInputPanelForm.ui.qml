import QtQuick 2.4
import "../base"
import "../../"

BaseFloatingPanel {
    width: 1280
    height: 800
    property alias text3: text3
    property alias text1: text1
    property alias text2: text2
    property alias xButton: xButton
    property alias text4: text4
    property alias numberKeyboard: numberKeyboard
    property alias title: text1.text
    property alias limit: text2.text
    context: NumberInput {
        visible: false
    }
    Rectangle {
        id: rectangle1
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
            x: 41
            y: 133
            color: "#8ea0c0"
            text: "返回主界面时长"
            font.pixelSize: 32
        }
        Text {
            id: text2
            y: 157
            color: "#8ea0c0"
            text: "（范围：5～90）"
            anchors.verticalCenter: text1.verticalCenter
            anchors.left: text1.right
            anchors.leftMargin: 10
            font.pixelSize: 28
        }

        Rectangle {
            id: rectangle
            x: 47
            y: 245
            width: 505
            height: 4
            color: "#8ea0c0"
        }

        Text {
            id: text3
            x: 531
            y: 190
            color: "#8ea0c0"
            text: qsTr("S")
            font.pixelSize: 36
        }

        Text {
            id: text4
            x: 58
            y: 190
            color: "#ffffff"
            text: qsTr("4")
            font.pixelSize: 36
        }

        NumberKeyboard {
            id: numberKeyboard
            x: 41
            y: 279
        }
    }
}
