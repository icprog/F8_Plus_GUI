import QtQuick 2.4
import "impl"
import "../"
ConfigureFirewareVersionSubWinForm {
    isUi: false
    btnNormal.onClicked: m_state = 0
    btnInCard.onClicked: m_state = 1
    btnOutCard.onClicked: m_state = 2
    btnNormal.text:  TranslatorHelper.translator.tr(qsTr("常规"));
    btnInCard.text: TranslatorHelper.translator.tr(qsTr("输入子卡"));
    btnOutCard.text: TranslatorHelper.translator.tr(qsTr("输出子卡"));
    versionX : calculateVersionX()
    function calculateVersionX()
    {
        if(ModelSet.getModel("LanguageModel").json.lang === "zh")
        {
            if(m_state === 0)
                return 150
            else
                return 220
        }
        else
        {
            if(m_state === 0)
                return 370
            else if(m_state === 1)
                return 150
            else
                return 180
        }
    }
    function generalDevices()
    {
        var list = []
        if(!( "version" in ModelSet.getModel("DeviceFirwareVersionModel").json))
            return list
        list.push({"devName":TranslatorHelper.translator.tr(qsTr("主控卡")),"version": ModelSet.getModel("DeviceFirwareVersionModel").json.version})
        list.push({"devName":TranslatorHelper.translator.tr(qsTr("背板")),"version":ModelSet.getModel("DeviceFirwareVersionModel").json.backplane.version})
        return list;
    }
    function inputCardDevices()
    {
        var list = []
        if(!( "inputCard" in ModelSet.getModel("DeviceFirwareVersionModel").json))
            return list
        var inputCards = ModelSet.getModel("DeviceFirwareVersionModel").json.inputCard
        for(var i = 0; i< inputCards.length;i++)
            list.push({"devName":TranslatorHelper.translator.tr(qsTr("输入卡槽"))+(i+1),"version": inputCards[i].version});

        return list;
    }
    function outputCardDevices()
    {
        var list = []
        if(!( "outputCard" in ModelSet.getModel("DeviceFirwareVersionModel").json))
            return list
        var outputCards = ModelSet.getModel("DeviceFirwareVersionModel").json.outputCard
        for(var i = 0; i< outputCards.length;i++)
            list.push({"devName":TranslatorHelper.translator.tr(qsTr("输出卡槽"))+(i+1),"version": outputCards[i].version});

        return list;
    }
    function _getModel()
    {
        var list = null
        switch (m_state)
        {
           case 0:
               list = generalDevices()
               break
           case 1:
               list = inputCardDevices()
               break
        default:
            list = outputCardDevices()
            break
        }
        return list
    }
    listView.model: _getModel()
}
