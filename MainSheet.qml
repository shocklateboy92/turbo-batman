import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    Row {
        Column {
            Item {
                width: parent.width
                height: hitPointsArea.height

                AbilityScoresArea {
                    id: abilityScores
                    anchors {
                        left: parent.left
                        top: parent.top
                    }
                }

                HitPointsArea {
                    id: hitPointsArea
                    anchors {
                        right: parent.right
                        top: parent.top
                    }
                }
            }
            ArmourClassArea {
            }
        }
        SkillsArea {

        }
    }
}
