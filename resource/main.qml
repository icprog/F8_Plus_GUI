import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import "./"
import "view"
import "controls/floating/"
Item {
    visible: true
    width: 1280
    height: 800
//    Component.onCompleted: {
//            if(Screen.width === 1280 && Screen.height===800)
//                visibility= "FullScreen"
//        }

//    StackView {
//        id: mainStackView
//        anchors.fill: parent
//        //initialItem: MVRWin{}

//        initialItem: MainWin{}
//        Component.onCompleted: {
//            Locator.mainStackView = this
//        }
//    }
    Rectangle{
        anchors.fill: parent

        LockWin{
            Component.onCompleted: Locator.initWin("LockWin")
        }
        UnLockWin{}
        MainWin{}
        MVRWin{}
        DeviceInfoWin{}
        SenceWin{}
        LanguageWin{}
        AboutWin{}
        ConfigurationWin{}
    }
    Rectangle{
        anchors.fill: parent
        color:"#00ffffff"
        Component.onCompleted: {
            Locator.floatingContainer = this
        }
        CustomizingComboBoxPanel{}
        NetAddrPanel{}
        NumberInputPanel{}
        SubCardPanel{}
        ShutdownQueryPanel{}
    }

    //ConfigurationWin{}
}

