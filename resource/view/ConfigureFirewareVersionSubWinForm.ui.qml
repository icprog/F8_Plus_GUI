import QtQuick 2.4
import "../controls"

Item {
    width: 1059
    height: 542
    property alias btnOutCard: btnOutCard
    property alias btnInCard: btnInCard
    property alias btnNormal: btnNormal
    property int m_state: 0 //0 常规  1 输入子卡  2 输出子卡
    Rectangle {
        id: rectangle
        x: 269
        y: 22
        width: 514
        height: 60
        color: "#00ffffff"
        radius: 27
        border.color: "#2f395d"
        ToggleButton {
            id: btnNormal
            width: parent.width / 3
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            text: "常规"
            releaseTextColor: "#8ea0c0"
            toggle: m_state === 0 ? true : false
        }

        ToggleButton {
            id: btnInCard
            y: 6
            width: parent.width / 3
            anchors.left: btnNormal.right
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            text: "输入子卡"
            releaseTextColor: "#8ea0c0"
            toggle: m_state === 1 ? true : false
        }
        ToggleButton {
            id: btnOutCard
            x: 0
            y: 4
            width: parent.width / 3
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            text: "输出子卡"
            releaseTextColor: "#8ea0c0"
            toggle: m_state === 2 ? true : false
        }
    }
}
