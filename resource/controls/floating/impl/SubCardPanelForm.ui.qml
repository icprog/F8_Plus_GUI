import QtQuick 2.4
import "../base"
import "../../"

BaseFloatingPanel {
    id: item1
    x: 0
    y: 0
    width: 1280
    height: 800
    property alias interfaceListView16: interfaceListView16
    property alias interfaceListView15: interfaceListView15
    property alias interfaceListView14: interfaceListView14
    property alias interfaceListView13: interfaceListView13
    property alias interfaceListView12: interfaceListView12
    property alias interfaceListView11: interfaceListView11
    property alias interfaceListView10: interfaceListView10
    property alias interfaceListView9: interfaceListView9
    property alias interfaceListView8: interfaceListView8
    property alias interfaceListView7: interfaceListView7
    property alias interfaceListView6: interfaceListView6
    property alias interfaceListView5: interfaceListView5
    property alias interfaceListView4: interfaceListView4
    property alias interfaceListView3: interfaceListView3
    property alias interfaceListView2: interfaceListView2
    property alias interfaceListView1: interfaceListView1
    property alias image: image
    property alias mouseArea: mouseArea

    Image {
        id: image
        x: 32
        y: 217
        width: 1213
        height: 544
        clip: true
        source: "../../../image/device_page/sub_card_bg.png"

        Rectangle {
            id: rectangle1
            x: 0
            y: 25
            width: parent.width / 16
            height: 519
            color: "#00ffffff"

            Text {
                id: text1
                x: 17
                y: 21
                color: "#ffffff"
                text: qsTr("In1")
                font.pixelSize: 22
            }
            InterfaceListView {
                id: interfaceListView1
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle2
            anchors.left: rectangle1.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text2
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("In2")
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView2
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle3
            anchors.left: rectangle2.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#ed0e4b"
            Text {
                id: text3
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("In3")
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView3
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle4
            anchors.left: rectangle3.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text4
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("In4")
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView4
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle5
            anchors.left: rectangle4.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text5
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("In5")
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView5
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle6
            anchors.left: rectangle5.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text6
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("In6")
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView6
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle7
            anchors.left: rectangle6.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text7
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("In7")
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView7
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle8
            anchors.left: rectangle7.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text8
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("In8")
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView8
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }
        Rectangle {
            id: rectangle9
            anchors.left: rectangle8.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#ed0e4b"
            Text {
                id: text9
                x: 12
                y: 20
                color: "#ffffff"
                text: qsTr("Out1")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView9
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }

        Rectangle {
            id: rectangle10
            anchors.left: rectangle9.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#ed0e4b"
            Text {
                id: text10
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("Out2")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }

        Rectangle {
            id: rectangle11
            anchors.left: rectangle10.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text11
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("Out3")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView11
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }

        Rectangle {
            id: rectangle12
            anchors.left: rectangle11.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text12
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("Out4")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView12
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }

        Rectangle {
            id: rectangle13
            anchors.left: rectangle12.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text13
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("Out5")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }

        Rectangle {
            id: rectangle14
            anchors.left: rectangle13.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text14
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("Out6")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView14
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }

        Rectangle {
            id: rectangle15
            anchors.left: rectangle14.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text15
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("Out7")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView15
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }

        Rectangle {
            id: rectangle16
            anchors.left: rectangle15.right
            anchors.top: rectangle1.top
            anchors.bottom: rectangle1.bottom
            width: parent.width / 16
            height: 519
            color: "#00ffffff"
            Text {
                id: text16
                x: 19
                y: 21
                color: "#ffffff"
                text: qsTr("Out8")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            InterfaceListView {
                id: interfaceListView16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
            }
        }
    }

    Image {
        id: image1
        x: 194
        y: 186
        width: 50
        height: 50
        source: "../../../image/device_page/icon_volt_warning.png"
    }

    Image {
        id: image2
        x: 649
        y: 124
        width: 50
        height: 50
        source: "../../../image/device_page/icon_volt_warning.png"
    }

    Image {
        id: image3
        x: 649
        y: 180
        width: 50
        height: 50
        source: "../../../image/device_page/icon_temp_warning.png"
    }

    Image {
        id: image4
        x: 723
        y: 180
        width: 50
        height: 50
        source: "../../../image/device_page/icon_temp_warning.png"
    }

    MouseArea {
        id: mouseArea
        x: 0
        width: 1280
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: image.top
        anchors.bottomMargin: 0
    }

    Rectangle {
        id: rectangle
        color: "#80000000"
        z: -1
        anchors.fill: parent
    }
}
