import QtQuick 2.4

Item {

    id: item1
    width: 517
    height: 480
    property bool enterVisible: true

    property alias mouseArea12: mouseArea12
    property alias mouseArea11: mouseArea11
    property alias mouseArea10: mouseArea10
    property alias mouseArea9: mouseArea9
    property alias mouseArea8: mouseArea8
    property alias mouseArea7: mouseArea7
    property alias mouseArea6: mouseArea6
    property alias mouseArea5: mouseArea5
    property alias mouseArea4: mouseArea4
    property alias mouseArea3: mouseArea3
    property alias mouseArea2: mouseArea2
    property alias mouseArea1: mouseArea1
    property alias mouseArea: mouseArea


    Rectangle {
        id: rectangle
        width: 129
        height: 120
        color: mouseArea.pressed ? "#213963" :"#131d4d"
        border.color: "#2a436e"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Text {
            id: text2
            x: 53
            y: 51
            color: "#ffffff"
            text: "1"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 36
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle1
        width: 129
        height: 120
        color: mouseArea1.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.left: rectangle.right
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Text {
            id: text3
            x: 19
            y: 33
            color: "#d8d9de"
            text: "2"
            visible: true
            z: 1
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle2
        x: 0
        y: 0
        width: 129
        height: 120
        color: mouseArea2.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: parent.top
        anchors.left: rectangle1.right

        Text {
            id: text4
            x: 50
            y: 33
            color: "#ffffff"
            text: "3"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle3
        x: 0
        y: 0
        width: 129
        height: 120
        color: mouseArea3.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: parent.top
        anchors.left: rectangle2.right

        Text {
            id: text5
            x: 59
            y: 33
            color: "#ffffff"
            text: "."
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea3
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle4
        x: 2
        y: 2
        width: 129
        height: 120
        color: mouseArea4.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle.bottom
        anchors.left: parent.left

        Text {
            id: text6
            x: 68
            y: 34
            color: "#ffffff"
            text: "4"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea4
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle5
        x: 2
        y: 2
        width: 129
        height: 120
        color: mouseArea5.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle1.bottom
        anchors.left: rectangle.right

        Text {
            id: text7
            x: 51
            y: 40
            color: "#ffffff"
            text: "5"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea5
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle6
        x: -1
        y: 1
        width: 129
        height: 120
        color:mouseArea6.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle2.bottom
        anchors.left: rectangle1.right

        Text {
            id: text8
            x: 438
            y: 160
            color: "#ffffff"
            text: "6"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea6
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle7
        x: 10
        y: -5
        width: 129
        height: 120
        color: mouseArea7.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle3.bottom
        anchors.left: rectangle2.right

        Text {
            id: text9
            x: 53
            y: 34
            color: "#ffffff"
            text: "0"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea7
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle8
        x: 6
        y: 6
        width: 129
        height: 120
        color: mouseArea8.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle4.bottom
        anchors.left: parent.left

        Text {
            id: text10
            x: 69
            y: 35
            color: "#ffffff"
            text: "7"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea8
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle9
        x: 6
        y: 6
        width: 129
        height: 120
        color: mouseArea9.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle5.bottom
        anchors.left: rectangle.right

        Text {
            id: text11
            x: 52
            y: 44
            color: "#ffffff"
            text: "8"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea9
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle10
        x: 3
        y: 5
        width: 129
        height: 120
        color: mouseArea10.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle6.bottom
        anchors.left: rectangle1.right

        Text {
            id: text12
            x: 64
            y: 44
            color: "#ffffff"
            text: "9"
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 0
        }

        MouseArea {
            id: mouseArea10
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle11
        x: 14
        y: 0
        width: 129
        height: 120
        color: mouseArea11.pressed ? "#213963" :"#131d4d"
        border.color: rectangle.border.color
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle7.bottom
        anchors.left: rectangle2.right

        Image {
            id: image
            x: 29
            y: 35
            width: 55
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "../../../image/number_keyboard/icon_backspace.png"
        }

        MouseArea {
            id: mouseArea11
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle12
        x: -2
        y: 6
        height: 120
        color: mouseArea12.pressed ? "#213963" :"#131d4d"
        visible: enterVisible
        border.color: rectangle.border.color
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.top: rectangle8.bottom
        anchors.left: parent.left

        Text {
            id: text1
            x: 247
            y: 51
            color: "#00fadd"
            text: "完成"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 36
        }

        MouseArea {
            id: mouseArea12
            visible: true
            anchors.fill: parent
        }
    }
}
