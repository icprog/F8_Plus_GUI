import QtQuick 2.4
import "impl"
ConfigureSubButtonForm {
    signal clicked()
    implicitWidth:72
    implicitHeight:72
    mouseArea.onClicked:clicked()
}
