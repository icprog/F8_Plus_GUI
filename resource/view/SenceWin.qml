import QtQuick 2.4
import "impl"
import "../"
import "../controls"
SenceWinForm {
    returnButton.text: TranslatorHelper.translator.tr(qsTr("场景"))
    text1.text: TranslatorHelper.translator.tr(qsTr("Load模式"))
    text4.text:senceSubListWin.currentPreset.name

    CustomizingTimer
    {
        id:timer
    }
    slider.onValueChanged:
    {
        timer.stop()
        slider.value =  Math.floor(slider.value)
        if(slider.value === 13 && t_bar_direction === "up" || slider.value === 0 && t_bar_direction === "down")
        {
            timer.setTimeout(function (){t_bar_direction = t_bar_direction === "up" ? "down" : "up"},5000)
        }

    }
}
