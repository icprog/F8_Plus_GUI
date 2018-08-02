import QtQuick 2.4

Item {
    id: item1
    width: 130
    height: 56
    property alias mouseArea: mouseArea
    property alias text: text1.text
    opacity: 1
    Image {
        id: image
        width: 31
        height: 56
        source: "qrc:/image/common/icon_back.png"
    }

    Text {
        id: text1
        color: "#00fadd"
        text: qsTr("语言")
        font.family: "Microsoft YaHei"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        anchors.left: image.right
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        font.pixelSize: 36
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
