import QtQuick 2.4
import "../"
import "../controls"
import "impl"
MainWinForm {
    name : "MainWin"
    visible: false

    btnDevice.text:  TranslatorHelper.translator.tr(qsTr("设备")) //设备按钮语言绑定
    btnMVR.text:  TranslatorHelper.translator.tr(qsTr("预监"))    //预监按钮语言绑定
    btnSence.text:  TranslatorHelper.translator.tr(qsTr("场景"))  //场景按钮语言绑定
    btnSetting.text:  TranslatorHelper.translator.tr(qsTr("设置"))//设置按钮语言绑定
    btnAbout.text:  TranslatorHelper.translator.tr(qsTr("关于"))  //关于按钮语言绑定
    btnLanguage.text: TranslatorHelper.translator.tr(qsTr("语言"))

    btnLock.onClicked:Locator.lockScreen()
    btnSetting.onClicked: { //进入设置界面
        Locator.showWin("ConfigurationWin")
    }
    btnLanguage.onClicked: {    //进入语言界面
        Locator.showWin("LanguageWin")

    }
    btnDevice.onClicked: {    //进入设备界面
        Locator.showWin("DeviceInfoWin")
    }
   btnSence.onClicked: {    //进入场景界面
        Locator.showWin("SenceWin")
    }
   btnMVR.onClicked: {    //进入预监界面
        Locator.showWin("MVRWin")
    }
   btnAbout.onClicked: {    //进入关于界面
        Locator.showWin("AboutWin")
    }
   btnPowerOff.onClicked: {
        Locator.showFloating("ShutdownQueryPanel")
   }

}
