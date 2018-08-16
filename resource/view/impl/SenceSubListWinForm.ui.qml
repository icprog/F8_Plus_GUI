import QtQuick 2.4
import QtQuick.Controls 2.0

Item {
    property bool isUi: listView.model === _model ? true : false
    width: 410
    height: 606
    property alias listView: listView
    property alias listView1: listView1
    property int currentPresetIndex: 0
    ListView {
        id: listView
        x: 0
        y: 14
        width: 195
        height: 584
        spacing: 5
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            x: 180
            y: 0
            width: 15
            height: 584
            position: scrollBar1.position
            bottomPadding: 0
            visible: false
        }
        clip: true
        model: ListModel {
            id: _model
            ListElement {
                name: "这是一个大场景1"
                presetId: 0
            }

            ListElement {
                name: "这是一个大场景2"
                presetId: 1
            }

            ListElement {
                name: "这是一个大场景3"
                presetId: 2
            }
            ListElement {
                name: "这是一个大场景3"
                presetId: 2
            }
            ListElement {
                name: "这是一个大场景3"
                presetId: 2
            }
            ListElement {
                name: "这是一个大场景3"
                presetId: 2
            }
            ListElement {
                name: "这是一个大场景3"
                presetId: 2
            }
            ListElement {
                name: "这是一个大场景3"
                presetId: 2
            }
            ListElement {
                name: "这是一个大场景3"
                presetId: 2
            }
        }
        delegate: Rectangle {
            color: "#00ffffff"
            border.color: ListView.currentIndex * 2 === currentPresetIndex ? "#07b628" : "#00ffffff"
            border.width: 4
            width: 180
            height: 140
            Image {
                x: parent.border.width
                y: parent.border.width
                width: parent.width - 2 * parent.border.width
                height: parent.height - 2 * parent.border.width
                clip: true
                source: "../image/sence_page/sence_bg.png"
                Text {
                    y: 43
                    color: "#07e8ff"
                    text: name
                    font.pixelSize: 22
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Rectangle {
                    y: 100
                    width: parent.width
                    anchors.bottom: parent.bottom
                    color: presetId % 2 === 0 ? "#056a08" : "#7f060b"
                    Text {
                        color: "#80ffffff"
                        text: presetId % 2 === 0 ? "PVW" : "PGM"
                        font.pixelSize: 24
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }

    ListView {
        id: listView1
        x: 201
        y: 14
        width: 209
        height: 584
        spacing: 5
        boundsBehavior: Flickable.StopAtBounds
        clip: true
        ScrollBar.vertical: ScrollBar {
            id: scrollBar1
            x: 191
            y: 11
            position: scrollBar.position
            pressed: false
            visible: true
            width: 17
            height: 584
        }
        model: listView.model
        delegate: Rectangle {
            width: 180
            height: 140
            color: "#00ffffff"
            border.width: 4
            border.color: ListView.currentIndex * 2 + 1
                          === currentPresetIndex ? "#07b628" : "#00ffffff"
            Image {
                x: parent.border.width
                y: parent.border.width
                width: parent.width - 2 * parent.border.width
                height: parent.height - 2 * parent.border.width
                clip: true
                source: "../image/sence_page/sence_bg.png"

                Text {
                    y: 43
                    color: "#07e8ff"
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 22
                }

                Rectangle {
                    y: 100
                    width: parent.width
                    anchors.bottom: parent.bottom
                    color: presetId % 2 === 0 ? "#056a08" : "#7f060b"
                    Text {
                        color: "#80ffffff"
                        text: presetId % 2 === 0 ? "PVW" : "PGM"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 24
                    }
                }
            }
        }
    }
}
