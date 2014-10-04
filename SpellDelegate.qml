import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    property alias knownChecked: checkboxKnown.checked
    property alias prepChecked: checkboxPrep.checked
    height: sizes.mHeight(3);
    width: sizes.mWidth(30)
    border.color: "black"

//    Rectangle {
//        id: expandedTextBox
//        width: parent.parent.width
//        height: sizes.mHeight(30)
//        anchors.bottom: parent.bottom
//        color: "blue"
//        visible: expanded
//        anchors.top: invisible.bottom
//    }

    Text {
        id: name
        height: parent.height
        text: model.name
        font.pointSize: 12
        verticalAlignment: Text.AlignBottom
    }
    CheckBox {
        id: checkboxKnown
        width: 10
        height: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
    Text {
        id: textknown
        anchors.bottom: checkboxKnown.top
        anchors.horizontalCenter: checkboxKnown.horizontalCenter
        text: "Known"
        font.pointSize: 6
    }
    CheckBox {
        id: checkboxPrep
        width: 10
        height: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: checkboxKnown.left
        anchors.rightMargin: 20
    }
    Text {
        id: textPrep
        anchors.bottom: checkboxPrep.top
        anchors.horizontalCenter: checkboxPrep.horizontalCenter
        text: "Prep"
        font.pointSize: 6
    }
}
