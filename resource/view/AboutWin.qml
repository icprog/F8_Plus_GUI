import QtQuick 2.4
import "impl"
AboutWinForm {
    winName:TranslatorHelper.translator.tr(qsTr("关于"));
    text1.text:TranslatorHelper.translator.tr(qsTr("欢迎使用F8 Plus，如果在使用过程中遇到什么问题或者有什么意见，请您及时反馈给我们，我们会在第一时间给您答复。"));
    text2.text:TranslatorHelper.translator.tr(qsTr("当前系统版本："))+"2.0.X.X";
    text3.text:TranslatorHelper.translator.tr(qsTr("技术支持邮箱："))+"info@pixelhue.com";
    text4.text:TranslatorHelper.translator.tr(qsTr("官方网站："))+"www.pixelhue.com";
    text5.text:TranslatorHelper.translator.tr(qsTr("官方网站"));
}
