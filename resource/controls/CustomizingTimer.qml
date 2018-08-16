import QtQuick 2.0

Item {
    property var _func: null
    Timer{
        id:timer
        repeat: false
        onTriggered:_func()
    }
    function setTimeout(func,msec)
    {
        _func = func
        timer.interval = msec
        timer.restart()

    }
    function stop()
    {
        timer.stop()
    }
}
