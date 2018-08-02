pragma Singleton
import QtQuick 2.0
Item {
    property var mainStackView: null
    property var topStackView: null
    property var floatingContainer:null
    property var configurationWin: null;
    property var _map: null
    function _getMap()
    {
        if(_map === null)
            _map = {}
        return _map
    }
    function getWin(winName)
    {
        var map = _getMap()
        if(!map.hasOwnProperty(winName))
        {
            map[winName] = Qt.createComponent("view/"+winName+".qml").createObject();
        }
        return map[winName]
    }
    function getFloatingWin(floatingWinName)
    {
        var map = _getMap()
        if(!map.hasOwnProperty(floatingWinName))
            floatingWinName += ".ui"
        if(!map.hasOwnProperty(floatingWinName))
        {
            console.log("not found floating win: "+floatingWinName+".")
            return null
        }

        return map[floatingWinName]

    }
    function addFloatWin(floatingWin,name)
    {
        var map = _getMap()
        map[name] = floatingWin
    }
    function getConfigurationWin()  //获取设置界面
    {
        if(configurationWin === null)
        {
            configurationWin=  Qt.createComponent("view/ConfigurationWin.qml").createObject();
        }
        return configurationWin;
    }
    property var languageWin: null;
    function getLanguageWin()       //获取语言选择界面
    {
        if(languageWin === null)
        {
            languageWin=  Qt.createComponent("view/LanguageWin.qml").createObject();
        }
        return languageWin;
    }
    property var deviceInfoWin: null;
    function getDeviceInfoWin()       //获取语言选择界面
    {
        if(deviceInfoWin === null)
        {
            deviceInfoWin=  Qt.createComponent("view/DeviceInfoWin.qml").createObject();
        }
        return deviceInfoWin;
    }
//    property var subCardPanel: null;
//    function getSubCardPanel()  //获取自定义选项列表悬浮窗口面板
//    {
//        if(subCardPanel === null)
//        {
//            subCardPanel=  Qt.createComponent("controls/floating/SubCard/SubCardPanel.qml").createObject();
//        }
//        return subCardPanel;
//    }
//    property var customizingComboBoxPanel: null;
//    function getCustomizingComboBoxPanel()  //获取自定义选项列表悬浮窗口面板
//    {
//        if(customizingComboBoxPanel === null)
//        {
//            customizingComboBoxPanel=  Qt.createComponent("controls/floating/CustomizingComboBox/CustomizingComboBoxPanel.qml").createObject();
//        }
//        return customizingComboBoxPanel;
//    }
//    property var numberKeyboardNetConfPanelForm: null;
//    function getNumberKeyboardNetConfPanelForm()  //获取自定义选项列表悬浮窗口面板
//    {
//        if(numberKeyboardNetConfPanelForm === null)
//        {
//            numberKeyboardNetConfPanelForm=  Qt.createComponent("controls/floating/NumberKeyboard/NumberKeyboardNetConfPanel.qml").createObject();
//        }
//        return numberKeyboardNetConfPanelForm;
//    }

//    property var numberKeyboardDigitalPanelForm: null;
//    function getNumberKeyboardDigitalPanelForm()  //获取自定义选项列表悬浮窗口面板
//    {
//        if(numberKeyboardDigitalPanelForm === null)
//        {
//            numberKeyboardDigitalPanelForm=  Qt.createComponent("controls/floating/NumberKeyboard/NumberKeyboardDigitalPanel.qml").createObject();
//        }
//        return numberKeyboardDigitalPanelForm;
//    }


}
