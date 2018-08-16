import QtQuick 2.4
import QtQuick.Controls 2.0
import "../../controls"
import "../base"
import "../"

BaseView {
    width: 1280
    height: 800
    property alias senceSubListWin: senceSubListWin
    property alias text4: text4
    property alias slider: slider
    property alias text1: text1
    property alias returnButton: returnButton
    property string t_bar_direction: "up"
    property string color1: t_bar_direction === "up" ? "#9cff4d" : "#000000"
    property string color2: t_bar_direction === "up" ? "#000000" : "#9cff4d"
    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/image/common/background.png"
        DevNameLabel {
            x: 796
            y: 62
        }
        ReturnButton {
            id: returnButton
            x: 37
            y: 56
            text: "场景"
        }

        Rectangle {
            id: rectangle
            x: 32
            y: 140
            width: 1214
            height: 622
            color: "#1a2c56"

            Rectangle {
                id: rectangle1
                x: 413
                width: 647
                color: "#111b48"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0

                Image {
                    id: image1
                    x: 12
                    y: 44
                    width: 40
                    height: 45
                    source: "../../image/sence_page/icon_sence.png"
                }

                Text {
                    id: text4
                    x: 68
                    y: 44
                    color: "#ffffff"
                    text: qsTr("Text")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 30
                }

                Rectangle {
                    id: rectangle16
                    x: 0
                    y: 130
                    width: 646
                    height: 363
                    color: "#000000"
                    Image {
                        id: image2
                        y: 165
                        width: 191
                        height: 148
                        anchors.verticalCenterOffset: -45
                        anchors.horizontalCenterOffset: 0
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.Stretch
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/image/mvr_page/invalid.png"
                    }

                    Text {
                        x: 458
                        color: "#8ea0c0"
                        text: "场景无信号"
                        anchors.horizontalCenterOffset: 0
                        anchors.top: image2.bottom
                        anchors.topMargin: 7
                        anchors.horizontalCenter: image2.horizontalCenter
                        font.pixelSize: 30
                    }
                }
            }

            Rectangle {
                id: rectangle2
                x: 1061
                y: 0
                width: 153
                height: 622
                color: "#00ffffff"

                Text {
                    id: text1
                    x: 24
                    y: 20
                    height: 24
                    color: "#8ea0c0"
                    text: "Load模式"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 24
                }

                Switch {

                    id: switch1
                    x: 15
                    y: 62
                    width: 129
                    text: ""
                    spacing: 0
                    checked: false
                    padding: 0
                    leftPadding: 0
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    enabled: true
                    indicator: Rectangle {
                        id: rectangle3
                        implicitWidth: 129
                        implicitHeight: 60
                        x: switch1.width - width - switch1.rightPadding
                        y: parent.height / 2 - height / 2
                        color: switch1.checked ? "#17a81a" : "#111b48"
                        radius: 30
                        border.width: 0
                        border.color: "#00101946"

                        Text {
                            id: text2
                            x: switch1.checked ? 18 : 67
                            y: 21
                            color: "#415982"
                            text: switch1.checked ? "ON" : "OFF"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            anchors.verticalCenterOffset: 0
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 26
                        }
                        Rectangle {
                            x: switch1.down ? 0 + switch1.visualPosition * (parent.width - width) : switch1.checked ? parent.width - width : 0
                            width: height
                            radius: 30
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 0
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            color: switch1.down ? "#cccccc" : "#ffffff"
                            border.color: switch1.checked ? (switch1.down ? "#17a81a" : "#21be2b") : "#999999"
                        }
                    }
                }

                HollowButton {
                    x: 17
                    y: 223
                    width: 120
                    radius: 30
                    text: "TAKE"
                }

                HollowButton {
                    x: 17
                    y: 140
                    width: 120
                    radius: 30
                    text: "CUT"
                }

                Slider {
                    id: slider
                    x: 46
                    y: 298
                    width: 91
                    height: 255
                    enabled: true
                    orientation: Qt.Vertical
                    padding: 0
                    leftPadding: 0
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    rotation: 0
                    to: 13
                    from: 0
                    value: 0
                    background: Image {
                        anchors.fill: parent
                        source: "../../image/sence_page/t-bar_bg.png"
                    }

                    handle: Image {
                        x: 0
                        y: 40 + slider.visualPosition * 140
                        width: 80
                        height: 68
                        fillMode: Image.Stretch
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../../image/sence_page/t-bar.png"
                    }
                }

                Text {
                    id: text3
                    x: 61
                    y: 559
                    color: "#8ea0c0"
                    text: "T-Bar"
                    font.pixelSize: 24
                }

                Column {
                    id: column
                    x: 0
                    y: 326
                    width: 46
                    height: 215
                    clip: false
                    spacing: 11

                    Rectangle {
                        id: rectangle4
                        y: 0
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 12 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: rectangle5
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 11 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        clip: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: rectangle6
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 10 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: rectangle7
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 9 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: rectangle8
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 8 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: rectangle9
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 7 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: rectangle10
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 6 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle {
                        id: rectangle11
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 5 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle {
                        id: rectangle12
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 4 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle {
                        id: rectangle13
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 3 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle {
                        id: rectangle14
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 2 * 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle {
                        id: rectangle15
                        width: 17
                        height: 6
                        color: 1 - slider.visualPosition >= 1.0 / 13 ? color1 : color2
                        radius: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            SenceSubListWin {
                id: senceSubListWin
                x: 8
                y: 8
                width: 400
                height: 606
            }
        }
    }
}
