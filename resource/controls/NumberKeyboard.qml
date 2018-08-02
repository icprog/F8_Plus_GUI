import QtQuick 2.4
import "impl"
NumberKeyboardForm {
    signal key(string value)
    implicitWidth:517
    implicitHeight:480
    mouseArea.onClicked: key("1")
    mouseArea1.onClicked: key("2")
    mouseArea2.onClicked: key("3")
    mouseArea3.onClicked: key(".")
    mouseArea4.onClicked: key("4")
    mouseArea5.onClicked: key("5")
    mouseArea6.onClicked: key("6")
    mouseArea8.onClicked: key("7")
    mouseArea7.onClicked: key("0")
    mouseArea9.onClicked: key("8")
    mouseArea10.onClicked: key("9")
    mouseArea11.onClicked: key("back")
    mouseArea12.onClicked: key("enter")
}
