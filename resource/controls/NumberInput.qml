import QtQuick 2.4
import "impl"
import "../"
NumberInputForm {
    property string title: "返回主界面时长"
    property string limit: "(范围 ： 5～90)"
    property string unit: ""
    property var max: null
    property var min: null
    opacity: enabled === true ? 1.0 : 0.5
    Component.onCompleted: {
        if(max === null)
            max = 90
        if(min === null)
            min = 5
    }
    mouseArea.onClicked: {
        Locator.showFloating("NumberInputPanel",this)
    }
}
