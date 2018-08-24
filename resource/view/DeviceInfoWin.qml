import QtQuick 2.4
import "../"
import "impl"
DeviceInfoWinForm {
    Timer {
        interval: 1500;
        running: true;
        repeat: true
        onTriggered: {
//            console.log("xxxxxxxxxxxxxxx")
//            console.log(ModelSet.getModel("DeviceDetailModel").json.slotList.length)

//            console.log(JSON.stringify(ModelSet.getModel("DeviceDetailModel").json.slotList[0]))
//            console.log(inputTotal())

        }
    }
    text1.text : TranslatorHelper.translator.tr(qsTr("子卡状态"))
    text2.text : TranslatorHelper.translator.tr(qsTr("设备状态"))
    text3.text : TranslatorHelper.translator.tr(qsTr("输入源"))
    text4.text : TranslatorHelper.translator.tr(qsTr("有效："))
    text5.text : TranslatorHelper.translator.tr(qsTr("已用："))
    text6.text : TranslatorHelper.translator.tr(qsTr("未用："))
    text10.text : TranslatorHelper.translator.tr(qsTr("输出源"))
    text17.text : TranslatorHelper.translator.tr(qsTr("主/从状态："))
    text18.text : TranslatorHelper.translator.tr(qsTr("同步状态："))
    text19.text : TranslatorHelper.translator.tr(qsTr("主控卡状态："))
    text20.text : TranslatorHelper.translator.tr(qsTr("风扇板状态："))
    text21.text : TranslatorHelper.translator.tr(qsTr("背板状态："))

    text33.text: ModelSet.getModel("LanguageModel").json.lang && ModelSet.getModel("LanguageModel").json.lang === "zh" ? 3+TranslatorHelper.translator.tr(qsTr("张异常")) : TranslatorHelper.translator.tr(qsTr("张异常"))+":"+3
    alignX : ModelSet.getModel("LanguageModel").json.lang === "zh" ? 230 : 330
    function inputTotal()
    {
        if(!JSON.stringify(ModelSet.getModel("DeviceDetailModel").json.slotList ))
            return -1
        var inputTotal = 0
        for (var i =0;i< ModelSet.getModel("DeviceDetailModel").json.slotList.length;i++)
        {
            var slot =ModelSet.getModel("DeviceDetailModel").json.slotList[i]
            if(slot.cardType === 2)
            {
                inputTotal += slot.interfaces.length
            }

        }
        return inputTotal
    }
    function inputUsed()
    {
        if(!JSON.stringify(ModelSet.getModel("DeviceDetailModel").json.slotList ))
            return -1
        var inputUsed = 0
        for (var i =0;i< ModelSet.getModel("DeviceDetailModel").json.slotList.length;i++)
        {
            var slot =ModelSet.getModel("DeviceDetailModel").json.slotList[i]
            if(slot.cardType === 2)
            {
                for (var j =0;j< slot.interfaces.length;j++)
                {
                    var interface_ = slot.interfaces[j]
                    if(interface_.iSignal === 1)
                        inputUsed++
                }
            }
        }
        return inputUsed
    }
    function outputTotal()
    {
        if(!JSON.stringify(ModelSet.getModel("DeviceDetailModel").json.slotList ))
            return -1
        var outputTotal = 0
        for (var i =0;i< ModelSet.getModel("DeviceDetailModel").json.slotList.length;i++)
        {
            var slot =ModelSet.getModel("DeviceDetailModel").json.slotList[i]
            if(slot.cardType === 3)
                outputTotal += slot.interfaces.length
        }
        return outputTotal
    }
    function outputUsed()
    {
        if(!JSON.stringify(ModelSet.getModel("DeviceDetailModel").json.slotList ))
            return -1
        var outputUsed = 0
        for (var i =0;i< ModelSet.getModel("DeviceDetailModel").json.slotList.length;i++)
        {
            var slot =ModelSet.getModel("DeviceDetailModel").json.slotList[i]
            if(slot.cardType === 3)
            {
                for (var j =0;j< slot.interfaces.length;j++)
                {
                    var interface_ = slot.interfaces[j]
                    if(interface_.iSignal === 1)
                        outputUsed++
                }
            }
        }
        return outputUsed
    }

    text7.text:inputTotal() === -1? 0:inputTotal()
    text8.text:inputUsed()=== -1? 0:inputUsed()
    text9.text:parseInt(text7.text) - parseInt(text8.text)
    text14.text:outputTotal()=== -1? 0:outputTotal()
    text15.text:outputUsed()=== -1? 0:outputUsed()
    text16.text:parseInt(text14.text) - parseInt(text15.text)

    text23.text: ModelSet.getModel("DeviceGenlockModel").type === 2 ? "Slave" : "Master" //Master
    text24.text:ModelSet.getModel("DeviceGenlockModel").enable === 0 ? TranslatorHelper.translator.tr(qsTr("关闭")) : ModelSet.getModel("DeviceGenlockModel").type === 0 ?  "Genlock" : TranslatorHelper.translator.tr(qsTr("输入源"))+ModelSet.getModel("DeviceGenlockModel").inputId //Genlock

    text28.text: "enable" in ModelSet.getModel("MVREnableModel").json ? ModelSet.getModel("MVREnableModel").json.enable === 0 ? TranslatorHelper.translator.tr(qsTr("关闭")) : TranslatorHelper.translator.tr(qsTr("启用")): "" //MVR




    winName:  TranslatorHelper.translator.tr(qsTr("设备"))
    btnSubCard.onClicked: {
        Locator.showFloating("SubCardPanel")
    }
    btnSubCardImage.source: Locator.getFloatingWin("SubCardPanel").visible ? "qrc:/image/device_page/icon_lookup_pressed.png" : "qrc:/image/device_page/icon_lookup_normal.png"

}
