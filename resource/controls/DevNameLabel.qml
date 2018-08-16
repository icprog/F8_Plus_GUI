import QtQuick 2.4
import "impl"
import "../"
DevNameLabelForm {
    devName:ModelSet.getModel("DeviceGeneralModel").name    //设备名称绑定
    ip: ModelSet.getModel("DeviceIpModel").ip[0]+"."+ModelSet.getModel("DeviceIpModel").ip[1]+"."
        +ModelSet.getModel("DeviceIpModel").ip[2]+"."+ModelSet.getModel("DeviceIpModel").ip[3]   //ip地址绑定
}
