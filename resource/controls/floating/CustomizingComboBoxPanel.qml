import QtQuick 2.4
import "../../"
import "impl"
CustomizingComboBoxPanelForm {
    id:control
    visible: false
    listView.currentIndex: comboBox.currentIndex
    listView.model: comboBox.models
    titleText.text:comboBox.name
    name : "CustomizingComboBoxPanel"



    function isCurrent(_comboBox)
    {
        return Locator.topStackView.currentItem === this && comboBox === _comboBox
    }
    function preShow(_comboBox)
    {
        context = _comboBox
        listView.currentIndex =_comboBox.currentIndex
        return 0
    }

    xButton.onClicked: {
        Locator.hideFloating(this)
    }

    listView.delegate: Rectangle {

        width: 590
        height: 90
        MouseArea{
            anchors.fill: parent
            onClicked:{
                listView.currentIndex = index
                comboBox.currentIndex = index
                Locator.hideFloating(control)
            }
        }
        Rectangle {
            width: parent.width
            height: 2
            color: "#213a63"
        }
        color: ListView.isCurrentItem ? "#07b628" : listView.parent.color

        Text {
            x:32
            id: delegateText
            color: parent.ListView.isCurrentItem ? "white" : "#00fadd"
            height: 31
            text:comboBox.delegate ? comboBox.delegate(model.modelData) : comboBox.models[index]
            //text:index
            font.pixelSize: 30
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
