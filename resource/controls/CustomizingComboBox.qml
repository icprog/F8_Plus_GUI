import QtQuick 2.4
import "impl"
import "../"
CustomizingComboBoxForm {
    implicitWidth:263
    implicitHeight:62
    property var models: ["关闭", "开启"]
    property var delegate: null
    property string name: "同步状态"
    opacity: enabled === true ? 1.0 : 0.5
    displayString.text:delegate != null ? delegate(models.stringList.get(currentIndex)) : models[currentIndex]

    mouseArea.onClicked: {
        Locator.showFloating("CustomizingComboBoxPanel",this)
    }

}
