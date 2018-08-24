import QtQuick 2.0
import "../../controls"
Item {
    width: 1280
    height: 800
    property bool dispDevName: true
    property bool dispReturnButton: true
    property alias returnButton: returnButton
    property alias devNameLabel: devNameLabel
    property alias winName:returnButton.text
    Component.onCompleted: {
        //TranslatorHelper.update()
    }

    Image {
        id: image

        anchors.fill: parent
        source: "../../image/common/background.png"
        DevNameLabel{
            id: devNameLabel
            visible: dispDevName
            x: 796
            y: 62
        }
        ReturnButton{
            id:returnButton
            visible: dispReturnButton
            x:36
            y:56
        }
    }

}
