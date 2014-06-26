import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: Math.max(sizes.mWidth(10), title_text.paintedWidth, description_text.paintedWidth + sizes.mWidth(0.5))
    height: sizes.mHeight(2)
    color: "black"
//    border.color: "black"
//    border.width: sizes.mWidth(2)
    property string title: "ATR"
    property string description: "Description"

    Text {
        id: title_text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        height: parent.height * 0.65
        color: "#ffffff"
        text: title.toUpperCase()
        font.pixelSize: height

        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: sizes.mWidth(0.1)
    }

    Text {
        id: description_text
        color: "#ffffff"
        text: description.toUpperCase()
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        anchors.bottomMargin: sizes.mWidth(0.1)
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: title_text.bottom

        font.pixelSize: height
    }
}
