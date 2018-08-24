import QtQuick 2.4

Item {
    id: item1
    width: 532
    height: 62
    property alias mouseArea: mouseArea
    //property int addr: "#c0a8de79"
    property var addr: [192,168,222,121]
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 97
        height: 62
        color: "#3b547c"
        radius: 5

        Text {
            id: text1
            x: 33
            y: 22
            color: "#00c8fa"
            text: addr[0]
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
        }
    }

    Rectangle {
        id: rectangle1
        y: 0
        width: rectangle.width
        height: 62
        color: "#3b547c"
        radius: rectangle.radius
        anchors.leftMargin: (parent.width - 4 * rectangle.width) / 3
        anchors.left: rectangle.right

        Text {
            id: text2
            x: -126
            y: 10
            color: "#00c8fa"
            text: addr[1]
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: rectangle2
        y: 0
        width: rectangle.width
        height: 62
        color: "#3b547c"
        radius: rectangle.radius
        anchors.leftMargin: (parent.width - 4 * rectangle.width) / 3
        anchors.left: rectangle1.right

        Text {
            id: text3
            x: -126
            y: 10
            color: "#00c8fa"
            text: addr[2]
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: rectangle3
        x: 439
        y: 0
        width: rectangle.width
        height: 62
        color: "#3b547c"
        radius: rectangle.radius
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: text4
            x: -126
            y: 10
            color: "#00c8fa"
            text: addr[3]
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Text {
        id: text5
        x: 88
        y: 8
        width: 59
        height: 46
        color: "#8ea0c0"
        text: qsTr(".")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 43
    }

    Text {
        id: text6
        x: 237
        y: 8
        width: 59
        height: 46
        color: "#8ea0c0"
        text: qsTr(".")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 43
    }

    Text {
        id: text7
        x: 383
        y: 8
        width: 59
        height: 46
        color: "#8ea0c0"
        text: qsTr(".")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 43
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
