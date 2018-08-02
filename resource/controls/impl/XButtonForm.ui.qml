import QtQuick 2.4

Item {
    width: 52
    height: 51
    property alias mouseArea: mouseArea

    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/image/common/icon_close.png"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }
}
