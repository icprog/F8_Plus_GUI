import QtQuick 2.4

ConfigureNetSubWinForm {

    comboBox.models: ListModel {

        ListElement {
            name: "DHCP"
        }

        ListElement {
            name: "手动获取"
        }
    }
    comboBox.name : "IP获取方式"
    comboBox.delegate: function (model){
        return model.name
    }



}
