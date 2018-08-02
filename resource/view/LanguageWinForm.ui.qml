import QtQuick 2.4
import "../controls"

Item {
    width: 1280
    height: 800
    property alias btnEn: btnEn
    property alias btnZh: btnZh
    property alias btnReturn: btnReturn
    ReturnButton {
        id: btnReturn
        x: 36
        y: 56
        width: 130
        height: 56
        text: qsTr("语言")
    }

    Image {
        id: image
        z: -1
        anchors.fill: parent
        source: "../image/common/background.png"
    }

    ToggleButton {
        id: btnZh
        x: 419
        y: 346
        visible: true
        toggle: true
    }

    ToggleButton {
        id: btnEn
        x: 682
        y: 346
        text: "English"
        toggle: false
        visible: true
    }
}
