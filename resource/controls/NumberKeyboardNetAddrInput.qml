import QtQuick 2.4
import "./impl/"
import "../"    // qrc:/
NumberKeyboardNetAddrInputForm {
    function updateDisplay()
    {
        var tmp = addr
        addr = [0,0,0,0]
        addr = tmp
    }
    mouseArea.onClicked: {
        Locator.showFloating(Global.getFloatingWin("NumberKeyboardNetAddrPanel"),this)
    }
}
