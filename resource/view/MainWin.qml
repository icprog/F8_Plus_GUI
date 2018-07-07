import QtQuick 2.4
import "../"
MainWinForm {
    button4.onClicked: {
        Global.mainStackView.push(Global.getConfigurationWin())
    }
}
