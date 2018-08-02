import QtQuick 2.4
import "../controls"

Item {
    width: 1280
    height: 800
    property alias btnSubCard: btnSubCard
    property alias btnSubCardImage: btnSubCardImage
    property alias returnButton: returnButton

    Image {
        id: image
        anchors.fill: parent
        source: "../image/common/background.png"

        ReturnButton {
            id: returnButton
            x: 36
            y: 56
            text: "设备"
        }

        Rectangle {
            id: rectangle
            x: 33
            y: 140
            width: 537
            height: 622
            color: "#00ffffff"

            Rectangle {
                id: rectangle1
                x: 0
                y: 0
                width: 537
                height: 80
                color: "#213a63"

                Text {
                    id: text1
                    x: 26
                    y: 25
                    color: "#ffffff"
                    text: "子卡状态"
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 32
                }

                Image {
                    id: image5
                    x: 321
                    y: 23
                    width: 34
                    height: 34
                    source: "../image/device_page/icon_warning.png"
                }

                Text {
                    id: text33
                    x: 361
                    y: 28
                    height: 24
                    color: "#ed0e4b"
                    text: "3张异常"
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }

                Image {
                    id: btnSubCardImage
                    x: 467
                    y: 13
                    width: 54
                    height: 54
                    source: "../image/device_page/icon_lookup_normal.png"

                    MouseArea {
                        id: btnSubCard
                        anchors.fill: parent
                    }
                }
            }

            Rectangle {
                id: rectangle2
                x: 0
                width: 537
                height: 266
                color: "#00ffffff"
                border.color: "#213a63"
                border.width: 3
                anchors.top: rectangle1.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: rectangle8
                    x: 40
                    y: 35
                    width: 6
                    height: 34
                    color: "#8ea0c0"
                }

                Text {
                    id: text3
                    y: 31
                    color: "#ffffff"
                    text: "输入源"
                    anchors.left: rectangle8.right
                    anchors.leftMargin: 17
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 28
                }

                Text {
                    id: text4
                    x: 99
                    y: 95
                    height: 24
                    color: "#8ea0c0"
                    text: qsTr("available :")
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 28
                }

                Text {
                    id: text5
                    x: 99
                    height: 24
                    color: "#8ea0c0"
                    text: qsTr("used :")
                    anchors.top: text4.bottom
                    anchors.topMargin: 36
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 28
                }

                Text {
                    id: text6
                    x: 99
                    height: 24
                    color: "#8ea0c0"
                    text: qsTr("unused :")
                    anchors.top: text5.bottom
                    anchors.topMargin: 33
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 28
                }

                Text {
                    id: text7
                    y: 95
                    height: 24
                    color: "#00c8fa"
                    text: qsTr("32")
                    anchors.left: text4.right
                    anchors.leftMargin: 24
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text8
                    x: 255
                    y: 155
                    height: 24
                    color: "#00c8fa"
                    text: qsTr("30")
                    anchors.leftMargin: 24
                    font.pixelSize: 28
                    anchors.left: text4.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text9
                    x: 253
                    y: 212
                    height: 24
                    color: "#00c8fa"
                    text: qsTr("2")
                    anchors.leftMargin: 24
                    font.pixelSize: 28
                    anchors.left: text4.right
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle3
                x: 0
                y: 344
                color: "#00ffffff"
                border.color: "#213a63"
                border.width: 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: rectangle2.bottom
                anchors.topMargin: -4
                anchors.right: rectangle1.right
                anchors.rightMargin: 0
                anchors.left: rectangle1.left
                anchors.leftMargin: 0

                Rectangle {
                    id: rectangle9
                    x: 40
                    y: 35
                    width: 6
                    height: 34
                    color: "#8ea0c0"
                }

                Text {
                    id: text10
                    y: 31
                    color: "#ffffff"
                    text: "输出源"
                    anchors.leftMargin: 17
                    font.pixelSize: 28
                    anchors.left: rectangle9.right
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text16
                    y: 213
                    height: 24
                    color: "#00c8fa"
                    text: qsTr("32")
                    anchors.leftMargin: 24
                    font.pixelSize: 28
                    anchors.left: text11.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text15
                    x: 250
                    y: 156
                    height: 24
                    color: "#00c8fa"
                    text: qsTr("30")
                    anchors.leftMargin: 24
                    font.pixelSize: 28
                    anchors.left: text11.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text14
                    x: 250
                    y: 96
                    height: 24
                    color: "#00c8fa"
                    text: qsTr("32")
                    anchors.leftMargin: 24
                    font.pixelSize: 28
                    anchors.left: text11.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text13
                    x: 99
                    y: 208
                    height: 24
                    color: "#8ea0c0"
                    text: qsTr("unused :")
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text12
                    x: 99
                    y: 151
                    height: 24
                    color: "#8ea0c0"
                    text: qsTr("used :")
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text11
                    x: 99
                    y: 96
                    height: 24
                    color: "#8ea0c0"
                    text: qsTr("available :")
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Rectangle {
            id: rectangle4
            x: 588
            y: 140
            width: 657
            height: 622
            color: "#00ffffff"

            Rectangle {
                id: rectangle5
                width: 657
                height: 80
                color: "#213a63"
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                Text {
                    id: text2
                    x: 26
                    y: 25
                    color: "#ffffff"
                    text: "设备状态"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 32
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle6
                width: 657
                height: 427
                color: "#00ffffff"
                border.color: "#213a63"
                border.width: 3
                anchors.top: rectangle5.bottom
                anchors.topMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0

                Text {
                    id: text17
                    x: 54
                    y: 39
                    height: 24
                    color: "#8ea0c0"
                    text: "主/从状态 :"
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text23
                    y: 39
                    height: 24
                    color: "#00c8fa"
                    text: "Master"
                    anchors.leftMargin: 30
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text18
                    x: 54
                    height: 24
                    color: "#8ea0c0"
                    text: "同步状态 :"
                    anchors.top: text17.bottom
                    anchors.topMargin: 38
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text20
                    x: 54
                    y: 160
                    height: 24
                    color: "#8ea0c0"
                    text: "风扇板状态 :"
                    font.pixelSize: 28
                    anchors.top: text19.bottom
                    anchors.topMargin: 38
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text19
                    x: 54
                    y: 168
                    height: 24
                    color: "#8ea0c0"
                    text: "主控卡状态 :"
                    font.pixelSize: 28
                    anchors.top: text18.bottom
                    anchors.topMargin: 38
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text21
                    x: 54
                    height: 24
                    color: "#8ea0c0"
                    text: "背板状态 :"
                    font.pixelSize: 28
                    anchors.top: text20.bottom
                    anchors.topMargin: 38
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text24
                    x: 221
                    y: 101
                    height: 24
                    color: "#00c8fa"
                    text: qsTr("GenLock")
                    anchors.leftMargin: 30
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text25
                    x: 221
                    y: 163
                    height: 24
                    color: "#00c8fa"
                    text: "正常"
                    anchors.leftMargin: 30
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text26
                    x: 221
                    y: 225
                    height: 24
                    color: "#ed0e4b"
                    text: "温度异常"
                    anchors.leftMargin: 71
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text27
                    x: 221
                    y: 287
                    height: 24
                    color: "#ed0e4b"
                    text: qsTr("32")
                    anchors.leftMargin: 71
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }

                Image {
                    id: image1
                    x: 221
                    y: 220
                    width: 34
                    height: 34
                    source: "../image/device_page/icon_temp_warning.png"
                }

                Image {
                    id: image2
                    x: 222
                    y: 282
                    width: 34
                    height: 34
                    source: "../image/device_page/icon_volt_warning.png"
                }

                Text {
                    id: text22
                    x: 54
                    y: 355
                    height: 24
                    color: "#8ea0c0"
                    text: "MVR :"
                    font.pixelSize: 28
                    anchors.top: text21.bottom
                    anchors.topMargin: 38
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text28
                    x: 221
                    y: 349
                    height: 24
                    color: "#00c8fa"
                    text: "启用"
                    anchors.leftMargin: 30
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text30
                    x: 221
                    y: 472
                    height: 24
                    color: "#00c8fa"
                    text: "12.0V"
                    anchors.leftMargin: 30
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: text32
                    x: 543
                    y: 472
                    height: 24
                    color: "#00c8fa"
                    text: "40°C"
                    anchors.leftMargin: 350
                    font.pixelSize: 28
                    anchors.left: text17.right
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Rectangle {
                id: rectangle7
                color: "#00ffffff"
                border.color: "#213a63"
                border.width: 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: rectangle6.bottom
                anchors.topMargin: -4

                Image {
                    id: image3
                    x: 61
                    y: 34
                    width: 50
                    height: 50
                    source: "../image/device_page/icon_volt.png"
                }

                Text {
                    id: text29
                    x: 131
                    y: 46
                    height: 24
                    color: "#8ea0c0"
                    text: "电压 :"
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }

                Image {
                    id: image4
                    x: 386
                    y: 34
                    width: 50
                    height: 50
                    source: "../image/device_page/icon_temp.png"
                }

                Text {
                    id: text31
                    x: 459
                    y: 46
                    height: 24
                    color: "#8ea0c0"
                    text: "温度 :"
                    font.pixelSize: 28
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
}
