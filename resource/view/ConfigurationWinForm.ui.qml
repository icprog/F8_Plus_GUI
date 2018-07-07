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

    ListView {
        id: listView1
        width: 110
        anchors.top: button1.bottom
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        //anchors.top: stackView.top
        anchors.topMargin: 0
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

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.right: button1.right
        anchors.rightMargin: 0
        anchors.bottom: listView1.bottom
        anchors.bottomMargin: 0
        anchors.left: listView1.right
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

            Text {
                id: text2
                x: 60
                y: 53
                width: 99
                height: 28
                text: qsTr("MAC")
                font.pixelSize: 12
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
