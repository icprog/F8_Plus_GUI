pragma Singleton
import QtQuick 2.0
Item {
    property var mainStackView: null

    property var mainWin: null;
    function getMainWin()
    {
        if(mainWin === null)
        {
            mainWin=  Qt.createComponent("view/MainWin.qml").createObject();
        }
        return mainWin;
    }

    property var configurationWin: null;
    function getConfigurationWin()
    {
        if(configurationWin === null)
        {
            configurationWin=  Qt.createComponent("view/ConfigurationWin.qml").createObject();
        }
        return configurationWin;
    }
    property var userInfoWin: null;
    function getUserInfoWin()
    {
        if(userInfoWin === null)
        {
            userInfoWin=  Qt.createComponent("../ui/UserInfoWin.qml").createObject();
        }
        return userInfoWin;
    }

    property var userRightWin: null;
    function getUserRightWin()
    {
        if(userRightWin === null)
        {
            userRightWin=  Qt.createComponent("../ui/UserRightWin.qml").createObject();
        }
        return userRightWin;
    }
    function getLogManagerWin()
    {
        if(logManagerWin === null)
        {
            logManagerWin=  Qt.createComponent("../ui/LogManagerWin.qml").createObject();
        }
        return logManagerWin;
    }
    property var sysStatusWin: null;
    function getSysStatusWin()
    {
        if(sysStatusWin === null)
        {
            sysStatusWin=  Qt.createComponent("../ui/SysStatusWin.qml").createObject();
        }
        return sysStatusWin;
    }
    property var sysManagerWin: null;
    function getSysManagerWin()
    {
        if(sysManagerWin === null)
        {
            sysManagerWin=  Qt.createComponent("../ui/SystemManagerWin.qml").createObject();
        }
        return sysManagerWin;
    }
    property var sysSetWin: null;
    function getSysSetWin()
    {
        if(sysSetWin === null)
        {
            sysSetWin=  Qt.createComponent("../ui/SystemSetWin.qml").createObject();
        }
        return sysSetWin;
    }
    property var networkWin:null;
    function getNetworkWin()
    {
        if(networkWin === null)
        {
            networkWin=  Qt.createComponent("../ui/NetworkWin.qml").createObject();
        }
        return networkWin;
    }
    property var businessestting: null;
    function getBusinessSetting()
    {
        if(businessestting === null)
        {
            businessestting=  Qt.createComponent("../ui/BusinessSetting.qml").createObject();
        }
        return businessestting;
    }
    property var systemmaintenance: null;
    function getSystemMaintenance()
    {
        if(systemmaintenance === null)
        {
            systemmaintenance=  Qt.createComponent("../ui/SystemMaintenance.qml").createObject();
        }
        return systemmaintenance;
    }
    property var mydialogMessage: null;
    function getMydialogMessage()
    {
        if(mydialogMessage === null)
        {
            mydialogMessage=  Qt.createComponent("../ui/MydialogMessage.qml").createObject();
        }
        return mydialogMessage;
    }
    property var warningSetWin: null;
    function getWarningSetWin()
    {
        if(warningSetWin === null)
        {
            warningSetWin=  Qt.createComponent("../ui/WarningSetWin.qml").createObject();
        }
        return warningSetWin;
    }
    property var fingerVerifyWin: null;
    function getFingerVerifyWin()
    {
        if(fingerVerifyWin === null)
        {
            fingerVerifyWin=  Qt.createComponent("../ui/FingerVerifyWin.qml").createObject();
        }
        return fingerVerifyWin;
    }
    property var finger_VerifyWin: null;
    function getFinger_VerifyWin()
    {
        if(finger_VerifyWin === null)
        {
            finger_VerifyWin=  Qt.createComponent("../ui/Finger_VerifyWin.qml").createObject();
        }
        return finger_VerifyWin;
    }
    property var openDoorWin: null;
    function getOpenDoorWin()
    {
        if(openDoorWin === null)
        {
            openDoorWin=  Qt.createComponent("../ui/OpenDoor.qml").createObject();
        }
        return openDoorWin;
    }

    property var cameraWin: null;
    function getCameraWin()
    {
        if(cameraWin === null)
        {
            cameraWin=  Qt.createComponent("../ui/CameraWin.qml").createObject();
        }
        return cameraWin;
    }
    property var passwordVerifyWin: null;
    function getPasswordVerifyWin()
    {
        if(passwordVerifyWin === null)
        {
            passwordVerifyWin= Qt.createComponent("../ui/PasswordVerifyWin.qml").createObject();
        }
        return passwordVerifyWin;
    }
    property var imageWin: null

    property var setDateWin: null;
    property var app: null;
    property var myMessageBox:null
    property var myMessageBox2:null
    property var logManagerWin: null
}
