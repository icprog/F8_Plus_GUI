import QtQuick 2.4
import "impl"
ToggleButtonForm {
    implicitWidth:200
    implicitHeight:78
    signal clicked()
    btn.onClicked:
    {
        this.clicked()
    }
}
