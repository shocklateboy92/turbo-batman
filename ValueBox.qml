import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Item {
    height: sizes.mHeight(2)
    width: sizes.mWidth(6)

    property Attribute target: Attribute {}
    property string overrideText

    Rectangle {
        anchors.fill: parent
        border.color: "black"
        border.width: 1
    }

    TextEdit {
        id: textbox
        readOnly: true
        anchors.fill: parent
        text: overrideText ? overrideText : target.value
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
