import QtQuick 2.0

ListView {
    y: 80+(435-height)/2
    property bool isUi: model === listModel
    width: 64
    height:isUi === true ? (2 * model.count - 1) * 50 : (2 * model.length - 1) * 50
    boundsBehavior: Flickable.StopAtBounds
    highlightFollowsCurrentItem: true
    spacing: 50
    model: ListModel {
        id : listModel
//        ListElement {
//            interfaceType: 2
//            iSignal: 0
//        }

//        ListElement {
//            interfaceType: 3
//            iSignal: 1
//        }

//        ListElement {
//            interfaceType: 7
//            iSignal: 0
//        }

//        ListElement {
//            interfaceType: 8
//            iSignal: 1
//        }
    }
    delegate: Image {
        anchors.horizontalCenter: parent.horizontalCenter

        source:isUi === true ?  model.interfaceType === 2
                                                        || model.interfaceType === 3 ? model.iSignal === 0 ? "qrc:/image/device_page/DP1.png" : "qrc:/image/device_page/DP2.png" : model.interfaceType === 7 || model.interfaceType === 8 ? model.iSignal === 0 ? "qrc:/image/device_page/DVI1.png" : "qrc:/image/device_page/DVI2.png" : ""
                                                :model.modelData.interfaceType === 2
                                                        || model.modelData.interfaceType === 3 ? model.modelData.iSignal === 0 ? "qrc:/image/device_page/DP1.png" : "qrc:/image/device_page/DP2.png" : model.modelData.interfaceType === 7 || model.modelData.interfaceType === 8 ? model.modelData.iSignal === 0 ? "qrc:/image/device_page/DVI1.png" : "qrc:/image/device_page/DVI2.png" : ""
    }
}
