import QtQuick 2.0
import "../../../"
Item {
    property var context: null
    property string name: ""
    id:control
    state : visible === true ? "show" :  "hide"
    Component.onCompleted:
    {
        if(name === "")
        {
            console.log("floating panel : "+this+" is not set name property.")
            return
        }
        Locator.addFloatWin(this,name)
    }
    states: [
        State {
            name: "show"
            when : visible === true
            PropertyChanges {
                target: control
                visible:true
            }
        },
        State {
            name: "hide"
             when : visible === false
            PropertyChanges {
                target: control
                visible:false
            }
        }
    ]
    transitions:
        [
            Transition {
                from:"hide"
                to:"show"
                PropertyAnimation {
                    target: control
                    properties: "x";
                    from : 1280
                    to: 0
                    duration: 200
                }
        },
        Transition {
            from:"show"
            to:"hide"
            PropertyAnimation {
                target: control
                properties: "x";
                from : 0
                to: 1280
                duration: 200
            }
            PropertyAnimation {
                target: control
                properties: "visible";
                to: false
                duration: 200
            }
    }
    ]

    function show()
    {
        state = "show"
    }
    function hide()
    {
        state = "hide"
    }

}
