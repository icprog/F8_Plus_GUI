import QtQuick 2.4
import QtQuick.Controls 2.0
import "../../controls"

Item {
    id: item1
    width: 1059
    height: 542
    property alias text7: text7
    property alias netAddrInput2: netAddrInput2
    property alias netAddrInput1: netAddrInput1
    property alias netAddrInput: netAddrInput
    property alias text5: text5
    property alias text4: text4
    property alias text3: text3
    property alias text2: text2
    property alias hollowButton: hollowButton
    property alias comboBox: comboBox

    Text {
        id: text1
        x: 48
        y: 30
        height: 23
        color: "#8ea9c0"
        text: "MAC :"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
    }

    Text {
        id: text2
        x: 48
        y: 107
        height: 23
        color: "#8ea9c0"
        text: "IP获取方式 :"
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text3
        x: 48
        y: 206
        width: 80
        height: 23
        color: "#8ea9c0"
        text: "IP地址 :"
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text4
        x: 48
        y: 297
        height: 23
        color: "#8ea9c0"
        text: "子网掩码 :"
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text5
        x: 48
        y: 394
        height: 23
        color: "#8ea9c0"
        text: "网关 :"
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text7
        x: 231
        y: 30
        height: 23
        color: "#8ea9c0"
        text: "AA:BB:CC:DD:EE:FF"
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 28
        verticalAlignment: Text.AlignVCenter
    }

    CustomizingComboBox {
        id: comboBox
        x: 231
        y: 90
        currentIndex: 0
    }

    NetAddrInput {
        id: netAddrInput
        x: 231
        y: 184
    }

    NetAddrInput {
        id: netAddrInput1
        x: 231
        y: 278
    }

    NetAddrInput {
        id: netAddrInput2
        x: 231
        y: 372
    }

    HollowButton {
        id: hollowButton
        x: 231
        y: 462
    }
}
