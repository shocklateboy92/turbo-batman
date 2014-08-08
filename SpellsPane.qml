import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import org.lasath.turbo_batman 1.0

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

        ScrollView {
            anchors.fill: parent
            style: ScrollViewStyle { }

            ListView {
                id: view

                clip: true
                model: turbo_batman.spells_db

                delegate: SpellDelegate {
                    width: parent.width
                }
            }
        }
    }
}
