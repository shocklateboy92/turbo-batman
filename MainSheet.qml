import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    Row {
        Column {
            Row {
                spacing: sizes.mWidth(2)
                AbilityScoresArea {
                    id: abilityScores
                }

                HitPointsArea {
//                    height: parent.height
                }
            }
            ArmourClassArea {
            }
        }
        SkillsArea {

        }
    }
}
