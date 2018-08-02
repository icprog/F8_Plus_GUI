import QtQuick 2.4
import QtQuick.Controls 2.0

Item {
    width: 1280
    height: 800
    property alias rectangle2: rectangle2
    property alias swipeView: swipeView
    property alias rectangle1: rectangle1
    property alias rectangle: rectangle
    property alias st: st
    property alias button1: button1
    property alias button: button
    SwipeView {
        id: swipeView
        width: 500
        height: 500
    }
    StackView {
        id: st
        z: 1
        anchors.fill: parent
        initialItem: rectangle
    }
    Button {
        id: button
        x: 883
        y: 174
        text: qsTr("Button")
        z: 3
    }

    Button {
        id: button1
        x: 883
        y: 241
        text: qsTr("Button")
        z: 4
    }

    Rectangle {
        id: rectangle2
        x: 913
        y: 271
        width: 200
        height: 200
        color: "#b29a9a"
    }

    Rectangle {
        id: rectangle1
        x: 564
        y: 381
        width: 421
        height: 291
        color: "#392a2a"
    }

    Rectangle {
        id: rectangle
        x: 216
        y: 139
        width: 499
        height: 389
        color: "#f25151"
    }
}
