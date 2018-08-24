import QtQuick 2.4
import "./impl/"
import "../"    // qrc:/
NetAddrInputForm {
    opacity: enabled === true ? 1.0 : 0.5
    property string title: ""
    property string tisp: ""
    function updateDisplay()
    {
        var tmp = addr
        addr = [0,0,0,0]
        addr = tmp
    }
    mouseArea.onClicked: {
        Locator.showFloating("NetAddrPanel",this)
    }
}
