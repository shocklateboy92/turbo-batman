import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle {
    width: sizes.mWidth(10)
    height: sizes.mHeight(2)

    color: "black"
    property string title: "ATR"
    property string description: "Description"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: sizes.mWidth(0.5)

        Text {
            id: title_text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            text: title.toUpperCase()
            color: "white"
            font.pointSize: 14

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Text {
            id: description_text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            text: description.toUpperCase()
            color: "white"
            font: sizes.tinyFont

            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}

