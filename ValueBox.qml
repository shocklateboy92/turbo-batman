import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.lasath.turbo_batman 1.0

Item {
    width: sizes.mWidth(6)
    height: sizes.mHeight(2)

    property Attribute target: Attribute {}
    property string overrideText
    property alias textInnerTop: innertop_text.text

    Rectangle {
        anchors.fill: parent
        border.color: "black"
        border.width: 1
    }

    Text {
        id: innertop_text
        anchors {
            left: parent.left
            top: parent.top
            margins: sizes.mWidth(0.2)
        }
        font: sizes.smallFont
        visible: text
    }

    TextEdit {
        id: textbox
        readOnly: true
        anchors.fill: parent
        text: overrideText ? overrideText : target.value
        horizontalAlignment: textInnerTop ?
                                 Text.AlignRight :
                                 Text.AlignHCenter
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
