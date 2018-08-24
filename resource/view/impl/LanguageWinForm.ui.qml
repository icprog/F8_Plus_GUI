import QtQuick 2.4
import "../../controls"
import "../base"

BaseView {
    width: 1280
    height: 800
    property alias btnEn: btnEn
    property alias btnZh: btnZh
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
