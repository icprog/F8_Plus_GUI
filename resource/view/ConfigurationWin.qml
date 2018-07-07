import QtQuick 2.4
import "../"
ConfigurationWinForm {
    button1.onClicked: {
        Global.mainStackView.pop();
    }
}
