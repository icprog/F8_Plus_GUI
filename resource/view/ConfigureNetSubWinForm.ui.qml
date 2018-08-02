import QtQuick 2.4
import QtQuick.Controls 2.0
//import "../controls/floating/CustomizingComboBox/"
//import "../controls/floating/NumberKeyboard"
import "../controls"

Item {
    id: item1
    width: 1059
    height: 542
    property alias comboBox: comboBox

    Text {
        id: text1
        x: 48
        y: 30
        width: 80
        height: 23
        color: "#8ea9c0"
        text: qsTr("MAC :")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
    }

    Text {
        id: text2
        x: 48
        y: 107
        width: 80
        height: 23
        color: "#8ea9c0"
        text: qsTr("IP获取方式 :")
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text3
        x: 48
        y: 206
        width: 80
        height: 23
        color: "#8ea9c0"
        text: qsTr("IP地址 :")
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text4
        x: 48
        y: 297
        width: 80
        height: 23
        color: "#8ea9c0"
        text: qsTr("子网掩码 :")
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text5
        x: 48
        y: 394
        width: 80
        height: 23
        color: "#8ea9c0"
        text: qsTr("网关 :")
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        id: rectangle
        x: 231
        y: 462
        width: 150
        height: 60
        color: "#00ffffff"
        radius: 30
        rotation: 0
        border.color: "#00fadd"
        border.width: 2

        Text {
            id: text6
            width: 55
            height: 28
            color: "#00fadd"
            text: qsTr("应用")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
        }
    }

    Text {
        id: text7
        x: 231
        y: 30
        width: 80
        height: 23
        color: "#8ea9c0"
        text: qsTr("AA:BB:CC:DD:EE:FF")
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    CustomizingComboBox {
        id: comboBox
        x: 231
        y: 90
        currentIndex: 0
    }

    NumberKeyboardNetAddrInput {
        id: numberKeyboardNetConf
        x: 231
        y: 184
    }

    NumberKeyboardNetAddrInput {
        id: numberKeyboardNetConf1
        x: 231
        y: 278
    }

    NumberKeyboardNetAddrInput {
        id: numberKeyboardNetConf2
        x: 231
        y: 372
    }
}
