import QtQuick 2.4
import QtQuick.Controls 2.0
Item {
    width: 1280
    height: 800
    property alias button4: button4

    Button {
        id: button1
        x: 230
        y: 580
        text: qsTr("设备")
    }

    Button {
        id: button2
        x: 383
        y: 460
        text: qsTr("预监")
    }

    Button {
        id: button3
        x: 580
        y: 398
        text: qsTr("场景")
    }

    Button {
        id: button4
        x: 799
        y: 443
        text: qsTr("设置")
    }

    Button {
        id: button5
        x: 928
        y: 508
        text: qsTr("语言")
    }

    Button {
        id: button6
        x: 992
        y: 608
        text: qsTr("关于")
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 211
        height: 134
        color: "#ffffff"

        Label {
            id: label1
            x: 20
            y: 18
            width: 81
            height: 8
            text: qsTr("Netunus F8 Plus")
        }

        Label {
            id: label2
            x: 20
            y: 86
            width: 81
            height: 8
            text: qsTr("192.168.0.110")
        }

        Label {
            id: label3
            x: 20
            y: 51
            width: 81
            height: 8
            text: qsTr("设备名称")
        }
    }

    Button {
        id: button7
        x: 999
        y: 39
        text: qsTr("锁屏")
    }

    Button {
        id: button8
        x: 1124
        y: 39
        text: qsTr("关机")
    }
}
