import QtQuick 2.4
import "./impl"
import "../../"
SubCardPanelForm {
    id:control
    visible:  false
    name : "SubCardPanel"
    mouseArea.onClicked: {
        Locator.hideFloating(this)
    }
    property int imageX: 0
    property int imageY: 0
    property int imageW: 0
    property int imageH: 0
    property int _duration: 200
    property int _easing: Easing.OutInBounce


    Text { id: time }

    interfaceListView1.model: getInputSlotList(1)
    interfaceListView2.model: getInputSlotList(2)
interfaceListView3.model: getInputSlotList(3)
interfaceListView4.model: getInputSlotList(4)
interfaceListView5.model: getInputSlotList(5)
interfaceListView6.model: getInputSlotList(6)
interfaceListView7.model: getInputSlotList(7)
interfaceListView8.model: getInputSlotList(8)
interfaceListView9.model: getOutputSlotList(9)
interfaceListView10.model: getOutputSlotList(10)
interfaceListView11.model:getOutputSlotList(11)
interfaceListView12.model: getOutputSlotList(12)
interfaceListView13.model: getOutputSlotList(13)
interfaceListView14.model: getOutputSlotList(14)
interfaceListView15.model: getOutputSlotList(15)
interfaceListView16.model: getOutputSlotList(16)

function getInputSlotList( slotId)
{
    if( !ModelSet.getModel("DeviceDetailModel").json.slotList)
        return [];
    var slotList = ModelSet.getModel("DeviceDetailModel").json.slotList
    for(var i = 0;i < slotList.length;i++)
    {
        if(slotList[i].cardType === 2 && slotList[i].slotId === slotId)
            return slotList[i].interfaces
    }
    return [];
}
function getOutputSlotList( slotId)
{
    if( !ModelSet.getModel("DeviceDetailModel").json.slotList)
        return [];
    var slotList = ModelSet.getModel("DeviceDetailModel").json.slotList
    for(var i = 0;i < slotList.length;i++)
    {
        if(slotList[i].cardType === 3 && slotList[i].slotId === slotId)
            return slotList[i].interfaces
    }
    return [];
}

//    interfaceListView1.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 1 ? ModelSet.getModel("DeviceDetailModel").slotList[0].interfaceList : interfaceListView1.model
//    interfaceListView2.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 2 ? ModelSet.getModel("DeviceDetailModel").slotList[1].interfaceList : interfaceListView2.model
//interfaceListView3.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 3 ? ModelSet.getModel("DeviceDetailModel").slotList[2].interfaceList : interfaceListView3.model
//interfaceListView4.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 4 ? ModelSet.getModel("DeviceDetailModel").slotList[3].interfaceList : interfaceListView4.model
//interfaceListView5.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 5 ? ModelSet.getModel("DeviceDetailModel").slotList[4].interfaceList : interfaceListView5.model
//interfaceListView6.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 6 ? ModelSet.getModel("DeviceDetailModel").slotList[5].interfaceList : interfaceListView6.model
//interfaceListView7.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 7 ? ModelSet.getModel("DeviceDetailModel").slotList[6].interfaceList : interfaceListView7.model
//interfaceListView8.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 8 ? ModelSet.getModel("DeviceDetailModel").slotList[7].interfaceList : interfaceListView8.model
//interfaceListView9.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 9 ? ModelSet.getModel("DeviceDetailModel").slotList[8].interfaceList : interfaceListView9.model
//interfaceListView10.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 10 ? ModelSet.getModel("DeviceDetailModel").slotList[9].interfaceList : interfaceListView10.model
//interfaceListView11.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 11 ? ModelSet.getModel("DeviceDetailModel").slotList[10].interfaceList : interfaceListView11.model
//interfaceListView12.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 12 ? ModelSet.getModel("DeviceDetailModel").slotList[11].interfaceList : interfaceListView12.model
//interfaceListView13.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 13 ? ModelSet.getModel("DeviceDetailModel").slotList[12].interfaceList : interfaceListView13.model
//interfaceListView14.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 14 ? ModelSet.getModel("DeviceDetailModel").slotList[13].interfaceList : interfaceListView14.model
//interfaceListView15.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 15 ? ModelSet.getModel("DeviceDetailModel").slotList[14].interfaceList : interfaceListView15.model
//interfaceListView16.model: ModelSet.getModel("DeviceDetailModel").slotList.length >= 16 ? ModelSet.getModel("DeviceDetailModel").slotList[15].interfaceList : interfaceListView16.model
    //interfaceListView2.model:ModelSet.getModel("DeviceDetailModel").slotList.length >= 2 ? ModelSet.getModel("DeviceDetailModel").slotList[1].interfaceList : interfaceListView2.model

    Component.onCompleted:
    {

        transitions = [transitions[2],transitions[3]]
        imageX= image.x
        imageY = image.y
        imageW=image.width
        imageH=image.height
    }

   transitions:
        [
            Transition {
                from:"hide"
                to:"show"
                PropertyAnimation {
                    target: image
                    properties: "x";
                    from : 513
                    to: imageX
                    duration: _duration
                    easing.type: _easing
                }
                PropertyAnimation {
                    target: image
                    properties: "y";
                    from : imageY-50
                    to: imageY
                    duration: _duration
                    easing.type: _easing
                }
                PropertyAnimation {
                    target: image
                    properties: "height";
                    from : 0
                    to: imageH
                    duration: _duration
                    easing.type: _easing
                }
                PropertyAnimation {
                    target: image
                    properties: "width";
                    from : 0
                    to: imageW
                    duration: _duration
                    easing.type: _easing
                }

        },
        Transition {
            from:"show"
            to:"hide"
            PropertyAnimation {
                target: image
                properties: "x";
                from : imageX
                to: 513
                duration: _duration
            }
            PropertyAnimation {
                target: image
                properties: "y";
                from :  imageY
                to:imageY-50
                duration: _duration
            }
            PropertyAnimation {
                target: image
                properties: "height";
                from : imageH
                to:0
                duration: _duration
            }
            PropertyAnimation {
                target: image
                properties: "width";
                from : imageW
                to:0
                duration: _duration
            }
            PropertyAnimation {
                target: control
                properties: "visible";
                from :true
                to: false
                duration: _duration
            }
    }
    ]


}
