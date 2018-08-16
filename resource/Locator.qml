pragma Singleton
import QtQuick 2.0
import "./"
Item {
    property var mainStackView: null    //界面栈，压入到栈顶的界面为当前界面
    property var floatingContainer : null

    function lockScreen()
    {
        while(mainStackView.depth > 1)
            hideWin()
    }
    function getFloatingWin(floatingWinName)
    {
        return _getFloatingWin(floatingWinName)
    }

    function showFloating(floatingWinName,context)
    {
        var win = _getFloatingWin(floatingWinName)
        if(!win)
        {
            console.error("not found floating win: "+floatingWinName+".")
            return
        }
        if(win.visible && win.context === context)
            return
        hideFloating()


        if(win.preShow)
            win.preShow(context)
        win.show()
    }
    function hideFloating(floatingWinName)
    {
        var win = null

        if(typeof floatingWinName === "string")
            win = _getFloatingWin(floatingWinName)
        else
            win = floatingWinName
        if(!win)
        {
            for (var i=0;i<floatingContainer.children.length;i++)
            {
                floatingContainer.children[i].hide()
            }
        }
        else
        {
            if(win.preHide)
                win.preHide()
            win.hide()
        }

    }

    function showWin(winName)   //常规界面跳转
    {
        gc()
        var win = _getWin(winName)
        if(win.preShow )
            win.preShow()
        mainStackView.push(win)
    }

    function hideWin(winName)      //常规界面隐藏
    {
        var win = null
        if(typeof winName === "string")
            win = _getWin(winName)
        else
            win = winName
        hideFloating()
        if(mainStackView.currentItem.preShow )
            mainStackView.currentItem.preShow()
        mainStackView.pop()
    }

    function addFloatWin(floatingWin,name)
    {
        var map = _getMap()
        map[name] = floatingWin
    }




    /****************************private**************************/

    property var _map: null


    function _getWin(winName)
    {
        var map = _getMap()
        if(!map.hasOwnProperty(winName))
        {
            map[winName] = Qt.createComponent("view/"+winName+".qml").createObject();
        }
        return map[winName]
    }
    function _getFloatingWin(floatingWinName)
    {
        var map = _getMap()
        if(!map.hasOwnProperty(floatingWinName))
        {
            return null
        }

        return map[floatingWinName]

    }

    function _getMap()
    {
        if(_map === null)
            _map = {}
        return _map
    }

}
