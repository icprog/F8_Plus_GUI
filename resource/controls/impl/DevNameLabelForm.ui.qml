import QtQuick 2.4

Item {
    id: item1
    width: txtIP.x + txtIP.width
    height: image1.height
    property alias devName : txtDevName.text
    property alias ip : txtIP.text
    Image {
        id: image1
        x: 0
        y: 0
        width: 35
        height: 36
        source: "qrc:/image/main_page/icon_dev_name.png"
    }

    Text {
        id: txtDevName
        y: 0
        color: "#8ea0c0"
        text: "设备名称"
        anchors.left: image1.right
        anchors.leftMargin: 16
        font.pixelSize: 24
    }

    Image {
        id: image2
        y: 1
        width: 34
        height: 36
        anchors.left: txtDevName.right
        anchors.leftMargin: 52
        source: "qrc:/image/main_page/icon_ip.png"
    }

    Text {
        id: txtIP
        y: 1
        color: "#8ea0c0"
        text: "127.0.0.1"
        anchors.left: image2.right
        anchors.leftMargin: 16
        font.pixelSize: 24
    }
}
