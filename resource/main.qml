import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import "./"
import "view"
import "controls/floating/"
ApplicationWindow {
    visible: true
    width: 1280
    height: 800
    Component.onCompleted: {
            if(Screen.width === 1280 && Screen.height===800)
                visibility= "FullScreen"
            //Global.app = this
            Global.mainStackView = mainStackView //界面栈，压入到栈顶的界面为当前界面
            Global.topStackView = topStackView //界面栈，压入到栈顶的界面为当前界面

        }

    StackView {
        id: mainStackView
        anchors.fill: parent
        initialItem: MainWin{}
    }
    StackView {
        id: topStackView
        anchors.fill: parent
        initialItem: TransparentWin{}

    }
    Rectangle{
        anchors.fill: parent
        color:"#00ffffff"
        Component.onCompleted: {
            Global.floatingContainer = this
        }
        CustomizingComboBoxPanel{}
        NumberKeyboardNetAddrPanel{}
        SubCardPanel{ }
    }
}

