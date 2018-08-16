import QtQuick 2.4
import "impl"
import "../"
ConfigureFirewareVersionSubWinForm {
    isUi: false
    btnNormal.onClicked: m_state = 0
    btnInCard.onClicked: m_state = 1
    btnOutCard.onClicked: m_state = 2
    btnNormal.text:  TranslatorHelper.translator.tr(qsTr("常规"));
    btnInCard.text: TranslatorHelper.translator.tr(qsTr("输入子卡"));
    btnOutCard.text: TranslatorHelper.translator.tr(qsTr("输出子卡"));
    listView.model: m_state === 0 ? ModelSet.getModel("DeviceFirwareVersionModel").generalDevices : m_state === 1 ? ModelSet.getModel("DeviceFirwareVersionModel").inputCardDevices : ModelSet.getModel("DeviceFirwareVersionModel").outputCardDevices
}
