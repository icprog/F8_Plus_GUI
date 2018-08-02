import QtQuick 2.4
import "impl"
TitleButtonForm {
    signal clicked()
    mouseArea.onClicked:
    {
        clicked()
    }
}
