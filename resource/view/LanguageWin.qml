import QtQuick 2.4
import "../"
LanguageWinForm {
    btnReturn.text: TranslatorHelper.translator.tr(qsTr("语言"))  //语言界面返回按钮语言绑定
    btnZh.toggle: ModelManager.getModel("DeviceInfoModel").lang === "zh" //中英文切换按钮绑定
    btnEn.toggle: ModelManager.getModel("DeviceInfoModel").lang === "en"


    btnReturn.onClicked: {
        Locator.hideWin();
    }
    btnZh.onClicked: {
        if(ModelManager.getModel("DeviceInfoModel").lang !== "zh")
        {
            ModelManager.getModel("DeviceInfoModel").lang = "zh";   //更新语言到中文
            ModelManager.getModel("DeviceInfoModel").flush();       //刷入后台
            Locator.hideWin();
        }
    }
    btnEn.onClicked: {
        if(ModelManager.getModel("DeviceInfoModel").lang !== "en")
        {
            ModelManager.getModel("DeviceInfoModel").lang = "en";   //更新语言英文
            ModelManager.getModel("DeviceInfoModel").flush();       //刷入后台
            Locator.hideWin();
        }
    }
}
