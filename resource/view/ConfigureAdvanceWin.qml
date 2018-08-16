import QtQuick 2.4
import "impl"
import "../"
ConfigureAdvanceWinForm {
    text1.text: TranslatorHelper.translator.tr(qsTr("同步状态："));
    text2.text: TranslatorHelper.translator.tr(qsTr("同步源选择："));
    text4.text: TranslatorHelper.translator.tr(qsTr("返回主界面时长："));
    text5.text: TranslatorHelper.translator.tr(qsTr("恢复出厂设置："));
     text6.text: TranslatorHelper.translator.tr(qsTr("U盘离线升级："));
      text10.text: TranslatorHelper.translator.tr(qsTr("未检测到U盘"));
      text7.text: TranslatorHelper.translator.tr(qsTr("（范围：0.25～4.00）"))
    text8.text: TranslatorHelper.translator.tr(qsTr("（范围：5～90）"))
    numberInput.limit: TranslatorHelper.translator.tr(qsTr("（范围：0.25～4.00）"));
    numberInput1.title: TranslatorHelper.translator.tr(qsTr("返回主界面时长"));
    numberInput1.unit: "S"
    numberInput1.limit: TranslatorHelper.translator.tr(qsTr("（范围：5～90）"));
      customizingComboBox1.name: TranslatorHelper.translator.tr(qsTr("同步源选择"));

      customizingComboBox1.models: ModelSet.getModel("DeviceDetailModel").inputList

     //numberInput.enabled: false

    customizingComboBox1.enabled: customizingComboBox.currentIndex === 1

     customizingComboBox.models: [TranslatorHelper.translator.tr(qsTr("关闭")),TranslatorHelper.translator.tr(qsTr("开启"))]
     customizingComboBox.name: TranslatorHelper.translator.tr(qsTr("同步状态"));
     customizingComboBox.currentIndex:ModelSet.getModel("DeviceGenlockModel").enable
     hollowButton1.onClicked: {
         ModelSet.getModel("DeviceGenlockModel").enable = customizingComboBox.currentIndex
        ModelSet.getModel("DeviceGenlockModel").flush()
     }

     customizingComboBox2.models: [TranslatorHelper.translator.tr(qsTr("保存IP")),TranslatorHelper.translator.tr(qsTr("保存IP和EDID")),TranslatorHelper.translator.tr(qsTr("全部恢复"))]
     customizingComboBox2.name: TranslatorHelper.translator.tr(qsTr("恢复出厂设置"));
     customizingComboBox2.currentIndex:ModelSet.getModel("DeviceRestoreFactoryModel").restoreType
     hollowButton.onClicked: {
        ModelSet.getModel("DeviceRestoreFactoryModel").restoreType = customizingComboBox2.currentIndex
        ModelSet.getModel("DeviceRestoreFactoryModel").flush()
     }
     hollowButton.text: TranslatorHelper.translator.tr(qsTr("恢复"));
     hollowButton2.text: TranslatorHelper.translator.tr(qsTr("升级"));
}
