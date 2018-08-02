pragma Singleton
import QtQuick 2.0
import "./"
Item {

    property var lock: Utility.createMutext()

    function showFloating(win,context)
    {
        if(!win)
        {
            console.log("not found floating win.")
            return
        }
        if(win.visible && win.context === context)
            return
        hideFloating()


        if(win.preShow)
            win.preShow(context)
        win.show()
    }
    function hideFloating(win)
    {
        if(!win)
        {
            for (var i=0;i<Global.floatingContainer.children.length;i++)
            {
                Global.floatingContainer.children[i].hide()
            }
        }
        else
        {
            if(win.preHide)
                win.preHide()
            win.hide()
        }

    }
    function showFloating1(win,context)  //悬浮显示win界面，并传入context上下文对象
    {
        if(Utility.tryLock(lock) === false)
        {
//            console.log("show not lock")
            return
        }
        else
        {
//            console.log("show get lock")
        }


//        console.log("raw dep="+topStackView.depth)
        while(Global.topStackView.depth > 1)
        {
//            if(win.isCurrent(context) )
//            {
//                Utility.unLock(lock)
//                return;
//            }
            hideFloating(true)
        }
        if(win.preShow)
            win.preShow(context);
        Global.topStackView.push(win)
        do
        {
            x++
            Utility.msleep(50)
        }while(win.visible === false)
        //Utility.msleep(300)
        Utility.unLock(lock)
//        console.log("show unlock")
    }
    //尽在showFloating中置withoutLock = true
    function hideFloating1(withoutLock) //悬浮界面隐藏
    {
        if(withoutLock !== true)
        {
            if(Utility.tryLock(lock) === false)
            {
//                console.log("hide not lock")
                return
            }
            else
            {
//                console.log("hide get lock")
            }

        }


        var totleTime = 500
        var takeTime = 0
        var unitTime = 50
        var item = Global.topStackView.currentItem
        if(Global.topStackView.currentItem.preHide )
            Global.topStackView.currentItem.preHide()
        Global.topStackView.pop()
        do
        {
            Utility.msleep(unitTime)
            takeTime += unitTime
        }while(item.visible === true)
        if(takeTime < 2*unitTime)
            Utility.msleep(totleTime - takeTime)
        if(withoutLock !== true)
        {
//            console.log("hide unlock")
            Utility.unLock(lock)
        }

    }
    function showWin(win)   //常规界面跳转
    {
        if(win.preShow )
            win.preShow()
        Global.mainStackView.push(win)
    }

    function hideWin()      //常规界面隐藏
    {
//        while(Global.topStackView.depth > 1)
//        {

//            hideFloating()
//        }
        hideFloating()
        if(Global.mainStackView.currentItem.preShow )
            Global.mainStackView.currentItem.preShow()
        Global.mainStackView.pop()
    }

}
