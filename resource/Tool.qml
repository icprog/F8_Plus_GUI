pragma Singleton
import QtQuick 2.0

Item {
    function setTimeout(timer,func,msecs)
    {
        timer.repeat = false
        timer.interval = msecs
        timer.onTriggered = func
        timer.start()
    }

}
