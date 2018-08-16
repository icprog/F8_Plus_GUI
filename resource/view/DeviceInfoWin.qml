import QtQuick 2.4
import "../"
import "impl"
DeviceInfoWinForm {
    text1.text : TranslatorHelper.translator.tr(qsTr("子卡状态"))
    text2.text : TranslatorHelper.translator.tr(qsTr("设备状态"))
    text3.text : TranslatorHelper.translator.tr(qsTr("输入源"))
    text10.text : TranslatorHelper.translator.tr(qsTr("输出源"))
    text17.text : TranslatorHelper.translator.tr(qsTr("主/从状态"))
    text18.text : TranslatorHelper.translator.tr(qsTr("同步状态"))
    text19.text : TranslatorHelper.translator.tr(qsTr("主控卡状态"))
    text20.text : TranslatorHelper.translator.tr(qsTr("风扇板状态"))
    text21.text : TranslatorHelper.translator.tr(qsTr("背板状态"))
    text29.text : TranslatorHelper.translator.tr(qsTr("电压"))
    text31.text : TranslatorHelper.translator.tr(qsTr("温度"))

    text33.text: ModelSet.getModel("LanguageModel").lang === "zh" ? 3+TranslatorHelper.translator.tr(qsTr("张异常")) : TranslatorHelper.translator.tr(qsTr("张异常"))+":"+3

    text7.text:ModelSet.getModel("DeviceDetailModel").inputTotal;
    text8.text:ModelSet.getModel("DeviceDetailModel").inputUsed;
    text9.text:ModelSet.getModel("DeviceDetailModel").inputUnUsed;
    text14.text:ModelSet.getModel("DeviceDetailModel").outputTotal;
    text15.text:ModelSet.getModel("DeviceDetailModel").outputUsed;
    text16.text:ModelSet.getModel("DeviceDetailModel").outputUnUsed;

    text23.text: ModelSet.getModel("DeviceGenlockModel").type === 2 ? "Slave" : "Master" //Master
    text24.text:ModelSet.getModel("DeviceGenlockModel").enable === 0 ? TranslatorHelper.translator.tr(qsTr("关闭")) : ModelSet.getModel("DeviceGenlockModel").type === 0 ?  "Genlock" : TranslatorHelper.translator.tr(qsTr("输入源"))+ModelSet.getModel("DeviceGenlockModel").inputId //Genlock

    text28.text: ModelSet.getModel("MVREnableModel").enable === 0 ? TranslatorHelper.translator.tr(qsTr("关闭")) : TranslatorHelper.translator.tr(qsTr("启用")) //MVR




    returnButton.text: TranslatorHelper.translator.tr(qsTr("设备"))
    btnSubCard.onClicked: {
        Locator.showFloating("SubCardPanel")
    }
    btnSubCardImage.source: Locator.getFloatingWin("SubCardPanel").visible ? "qrc:/image/device_page/icon_lookup_pressed.png" : "qrc:/image/device_page/icon_lookup_normal.png"

}
