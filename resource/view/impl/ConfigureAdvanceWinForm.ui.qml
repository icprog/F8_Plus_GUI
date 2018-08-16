import QtQuick 2.7
import "../../controls"

Item {
    width: 1059
    height: 542
    property alias numberInput1: numberInput1
    property alias text8: text8
    property alias text7: text7
    property alias hollowButton2: hollowButton2
    property alias text10: text10
    property alias numberInput: numberInput
    property alias customizingComboBox1: customizingComboBox1
    property alias hollowButton1: hollowButton1
    property alias hollowButton: hollowButton
    property alias customizingComboBox2: customizingComboBox2
    property alias text6: text6
    property alias text4: text4
    property alias text5: text5
    property alias text2: text2
    property alias text1: text1
    property alias customizingComboBox: customizingComboBox

    Flickable {
        id: flickable
        anchors.fill: parent
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.VerticalFlick
        contentWidth: rectangle.width
        contentHeight: rectangle.height

        Rectangle {
            id: rectangle
            width: parent.width
            height: 640
            color: "#ffffff"

            Text {
                id: text1
                x: 48
                y: 53
                color: "#8ea0c0"
                text: "同步状态 :"
                font.pixelSize: 28
            }
            CustomizingComboBox {
                id: customizingComboBox
                x: 245
                y: 36
            }

            Text {
                id: text2
                x: 48
                y: 151
                color: "#8ea0c0"
                text: "同步源选择 :"
                font.pixelSize: 28
            }

            Text {
                id: text3
                x: 48
                y: 254
                color: "#8ea0c0"
                text: "LED Gamma :"
                font.pixelSize: 28
            }

            Text {
                id: text4
                x: 48
                y: 336
                width: 146
                height: 42
                color: "#8ea0c0"
                text: "返回主界面时长 :"
                wrapMode: Text.WordWrap
                font.pixelSize: 28
            }
            Text {
                id: text5
                x: 48
                y: 450
                color: "#8ea0c0"
                text: "恢复出厂设置 :"
                font.pixelSize: 28
            }

            Text {
                id: text6
                x: 48
                y: 546
                color: "#8ea0c0"
                text: "U盘离线升级 :"
                font.pixelSize: 28
            }

            CustomizingComboBox {
                id: customizingComboBox1
                x: 245
                y: 134
                name: "同步源选择"
                models: ["GenLock", "输入源1", "输入源2", "输入源3", "输入源4", "输入源5", "输入源6", "输入源7", "输入源8", "输入源9", "输入源10", "输入源11", "输入源12"]
            }

            NumberInput {
                id: numberInput
                x: 243
                y: 289
                width: 263
                visible: true
                realNumber: true
                title: "LED Gamma"
                max: 4.0
                min: 0.25
                anchors.verticalCenter: text3.verticalCenter
            }

            Text {
                id: text7
                x: 534
                y: 254
                color: "#8ea0c0"
                text: "(范围：0.25～4.00)"
                font.pixelSize: 28
            }

            NumberInput {
                id: numberInput1
                x: 243
                y: 326
                width: 263
                text: " "
                anchors.verticalCenterOffset: 101
                anchors.verticalCenter: text3.verticalCenter

                Text {
                    id: text9
                    x: 233
                    y: 10
                    height: 42
                    color: "#8ea0c0"
                    text: "S"
                    font.pixelSize: 28
                    wrapMode: Text.WordWrap
                }
            }

            Text {
                id: text8
                x: 534
                y: 355
                color: "#8ea0c0"
                text: "(范围：5～90)"
                font.pixelSize: 28
            }

            CustomizingComboBox {
                id: customizingComboBox2
                x: 243
                y: 440
                name: "恢复出厂设置"
                models: ["保存IP", "保存IP和EDID", "全部恢复"]
            }
            HollowButton {
                id: hollowButton1
                x: 833
                y: 151
            }
            HollowButton {
                id: hollowButton
                x: 534
                y: 442
                text: "恢复"
            }

            Rectangle {
                id: rectangle1
                x: 245
                y: 536
                width: 263
                height: 62
                color: "#3b547c"

                Text {
                    id: text10
                    color: "#00c8fa"
                    text: "未见测到U盘"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    font.pixelSize: 28
                }
            }

            HollowButton {
                id: hollowButton2
                x: 534
                y: 538
                enabled: false
                text: "升级"
            }
        }
    }
    Rectangle {
        id: scrollbar
        anchors.right: flickable.right
        y: flickable.visibleArea.yPosition * flickable.height
        width: 12
        height: flickable.visibleArea.heightRatio * flickable.height
        color: "#415982"
        radius: 6
    }
}
