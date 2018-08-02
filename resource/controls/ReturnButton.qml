import QtQuick 2.4
import "impl"
ReturnButtonForm {

    signal clicked()
    implicitWidth:130
    implicitHeight:56
    mouseArea.onClicked:
    {
        this.clicked();
    }
}
