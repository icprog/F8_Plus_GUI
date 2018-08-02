import QtQuick 2.4
import QtQuick.Controls 2.0
import "../../"
import "../base/"
BaseFloatingPanel {
    id: control
    property var comboBox: context
    context: CustomizingComboBox {
        visible: false
    }
    property alias listView: listView
    property alias titleText: titleText

    width: 1280
    height: 800
    property alias xButton: xButton

    Rectangle {
        id: rectangle
        width: 1280
        color: "#00ffffff"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            x: 688
            width: 592
            height: 800
            color: "#131d4d"
            anchors.leftMargin: 688
            anchors.fill: parent

            ListView {
                id: listView
                clip: true
                ScrollBar.vertical: ScrollBar {
                }
                boundsBehavior: Flickable.StopAtBounds
                anchors.top: parent.top
                anchors.topMargin: 187
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                currentIndex: 0
                model: ListModel {
                    ListElement {
                        name: "关闭"
                    }
                    ListElement {
                        name: "开启"
                    }
                }
                delegate: Rectangle {

                    width: 590
                    height: 90
                    Rectangle {
                        width: parent.width
                        height: 2
                        color: "#213a63"
                    }
                    color: ListView.isCurrentItem ? "#07b628" : rectangle1.color

                    Text {
                        x: 32
                        id: delegateText
                        color: parent.ListView.isCurrentItem ? "white" : "#00fadd"
                        height: 31
                        text: name
                        font.pixelSize: 30
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

            Text {
                id: titleText
                x: 43
                y: 133
                color: "#8ea0c0"
                text: "同步状态"
                font.pixelSize: 32
            }

            XButton {
                id: xButton
                x: 47
                y: 47
            }
        }
    }
}
