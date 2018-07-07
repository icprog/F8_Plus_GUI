import QtQuick 2.4
//import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4 as Ctrl_1_4

Item {
    id: item1
    width: 1280
    height: 800
    property alias button1: button1

    Button {
        id: button1
        x: 1172
        y: 8
        text: qsTr("返回")
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        visible: listView1.currentIndex===0?true:false
        anchors.right: button1.right
        anchors.rightMargin: 0
        anchors.bottom: rectangle9.bottom
        anchors.bottomMargin: 0
        anchors.left: rectangle9.right
        anchors.leftMargin: 0
        anchors.top: button1.bottom
        anchors.topMargin: 0

        Rectangle {
            id: rectangle1
            x: 270
            y: 96
            width: 506
            height: 119
            color: "#ffffff"
            border.color: "#000000"

            Text {
                id: text2
                x: 50
                y: 53
                width: 108
                height: 28
                text: qsTr("MAC地址")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            Text {
                id: text3
                x: 199
                y: 53
                width: 108
                height: 28
                text: qsTr("AA-AA-AA-AA-AA-AA")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: rectangle2
            x: 270
            y: 215
            width: 506
            height: 119
            color: "#ffffff"
            border.width: 1
            Text {
                id: text4
                x: 50
                y: 53
                width: 108
                height: 28
                text: qsTr("IP地址获取方式")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            ComboBox {
                id: comboBox1
                x: 202
                y: 47
                model: ["DHCP", "手动获取"]
            }
        }

        Rectangle {
            id: rectangle3
            x: 270
            y: 334
            width: 506
            height: 219
            color: "#ffffff"
            Text {
                id: text6
                x: 51
                y: 24
                width: 108
                height: 28
                text: qsTr("IP地址")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: text8
                x: 51
                y: 79
                width: 108
                height: 28
                text: qsTr("子网掩码")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: text9
                x: 51
                y: 126
                width: 108
                height: 28
                text: qsTr("w网关")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: text7
                x: 255
                y: 24
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: textField1
                x: 207
                y: 24
                width: 48
                height: 28
                text: qsTr("")
            }

            TextField {
                id: textField2
                x: 261
                y: 24
                width: 48
                height: 28
                text: qsTr("")
            }

            Text {
                id: text10
                x: 309
                y: 24
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: text11
                x: 364
                y: 24
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: textField3
                x: 317
                y: 24
                width: 48
                height: 28
                text: qsTr("")
            }

            TextField {
                id: textField4
                x: 372
                y: 24
                width: 48
                height: 28
                text: qsTr("")
            }

            TextField {
                id: textField5
                x: 207
                y: 79
                width: 48
                height: 28
                text: qsTr("")
            }

            Text {
                id: text12
                x: 255
                y: 79
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: textField6
                x: 261
                y: 79
                width: 48
                height: 28
                text: qsTr("")
            }

            Text {
                id: text13
                x: 309
                y: 79
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: text14
                x: 364
                y: 79
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: textField7
                x: 317
                y: 79
                width: 48
                height: 28
                text: qsTr("")
            }

            TextField {
                id: textField8
                x: 372
                y: 79
                width: 48
                height: 28
                text: qsTr("")
            }

            TextField {
                id: textField9
                x: 207
                y: 126
                width: 48
                height: 28
                text: qsTr("")
            }

            Text {
                id: text15
                x: 255
                y: 126
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: textField10
                x: 261
                y: 126
                width: 48
                height: 28
                text: qsTr("")
            }

            Text {
                id: text16
                x: 309
                y: 126
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: text17
                x: 364
                y: 126
                width: 8
                height: 28
                text: qsTr(".")
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: textField11
                x: 317
                y: 126
                width: 48
                height: 28
                text: qsTr("")
            }

            TextField {
                id: textField12
                x: 372
                y: 126
                width: 48
                height: 28
                text: qsTr("")
            }
            border.width: 1
        }
    }

    Rectangle {
        id: rectangle4
        color: "#ffffff"
        visible: listView1.currentIndex==1?true:false
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.top: rectangle.top
        anchors.right: rectangle.right
        anchors.bottom: rectangle.bottom
        anchors.left: rectangle.left
        anchors.topMargin: 0

        Rectangle {
            id: rectangle10
            x: 130
            y: 59
            width: 241
            height: 621
            color: "#ffffff"
            clip: true
            border.width: 1

            ListView {
                id: listView2
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.bottomMargin: 8
                anchors.topMargin: 8
                anchors.fill: parent
                model: ListModel {
                    ListElement {
                        name: "主控卡"
                        version: "V1.0.0"
                    }

                    ListElement {
                        name: "背板"
                        version: "V1.0.0"
                    }

                    ListElement {
                        name: "风扇"
                        version: "V1.0.0"
                    }

                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                    ListElement {
                        name: "slot1 DVI输入卡"
                        version: "V1.0.0"
                    }
                }
                delegate: Item {
                    x: 5
                    width: 80
                    height: 40
                    Row {
                        id: row1

                        Text {
                            text: name
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                        }
                        spacing: 10

                        Text {
                            text: version
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectangle5
        color: "#ffffff"
        visible: listView1.currentIndex===2?true:false
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.top: rectangle.top
        anchors.right: rectangle.right
        anchors.bottom: rectangle.bottom
        anchors.left: rectangle.left
        anchors.topMargin: 0

        Rectangle {
            id: rectangle6
            x: 223
            y: 71
            width: 716
            height: 574
            color: "#ffffff"
            border.width: 1

            Text {
                id: text20
                x: 54
                y: 314
                text: qsTr("返回主界面时长")
                font.pixelSize: 12
            }

            Text {
                id: text19
                x: 54
                y: 232
                text: qsTr("LED Gamma")
                font.pixelSize: 12
            }

            Text {
                id: text18
                x: 54
                y: 139
                text: qsTr("同步源选择")
                font.pixelSize: 12
            }

            Text {
                id: text5
                x: 54
                y: 46
                text: qsTr("同步状态")
                font.pixelSize: 12
            }

            ComboBox {
                id: comboBox3
                x: 379
                y: 125
                model: ["Genlock", "输入源"]

            }

            ComboBox {
                id: comboBox2
                x: 379
                y: 32
                model: ["关闭", "开启"]
            }

            Rectangle {
                id: rectangle7
                x: 0
                y: 366
                width: 716
                height: 112
                color: "#ffffff"
                border.width: 1

                ComboBox {
                    id: comboBox5
                    x: 379
                    y: 39
                    width: 142
                    height: 40
                    model: ["保存IP","保存IP、EDID", "全部恢复"]
                }

                Button {
                    id: button2
                    x: 574
                    y: 39
                    text: qsTr("恢复")
                }

                Text {
                    id: text21
                    x: 54
                    y: 53
                    text: qsTr("恢复出厂设置")
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle8
                x: 0
                y: 430
                width: 716
                color: "#ffffff"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: rectangle7.bottom
                anchors.topMargin: 0
                border.width: 1

                Text {
                    id: text22
                    x: 54
                    y: 51
                    text: qsTr("U盘离线升级")
                    font.pixelSize: 12
                }

                Button {
                    x: 574
                    y: 37
                    text: qsTr("升级")
                }

                Rectangle{
                    color :　"red"
                    x: 379
                    y: 47
                    width: 80
                    height: 20
                    Text {
                        id: text23

                        text: qsTr("未检测到U盘")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 12
                    }
                }
            }

            TextField {
                id: textField13
                x: 379
                y: 218
                width: 120
                height: 40
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
            }

            TextField {
                id: textField14
                x: 379
                y: 300
                width: 120
                height: 40
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
            }













        }

    }

    Rectangle {
        id: rectangle9
        x: 0
        y: 48
        width: 220
        height: 752
        color: "#ffffff"
        border.width: 1

        ListView {
            id: listView1
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            anchors.bottomMargin: 8
            anchors.topMargin: 8
            boundsBehavior: Flickable.StopAtBounds
            interactive: true
            visible: true
            anchors.fill: parent
            //anchors.top: stackView.top
            keyNavigationWraps: false
            model: ListModel {
                ListElement {
                    name: "网络通讯"
                }

                ListElement {
                    name: "固件版本"
                }

                ListElement {
                    name: "高级设置"
                }
            }
            delegate: Rectangle {
                id: rect
                width: listView1.width
                height: text1.height
                color: ListView.isCurrentItem ? "darkgray" : "lightgrey"
                Text {
                    id: text1
                    text: name
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: listView1.currentIndex = index
                }
            }
        }
    }
    //    StackView{
    //        id: stackView
    //        anchors.top: button1.bottom
    //        anchors.topMargin: 0
    //        anchors.bottom: parent.bottom
    //        anchors.bottomMargin: 0
    //        anchors.right: parent.right
    //        anchors.rightMargin: 0
    //        anchors.left: listView1.right
    //        anchors.leftMargin: 0
    //    }
}
