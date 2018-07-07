import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import "./"
import "view"
ApplicationWindow {
    visible: true
    width: 1280
    height: 800
    Component.onCompleted: {
            if(Screen.width === 800 && Screen.height===480)
                visibility= "FullScreen"
            Global.app = this
            Global.mainStackView = mainStackView //界面栈，压入到栈顶的界面为当前界面

        }
    StackView {
        id: mainStackView
        anchors.fill: parent
        initialItem: MainWin{}

    }

}
