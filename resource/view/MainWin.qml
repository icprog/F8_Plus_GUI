import QtQuick 2.4
import "../"
MainWinForm {
    button4.onClicked: {
        ModelManager.getModel("ConfigurationNetworkModel").revert();
        Global.mainStackView.push(Global.getConfigurationWin())
    }
}
