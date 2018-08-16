import QtQuick 2.4
import "../../controls"
import "../base"
BaseView {
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
        text: "语言"
    }

    Image {
        id: image
        z: -1
        anchors.fill: parent
        source: "qrc:/image/common/background.png"
    }
    DevNameLabel {
        x: 796
        y: 62
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
