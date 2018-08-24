import QtQuick 2.4

Item {
    id: item1
    width: 265
    height: 62
    property alias text2: text2
    property alias mouseArea: mouseArea
    property bool realNumber: false
    property alias text: text1.text
    Rectangle {
        id: rectangle
        color: "#3b547c"
        anchors.fill: parent

        Text {
            id: text1
            x: 10
            y: 0
            color: "#00c8fa"
            text: "2.50"
            anchors.leftMargin: 10
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 28
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        Text {
            id: text2
            x: 220
            y: 10
            width: 37
            height: 42
            text: ""
            anchors.right: parent.right
            anchors.rightMargin: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            color: "#8ea0c0"
        }
    }
}
