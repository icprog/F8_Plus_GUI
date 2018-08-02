import QtQuick 2.4
import "../"
//import Backend 1.0
ConfigurationWinForm {

    returnButton.text:TranslatorHelper.translator.tr(qsTr("设置"));
    function preShow()
    {
        ModelManager.getModel("ConfigurationNetworkModel").revert();
        ModelManager.getModel("ConfigurationNetworkModel").disableSync();
    }
    function preHide()
    {
        ModelManager.getModel("ConfigurationNetworkModel").enableSync();
    }
    returnButton.onClicked: {
        Locator.hideWin()
    }
    btnNet.onClicked: m_state = 0
    btnFw.onClicked: m_state = 1
    btnAdvance.onClicked: m_state = 2
}
