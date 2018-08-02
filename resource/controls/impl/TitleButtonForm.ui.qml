import QtQuick 2.4

Item {
    id: btn
    width: 400
    height: 400
    property alias mouseArea: mouseArea
    property alias backgroundImage: image.source
    property alias text: text1.text

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/qtquickplugin/images/template_image.png"
        opacity: mouseArea.pressedButtons ? 0.5 : 1.0
        Text {
            id: text1
            x: 32
            y: 31
            color: "#ffffff"
            text: qsTr("")
            font.pixelSize: 36
        }
    }
}
