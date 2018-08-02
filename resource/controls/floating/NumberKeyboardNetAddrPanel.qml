//import QtQml 2.2
import QtQuick 2.4
import "../../"
import "../../controls"
import "impl"
NumberKeyboardNetAddrPanelForm {
    visible:  false
    name : "NumberKeyboardNetAddrPanel"
    CustomizingTimer{
        id:timer
    }
    function clear()
    {
        addr = [0,0,0,0]
        m_state = 0
    }
    function setDiagital(inx,value)
    {
        addr[inx] = value
        var tmp = m_state
        m_state = 99
        m_state = tmp
    }
    numberKeyboard.onKey: {
        if(value === "enter")
        {
            numberKeyboardNetAddrInput.addr[0] = addr[0]
            numberKeyboardNetAddrInput.addr[1] = addr[1]
            numberKeyboardNetAddrInput.addr[2] = addr[2]
            numberKeyboardNetAddrInput.addr[3] = addr[3]
            numberKeyboardNetAddrInput.updateDisplay()
            Locator.hideFloating(this)
        }
        else if(value === "back")
        {
            if(addr[m_state] !== 0)
                setDiagital(m_state,Math.floor(addr[m_state]/10))
            else if(m_state > 0)
            {
                m_state -= 1
                setDiagital(m_state,Math.floor(addr[m_state]/10))
            }
        }
        else if(value === "." )
        {
            if( m_state < 3)
                m_state +=1
        }
        else    //value 0~9
        {
            var val = parseInt(value)
            if(addr[m_state]*10+val<256)
            {
                setDiagital(m_state,addr[m_state]*10+val)
                if(addr[m_state] > 99)
                {
                    if( m_state < 3)
                        m_state +=1
                }
            }
            else
            {
                addrInvalid = true
                timer.setTimeout(function(){addrInvalid = false},3000)
            }

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
