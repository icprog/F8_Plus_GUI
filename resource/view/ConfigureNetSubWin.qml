import QtQuick 2.4
import "impl"
import "../"
ConfigureNetSubWinForm {
    property var model: ModelSet.getModel("DeviceIpModel").json
    comboBox.models: ["DHCP",TranslatorHelper.translator.tr(qsTr("手动设置"))]

    comboBox.name : TranslatorHelper.translator.tr(qsTr("IP获取方式"));
//    comboBox.delegate: function (model){
//        return model.name
//    }
    netAddrInput.enabled: comboBox.currentIndex === 0 ? false : true
    netAddrInput1.enabled: comboBox.currentIndex === 0 ? false : true
    netAddrInput2.enabled: comboBox.currentIndex === 0 ? false : true
    text7.text:  ModelSet.getModel("DeviceIpModel").mac
    hollowButton.text: TranslatorHelper.translator.tr(qsTr("应用"));
    text2.text: TranslatorHelper.translator.tr(qsTr("IP获取方式："));
    text3.text:TranslatorHelper.translator.tr(qsTr("IP地址："));
    text4.text: TranslatorHelper.translator.tr(qsTr("子网掩码："));
    text5.text: TranslatorHelper.translator.tr(qsTr("网关："));

    netAddrInput.addr: [model.ip.ip0,model.ip.ip1,model.ip.ip2,model.ip.ip3]
    netAddrInput.title : TranslatorHelper.translator.tr(qsTr("IP地址"));
    netAddrInput.tisp : TranslatorHelper.translator.tr(qsTr("IP地址不合规"));
    netAddrInput1.addr: [model.subnetMask.subnetMask0,model.subnetMask.subnetMask1,model.subnetMask.subnetMask2,model.subnetMask.subnetMask3]
    netAddrInput1.title : TranslatorHelper.translator.tr(qsTr("子网掩码"));
    netAddrInput1.tisp : TranslatorHelper.translator.tr(qsTr("子网掩码不合规"));
    netAddrInput2.addr: [model.gateway.gateway0,model.gateway.gateway1,model.gateway.gateway2,model.gateway.gateway3]
    netAddrInput2.title : TranslatorHelper.translator.tr(qsTr("网关"));
    netAddrInput2.tisp : TranslatorHelper.translator.tr(qsTr("网关不合规"));

    hollowButton.onClicked:
    {
        model.ip.ip0 = netAddrInput.addr[0]
        model.ip.ip1 = netAddrInput.addr[1]
        model.ip.ip2 = netAddrInput.addr[2]
        model.ip.ip3 = netAddrInput.addr[3]

        model.subnetMask.subnetMask0 = netAddrInput1.addr[0]
        model.subnetMask.subnetMask1 = netAddrInput1.addr[1]
        model.subnetMask.subnetMask2 = netAddrInput1.addr[2]
        model.subnetMask.subnetMask3 = netAddrInput1.addr[3]

        model.gateway.gateway0 = netAddrInput2.addr[0]
        model.gateway.gateway1 = netAddrInput2.addr[1]
        model.gateway.gateway2 = netAddrInput2.addr[2]
        model.gateway.gateway3 = netAddrInput2.addr[3]
        ModelSet.getModel("DeviceIpModel").json = model
        ModelSet.getModel("DeviceIpModel").flush()
    }


}
