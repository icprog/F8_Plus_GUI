import QtQuick 2.4

Item {
    id: item1
    width: 118
    height: 122
    property alias mouseArea: mouseArea
    property bool toggle: true
    property alias text: text1.text
    property string pressedImg: "qrc:/image/config_page/icon_net_pressed.png"
    property string releaseImg: "qrc:/image/config_page/icon_net_normal.png"
    Image {
        id: image
        x: 25
        width: 72
        height: 72
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        source: toggle === true ? pressedImg : releaseImg
    }

    Text {
        id: text1
        y: 85
        height: 34
        color: toggle === true ? "#07b628" : "#7ea0c0"
        text: "网络通讯"
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
