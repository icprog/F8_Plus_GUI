import QtQuick 2.4
import "../"
import "../controls"
//import Backend 1.0
MainWinForm {

    txtDevName.text:ModelManager.getModel("DeviceInfoModel").devName    //设备名称绑定
    txtIP.text: ModelManager.getModel("ConfigurationNetworkModel").ipAddr   //ip地址绑定

    btnDevice.text:  TranslatorHelper.translator.tr(qsTr("设备")) //设备按钮语言绑定
    btnMVR.text:  TranslatorHelper.translator.tr(qsTr("预监"))    //预监按钮语言绑定
    btnSence.text:  TranslatorHelper.translator.tr(qsTr("场景"))  //场景按钮语言绑定
    btnSetting.text:  TranslatorHelper.translator.tr(qsTr("设置"))//设置按钮语言绑定
    btnAbout.text:  TranslatorHelper.translator.tr(qsTr("关于"))  //关于按钮语言绑定


    btnSetting.onClicked: { //进入设置界面
        Locator.showWin("ConfigurationWin")
    }
    btnLanguage.onClicked: {    //进入语言界面
        Locator.showWin("LanguageWin")

    }
    btnDevice.onClicked: {    //进入设备界面
        Locator.showWin("DeviceInfoWin")
    }
}
