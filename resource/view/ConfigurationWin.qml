import QtQuick 2.4
import "../"
//import Backend 1.0
ConfigurationWinForm {

    button1.onClicked: {
        Global.mainStackView.pop();
    }
    textMacAddr.text: ModelManager.getModel("ConfigurationNetworkModel").macAddr;
    //textMacAddr.text: "abc"
}
