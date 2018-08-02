import QtQuick 2.4
//import QtQuick 2.7
import QtQuick.Controls 2.0
import "../controls"

Item {
    id: win
    width: 1280
    height: 800
    property alias btnAdvance: btnAdvance
    property alias btnFw: btnFw
    property alias btnNet: btnNet
    property alias returnButton: returnButton
    property int m_state: 0 // 0 网络通讯   1  固件版本     2  高级设置

    Image {
        id: image
        visible: true
        fillMode: Image.Stretch
        z: -1
        anchors.fill: parent
        source: "qrc:/image/common/background.png"
        ReturnButton {
            id: returnButton
            x: 18
            y: 28
        }
        ConfigureSubButton {
            id: btnNet
            x: 34
            y: 168
            toggle: m_state === 0 ? true : false
        }

        ConfigureSubButton {
            id: btnFw
            x: 34
            y: 366
            text: "固件版本"
            toggle: m_state === 1 ? true : false
            pressedImg:"qrc:/image/config_page/icon_fireware_ver_pressed.png"
            releaseImg:  "qrc:/image/config_page/icon_fireware_ver_normal.png"
        }
        ConfigureSubButton {
            id: btnAdvance
            x: 34
            y: 536
            text: "高级设置"
            toggle: m_state === 2 ? true : false
            pressedImg:"qrc:/image/config_page/icon_advance_pressed.png"
            releaseImg:  "qrc:/image/config_page/icon_advance_normal.png"
        }
    }

    Rectangle {
        id: rectangle
        x: 34
        y: 322
        width: 117
        height: 4
        color: "#2f385d"
    }

    Rectangle {
        id: rectangle1
        x: 34
        y: 505
        width: 117
        height: 4
        color: "#2f385d"
    }

    Rectangle {
        id: rectangle2
        x: 188
        y: 140
        width: 1059
        height: 622
        color: "#00ffffff"
        radius: 6
        border.width: 3
        border.color: "#213a63"

        Rectangle {
            id: rectangle3
            height: 80
            color: "#213a63"
            visible: true
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            Text {
                id: text1
                x: 29
                y: 26
                width: 128
                height: 32
                color: "#ffffff"
                text: m_state === 0 ? "网络通信" : m_state === 1 ? "固件版本" : "高级设置"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 32
            }
        }
        ConfigureNetSubWin {
            id: configureNetSubWin
            y: 80
            visible: m_state === 0 ? true : false
        }
        ConfigureFirewareVersionSubWin {
            y: 80
            visible: win.m_state === 1 ? true : false
        }
        ConfigureAdvanceWin{
            y : 80
            visible:  m_state ===2 ? true : false
        }

    }
}
