import QtQuick 2.4
import "../"
DeviceInfoWinForm {
    btnSubCard.onClicked: {
        Locator.showFloating(Global.getFloatingWin("SubCardPanel"))
    }
    btnSubCardImage.source: Global.getFloatingWin("SubCardPanel").visible ? "qrc:/image/device_page/icon_lookup_pressed.png" : "qrc:/image/device_page/icon_lookup_normal.png"

    returnButton.onClicked:
    {
        Locator.hideWin()
    }
}
