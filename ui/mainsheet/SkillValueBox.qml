import QtQuick 2.0

Text {
    height: sizes.mHeight(1)
    width: sizes.mWidth(4)

    color: "gray"
    horizontalAlignment: Text.AlignHCenter

    Rectangle {
        color: "black"
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 1
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            main_sheet.currentAttribute = modelData;
        }
    }
}
