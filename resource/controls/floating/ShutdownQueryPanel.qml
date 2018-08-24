import QtQuick 2.4
import "impl"
import "../../"
ShutdownQueryPanelForm {
    id:panel
    visible: false
    name:"ShutdownQueryPanel"
    text1.text: TranslatorHelper.translator.tr(qsTr("您确定现在将设备关闭吗？"))
    hollowButton.text: TranslatorHelper.translator.tr(qsTr("取消"))
    hollowButton1.text: TranslatorHelper.translator.tr(qsTr("确定"))
    hollowButton.onClicked: Locator.hideFloating(this)
    hollowButton1.onClicked: Locator.hideFloating(this)
    property int  _duration: 500
    property int  _easing:  Easing.Linear

    Component.onCompleted:
    {
        transitions = [transitions[2],transitions[3]]
    }
   transitions:
        [
            Transition {
                from:"hide"
                to:"show"
                PropertyAnimation {
                    target: panel
                    properties: "opacity";
                    from : 0.0
                    to: 1.0
                    duration: _duration
                    easing.type: _easing
                }


        },
        Transition {
            from:"show"
            to:"hide"
            PropertyAnimation {
                target: panel
                properties: "opacity";
                from :  1.0
                to: 0.0
                duration: _duration
                easing.type: _easing
            }
            PropertyAnimation {
                target: panel
                properties: "visible";
                from :  true
                to: false
                duration: _duration
                easing.type: _easing
            }

    }
    ]
}
