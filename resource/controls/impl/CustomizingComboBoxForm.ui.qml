import QtQuick 2.4
import QtQuick.Controls 2.0

Item {


    property int currentIndex: 0
    id: control
    width: 263
    height: 62
    property alias mouseArea: mouseArea
    property alias displayString: displayString
    Rectangle {
        color: "#3b547c"
        radius: 2
        anchors.fill: parent
        Text {
            id: displayString
            x: 10
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            color: "#00c8fa"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
        Image {
            id: canvas
            x: parent.width - width - 16
            y: 25

            width: 18
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/image/config_page/down_arrow.png"
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
