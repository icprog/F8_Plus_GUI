import QtQuick 2.4
import "../../controls"
import "../base"

BaseView {
    width: 1280
    height: 800
    property alias text5: text5
    property alias text4: text4
    property alias text3: text3
    property alias text2: text2
    property alias text1: text1
    property alias returnButton: returnButton

    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/image/common/background.png"
        ReturnButton {
            id: returnButton
            x: 18
            y: 28
            text: "关于"
        }
        DevNameLabel {
            x: 796
            y: 62
        }

        Text {
            id: text1
            x: 75
            y: 165
            width: 1137
            color: "#8ea0c0"
            text: "欢迎使用F8 Plus，如果在使用过程中遇到什么问题或者什么意见，请您即使反馈给我们，我们会在第一时间给您答复。"
            wrapMode: Text.WordWrap
            clip: false
            font.pixelSize: 28
        }

        Text {
            id: text2
            x: 79
            y: 280
            color: "#8ea0c0"
            text: "当前系统版本:2.0.X.X"
            clip: false
            font.pixelSize: 28
            wrapMode: Text.WordWrap
        }

        Text {
            id: text3
            x: 80
            y: 352
            color: "#8ea0c0"
            text: "技术支持邮箱：support@novastar.tech"
            clip: false
            font.pixelSize: 28
            wrapMode: Text.WordWrap
        }

        Text {
            id: text4
            x: 81
            y: 420
            color: "#8ea0c0"
            text: "官方网站：http://www.novastar-led.cn"
            clip: false
            font.pixelSize: 28
            wrapMode: Text.WordWrap
        }

        Image {
            id: image1
            x: 86
            y: 497
            width: 527
            height: 220
            source: "../../image/about_page/qr_code.png"
        }

        Text {
            id: text5
            x: 139
            y: 735
            color: "#8ea0c0"
            text: "官方微信"
            anchors.horizontalCenter: rectangle.horizontalCenter
            clip: false
            font.pixelSize: 28
            wrapMode: Text.WordWrap
        }
        Text {
            id: text6
            x: 442
            y: 735
            color: "#8ea0c0"
            text: "Facebook"
            clip: false
            font.pixelSize: 28
            wrapMode: Text.WordWrap
        }

        Rectangle {
            id: rectangle
            x: 166
            y: 581
            width: 60
            height: 53
            color: "#00ffffff"
        }
    }
}
