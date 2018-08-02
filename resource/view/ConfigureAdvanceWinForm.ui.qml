import QtQuick 2.7
//import "../controls/floating/CustomizingComboBox"
import "../controls"
Item {
    width: 1059
    height: 542
    property alias customizingComboBox: customizingComboBox

    //    Flickable {
    //        id:flickable
    //        anchors.fill: parent
    //        clip: true
    //        boundsBehavior: Flickable.DragAndOvershootBounds
    //        flickableDirection: Flickable.VerticalFlick
    //        contentWidth: image.width;
    //        contentHeight: image.height

    //        Image { id: image; source: "../image/common/background.png" }
    //    }
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
                models: ["输入源1","输入源2","输入源3","输入源4","输入源5","输入源6","输入源7","输入源8","输入源9","输入源10","输入源11","输入源12"]
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
