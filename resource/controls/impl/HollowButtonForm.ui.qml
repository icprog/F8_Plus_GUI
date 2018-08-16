import QtQuick 2.4

Rectangle {
    id: rectangle
    x: 231
    y: 462
    width: 150
    height: 60
    color: "#00ffffff"
    radius: 30
    property alias text1: text1
    property alias mouseArea: mouseArea
    opacity: enabled === false || mouseArea.pressed ? 0.5 : 1.0
    clip: false
    visible: true
    property alias text: text1.text
    enabled: false
    rotation: 0
    border.color: "#00fadd"
    border.width: 2

    Text {
        id: text1
        width: 55
        height: 28
        color: "#00fadd"
        text: "应用"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 28
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
