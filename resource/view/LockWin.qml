import QtQuick 2.4
import "impl"
import "../"
LockWinForm {
    text1.text: TranslatorHelper.translator.tr(qsTr("滑动解锁"))
    btnPowerOff.onClicked: {
         Locator.showFloating("ShutdownQueryPanel")
    }
    onVisibleChanged:  rectangle.y = initY
    mouseArea.onReleased:
    {
        if(rectangle.y < initY - offsetY + 10)
           Locator.showWin("UnLockWin")
        else
            rectangle.y = initY
    }
}
