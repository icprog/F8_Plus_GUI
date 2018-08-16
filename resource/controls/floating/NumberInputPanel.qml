import QtQuick 2.4
import "base"
import "impl"
import "../../"
NumberInputPanelForm {
    visible:  false
    name : "NumberInputPanel"
    title:context.title
    limit:context.limit
    text3.text:context.unit
    //text2.text: context.realNumber ?  "（范围："+context.min.toFixed(2)+"~"+context.max.toFixed(2)+"）" :  "（范围："+context.min+"~"+context.max+"）"
    function clear()
    {
        text4.text = ""
    }

    numberKeyboard.onKey: {
        if(value === "enter")
        {
            if(text4.text === "")
                text4.text = context.min
            var f = parseFloat(text4.text)
            context.text = context.realNumber ? f.toFixed(2) : f
            Locator.hideFloating(this)
        }
        else if(value === "back")
        {
            if(text4.text !== "")
                text4.text = text4.text.slice(0,-1)
        }
        else if(value === "." )
        {
            if( !context.realNumber || text4.text.indexOf(".") > -1)
                return
            var tmp =  parseFloat(text4.text)
            if( tmp >= context.min || tmp <= context.max)
                text4.text += value
        }
        else    //value 0~9
        {
            var new_val = text4.text + value
            tmp = parseFloat(new_val)
            if(tmp < context.min && new_val === context.min.toFixed(2).slice(0,new_val.length))
                text4.text += value
            else if( tmp >= context.min && tmp <= context.max)
                text4.text += value
        }



    }
    xButton.onClicked: {
        Locator.hideFloating(this)
    }
    function preShow(context)
    {
        clear()
        this.context = context
    }
}
