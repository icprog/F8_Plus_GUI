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
    Component.onCompleted:
    {
        var tmp = []
        tmp[0] = transitions[2]
        tmp[1] = transitions[3]
        transitions = tmp
        console.log(transitions.length)
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
