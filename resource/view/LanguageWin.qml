import QtQuick 2.4
import "../"
import "impl"

LanguageWinForm {
    winName: TranslatorHelper.translator.tr(qsTr("语言"))  //语言界面返回按钮语言绑定
    btnZh.toggle: ModelSet.getModel("LanguageModel").json.lang === "zh" //中英文切换按钮绑定
    btnEn.toggle: ModelSet.getModel("LanguageModel").json.lang === "en"



    btnZh.onClicked: {
        if(ModelSet.getModel("LanguageModel").json.lang !== "zh")
        {
            var json = ModelSet.getModel("LanguageModel").json
            json.lang = "zh";   //更新语言到中文
            ModelSet.getModel("LanguageModel").json = json
            ModelSet.getModel("LanguageModel").flush();       //刷入后台
            Locator.hideWin();
        }
    }
    btnEn.onClicked: {
        if(ModelSet.getModel("LanguageModel").json.lang !== "en")
        {
            var json = ModelSet.getModel("LanguageModel").json
            json.lang = "en";   //更新语言英文
            ModelSet.getModel("LanguageModel").json = json
            ModelSet.getModel("LanguageModel").flush();       //刷入后台
            Locator.hideWin();
        }
    }
}
