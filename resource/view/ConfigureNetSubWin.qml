import QtQuick 2.4
import "impl"
import "../"
ConfigureNetSubWinForm {

    comboBox.models: [TranslatorHelper.translator.tr(qsTr("DHCP")),TranslatorHelper.translator.tr(qsTr("手动设置"))]

    comboBox.name : TranslatorHelper.translator.tr(qsTr("IP获取方式"));
//    comboBox.delegate: function (model){
//        return model.name
//    }
    netAddrInput.enabled: comboBox.currentIndex === 0 ? false : true
    netAddrInput1.enabled: comboBox.currentIndex === 0 ? false : true
    netAddrInput2.enabled: comboBox.currentIndex === 0 ? false : true
    text7.text:  ModelSet.getModel("DeviceIpModel").mac
    hollowButton.text: TranslatorHelper.translator.tr(qsTr("应用"));
    text2.text: TranslatorHelper.translator.tr(qsTr("IP获取方式"));
    text3.text:TranslatorHelper.translator.tr(qsTr("IP地址"));
    text4.text: TranslatorHelper.translator.tr(qsTr("子网掩码"));
    text5.text: TranslatorHelper.translator.tr(qsTr("网关"));

    netAddrInput.addr: ModelSet.getModel("DeviceIpModel").ip
    netAddrInput1.addr: ModelSet.getModel("DeviceIpModel").subnetMask
    netAddrInput2.addr: ModelSet.getModel("DeviceIpModel").gateway
    hollowButton.onClicked: ModelSet.getModel("DeviceIpModel").flush()

}
