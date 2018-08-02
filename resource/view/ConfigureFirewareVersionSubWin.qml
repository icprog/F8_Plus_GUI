import QtQuick 2.4

ConfigureFirewareVersionSubWinForm {
    btnNormal.onClicked: m_state = 0
    btnInCard.onClicked: m_state = 1
    btnOutCard.onClicked: m_state = 2
}
