import QtQuick 2.4

Item {
    property bool toggle: true
    property string toggleTextColor: "#ffffff"
    property string releaseTextColor: "#00fadd"
    width: 200
    height: 78
    property alias text: text1.text
    property alias btn: btn
    Rectangle {
        anchors.fill: parent
        id: rectangle
        color: toggle === true ? "#28df12" : "#0028df12"
        radius: 40
        property alias btn: btn
        property alias text: text1.text
        Text {
            id: text1
            x: 68
            y: 22
            width: 63
            height: 32
            color: toggle === true ? toggleTextColor : releaseTextColor
            text: "中文"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 32
        }

        MouseArea {
            id: btn
            anchors.fill: parent
        }
    }
}
