import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Item {

    ListView {
        id: view
        anchors.fill: parent

        model: turbo_batman.spells_db
        delegate: Text {
            id: delegate
            text: model.name
        }

        section.property: "wiz"
        section.criteria: ViewSection.FullString
        section.delegate: Text {
            font.bold: true
            text: "Level " + section
        }
    }
}
