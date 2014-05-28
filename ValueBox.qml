import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Item {
    width: 80
    height: 40

    property Attribute target: Attribute {}

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

    MouseArea {
        anchors.fill: parent
        onClicked: {
            batman.currentAttribute = target;
        }
    }
}
