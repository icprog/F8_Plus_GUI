import QtQuick 2.4
import "impl"
import "../"
import "../controls"
UnLockWinForm {
    CustomizingTimer{
        id:timer
    }
    text1.text: TranslatorHelper.translator.tr(qsTr("输入4位数字密码"))
    text6.text: TranslatorHelper.translator.tr(qsTr("忘记密码请在WEB页面中修改"))
    text7.text: TranslatorHelper.translator.tr(qsTr("密码错误"))
    winName:  TranslatorHelper.translator.tr(qsTr("取消"))
    function veryfyPwd(pwd)
    {
        return pwd[0] === 1 && pwd[1] === 2 && pwd[2] === 3 && pwd[3] === 4
    }
    numberKeyboard.onKey: {
        if(value === ".")
            return
        if(value === "back")
        {
            if(m_state > 0)
                pwd[m_state--] = -1
        }
        else
        {
            pwd[m_state] = parseInt(value)
            m_state++
            if(m_state === 4)
            {
                if(veryfyPwd(pwd))
                    Locator.showWin("MainWin")
                else
                {
                    m_state = 5
                    timer.setTimeout(function(){m_state = 0},2000)
                }

            }
        }


    }
    function preShow()
    {
        pwd = [-1.-1.-1.-1]
        m_state = 0
    }
}
