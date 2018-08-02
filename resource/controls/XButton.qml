import QtQuick 2.4
import "impl"
XButtonForm {
    implicitWidth:52
    implicitHeight:51

    signal clicked()
    mouseArea.onClicked: {
        clicked()
    }
}
