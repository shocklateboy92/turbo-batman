import QtQuick 2.0

Item {
    width: 80
    height: 40
    property Attribute target: Attribute {
        value: ""
    }

    Rectangle {
        anchors.fill: parent
        border.color: "black"
        border.width: 2
    }

    TextEdit {
        id: textbox
        readOnly: true
        anchors.fill: parent
        text: target.value
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: height
        color: "gray"
    }
}
