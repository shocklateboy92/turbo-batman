import QtQuick 2.0

Column {
    property alias target: vbox.target
    property alias text: label.text
    property alias overrideText: vbox.overrideText

    spacing: sizes.mHeight(0.2)

    ValueBox {
        id: vbox
        width: Math.max(parent.width, sizes.mWidth(6))
    }

    Text {
        id: label
        width: parent.width

        font: sizes.tinyFont
        wrapMode: Text.WordWrap

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
