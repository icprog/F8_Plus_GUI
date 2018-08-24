import QtQuick 2.4
import "impl"
import "../"
SenceSubListWinForm {
    currentPresetIndex: 0
    property var currentPreset: isUi ? currentPresetIndex % 2 === 0 ? listView.model.get(currentPresetIndex / 2) : listView1.model.get(currentPresetIndex / 2 )
                                                        : currentPresetIndex % 2 === 0 ? listView.model[currentPresetIndex / 2]: listView1.model[(currentPresetIndex-1) / 2 ]
    function presets1()
    {
        var presets1 = []
        if (!ModelSet.getModel("PresetsModel").json.presets)
            return presets1
        var array = ModelSet.getModel("PresetsModel").json.presets

         for( var i = 0; i< Math.floor(array.length/2);i++)
             presets1.push(array[i*2])
         if(array.length%2 === 1)
            presets1.push(array[array.length-1])
         return presets1

    }

    function presets2()
    {
        var presets2 = []
        if (!ModelSet.getModel("PresetsModel").json.presets)
            return presets2

        var array = ModelSet.getModel("PresetsModel").json.presets
        for( var i = 0; i< Math.floor(array.length/2);i++)
            presets2.push(array[i*2+1])
        if(array.length%2 === 1)
           presets2.push({})
        return presets2
    }
    listView.model: presets1().length > 0 ? presets1(): listView.model
    listView1.model:presets1().length > 0 ? presets2(): listView1.model
    listView.delegate: Rectangle {
        width: 190
        height: 150
        color: "#00ffffff"
        border.width: 4
        border.color: index*2 === currentPresetIndex ? "#07b628" : "#00ffffff"
        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                currentPresetIndex = index*2
            }
        }
        Image {
            x:parent.border.width
            y:parent.border.width
            width: parent.width-2*parent.border.width
            height: parent.height-2*parent.border.width
            clip: true
            source: "../image/sence_page/sence_bg.png"

            Text {
                y: 43
                color: "#07e8ff"
                text: "name" in model ? name : model.modelData.name
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            Rectangle {
                y: 100
                width: parent.width
                height: parent.height-y
                color:  "presetId" in model ? presetId % 2 === 0 ? "#056a08" : "#7f060b" : model.modelData.presetId % 2 === 0 ? "#056a08" : "#7f060b"
                Text {
                    color: "#80ffffff"
                    text: "presetId" in model ? presetId % 2 === 0 ?  "PVW" : "PGM" : model.modelData.presetId % 2 === 0 ?  "PVW" : "PGM"

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 24
                }
            }
        }
    }
    listView1.delegate: Rectangle {
        width: 190
        height:  150
        color: "#00ffffff"
        border.width: 4
        border.color: index*2+1 === currentPresetIndex? "#07b628" : "#00ffffff"
        visible: model.modelData.presetId ? true : false
        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                currentPresetIndex = index*2+1
            }
        }
        Image {
            x:parent.border.width
            y:parent.border.width
            width: parent.width-2*parent.border.width
            height: parent.height-2*parent.border.width
            clip: true
            source:  "../image/sence_page/sence_bg.png"

            Text {
                y: 43
                color: "#07e8ff"
                text: "name" in model ? name : "name" in model.modelData ? model.modelData.name :""
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 22
            }

            Rectangle {
                y: 100
                width: parent.width
                anchors.bottom: parent.bottom
                height: parent.height - y
                color: "presetId" in model ? presetId % 2 === 0 ? "#056a08" : "#7f060b" : model.modelData.presetId % 2 === 0 ? "#056a08" : "#7f060b"
                Text {
                    color: "#80ffffff"
                    text: "presetId" in model ? presetId % 2 === 0 ?  "PVW" : "PGM" : model.modelData.presetId % 2 === 0 ?  "PVW" : "PGM"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 24
                }
            }
        }
    }
}
