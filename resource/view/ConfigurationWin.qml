import QtQuick 2.4
import Backend 1.0
import "../"
ConfigurationWinForm {
    button1.onClicked: {
        Global.mainStackView.pop();
    }
    textMacAddr.text: ModelManager.getModel("ConfigurationNetworkModel").macAddr;
}
