import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

import org.lasath.turbo_batman 1.0

Item {
    ListView {
        id: view
        anchors.fill: parent

        model: PreparedSpellsModel {
            source: turbo_batman.spells_db
            levelSlots: [8, 7, 7, 5, 5, 4, 3, 2]
        }

        spacing: 10
        delegate: Delegate {
            width: parent.width
            completionModel: turbo_batman.spells_db
        }

        section.property: "level"
        section.criteria: ViewSection.FullString
        section.delegate: Text {
//            font.bold: true
            font.pointSize: 36
            text: "Level " + section
        }
    }
}
