import QtQuick 2.4
import "impl"
import "../"
DevNameLabelForm {
    devName:"name" in ModelSet.getModel("DeviceGeneralModel").json ? ModelSet.getModel("DeviceGeneralModel").json.name :""   //设备名称绑定
    ip: "ip" in ModelSet.getModel("DeviceIpModel").json ? ModelSet.getModel("DeviceIpModel").json.ip.ip0+"."+ModelSet.getModel("DeviceIpModel").json.ip.ip1+"."
        +ModelSet.getModel("DeviceIpModel").json.ip.ip2+"."+ModelSet.getModel("DeviceIpModel").json.ip.ip3  :""  //ip地址绑定
}
