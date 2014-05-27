import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: rectangle1
    // Math.max dis shit!
    width: 120
    height: 40
    color: "black"
    border.color: "black"
    border.width: 2
    property string title: "ATR"
    property string description: "Description"

    Text {
        id: title_text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        height: parent.height * 0.6
        color: "#ffffff"
        text: title.toUpperCase()
        font.pixelSize: height
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
    }

    Text {
        id: description_text
        color: "#ffffff"
        text: description.toUpperCase()
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: title_text.bottom

        font.pixelSize: height
    }
}
