import QtQuick 2.4

TestVIewForm {
    button.onClicked:{
        swipeView.addItem(rectangle)
        console.log(pane.children.color)

                     }
    button1.onClicked:
    {
        swipeView.addItem(rectangle2)
        //swipeView.removeItem(rectangle)
    }
}
