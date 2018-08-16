//import QtQml 2.2
import QtQuick 2.4
import "../../"
import "../../controls"
import "impl"
NetAddrPanelForm {
    visible:  false
    name : "NetAddrPanel"
    CustomizingTimer{
        id:timer
    }
    function clear()
    {
        addr = [-1,-1,-1,-1]
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
            if(m_state  < 3 ||addr[3] === -1 || addr[3] === 0 || addr[3] === 1 || addr[3] === 255)
            {
                addrInvalid = true
                timer.setTimeout(function(){addrInvalid = false},3000)
                return;
            }

            netAddrInput.addr[0] = addr[0]
            netAddrInput.addr[1] = addr[1]
            netAddrInput.addr[2] = addr[2]
            netAddrInput.addr[3] = addr[3]
            netAddrInput.updateDisplay()
            Locator.hideFloating(this)
        }
        else if(value === "back")
        {
            if(addr[m_state] !== -1)
            {
                var t = Math.floor(addr[m_state]/10)
                if(t === 0)
                    t = -1
                setDiagital(m_state,t)
            }

            else if(m_state > 0)
            {
                m_state -= 1
                setDiagital(m_state,Math.floor(addr[m_state]/10))
            }
        }
        else if(value === "." )
        {
            if( m_state < 3 && addr[m_state] !== -1)
                m_state +=1
        }
        else    //value 0~9
        {
            var val = parseInt(value)
            if(addr[m_state] === -1)
                addr[m_state] = 0
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
