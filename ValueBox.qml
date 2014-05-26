import QtQuick 2.0

Item {
    width: 80
    height: 40

    TextEdit {
        readOnly: true
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent
        border.color: "black"
        border.width: 2
    }
}
