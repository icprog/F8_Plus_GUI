import QtQuick 2.4
import "impl"
HollowButtonForm {
    implicitWidth:231
    implicitHeight:462
    enabled: true
    text1.text: TranslatorHelper.translator.tr(qsTr("应用"))
    signal clicked()
    mouseArea.onClicked: clicked()
}
