import QtQuick 2.4
import "../"
import "impl"
ConfigurationWinForm {

    returnButton.text:TranslatorHelper.translator.tr(qsTr("设置"));
    btnNet.text: TranslatorHelper.translator.tr(qsTr("网络通讯"));
    btnFw.text: TranslatorHelper.translator.tr(qsTr("固件版本"));
    btnAdvance.text: TranslatorHelper.translator.tr(qsTr("高级设置"));
    text1.text: m_state === 0 ?btnNet.text : m_state === 1 ? btnFw.text :  btnAdvance.text
    function preShow()
    {
        ModelSet.getModel("DeviceIpModel").revert();
        ModelSet.getModel("DeviceIpModel").disableSync();
    }
    function preHide()
    {
        ModelSet.getModel("DeviceIpModel").enableSync();
    }

    btnNet.onClicked: {
        hideFloating()
        m_state = 0
    }
    btnFw.onClicked: {
        hideFloating()
        m_state = 1
    }
    btnAdvance.onClicked: {
        hideFloating()
        m_state = 2
    }
}
