import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    width: 800
    height: 800

    SystemPalette {
        id: palette
    }

    GroupBox {
        title: "All Spells"
        anchors.fill: parent
        anchors.margins: 10

        ListView {
            id: view
            anchors.fill: parent

            clip: true
            model: all_spells

            delegate: SpellDelegate {
                width: parent.width
            }

        }
    }
}
