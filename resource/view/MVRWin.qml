import QtQuick 2.4
import "impl"
MVRWinForm {
    visible: false
    name : "MVRWin"
    onVisibleChanged:{
        if(visible)
        {
            player.show()
            player.play()
        }

        else
        {
            player.stop()
            player.hide()
        }

    }

    Component.onCompleted:
    {
        var point = videoItem.mapToItem(this,0,0)
        player.setGeometry(point.x,point.y,videoItem.width,videoItem.height)

    }
        winName: TranslatorHelper.translator.tr(qsTr("预监"))
        text1.text : TranslatorHelper.translator.tr(qsTr("预监尚未开启"))
        text1.visible: player.state !== 4
}
