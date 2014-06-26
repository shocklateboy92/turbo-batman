import QtQuick 2.0

Column {
    property alias target: vbox.target
    property alias text: label.text
    spacing: sizes.mHeight(0.2)

    ValueBox {
        id: vbox
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
