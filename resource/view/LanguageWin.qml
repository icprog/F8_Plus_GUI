import QtQuick 2.4
import "../"
import "impl"

LanguageWinForm {
    btnReturn.text: TranslatorHelper.translator.tr(qsTr("语言"))  //语言界面返回按钮语言绑定
    btnZh.toggle: ModelSet.getModel("LanguageModel").lang === "zh" //中英文切换按钮绑定
    btnEn.toggle: ModelSet.getModel("LanguageModel").lang === "en"



    btnZh.onClicked: {
        if(ModelSet.getModel("LanguageModel").lang !== "zh")
        {
            ModelSet.getModel("LanguageModel").lang = "zh";   //更新语言到中文
            ModelSet.getModel("LanguageModel").flush();       //刷入后台
            Locator.hideWin();
        }
    }
    btnEn.onClicked: {
        if(ModelSet.getModel("LanguageModel").lang !== "en")
        {
            ModelSet.getModel("LanguageModel").lang = "en";   //更新语言英文
            ModelSet.getModel("LanguageModel").flush();       //刷入后台
            Locator.hideWin();
        }
    }
}
