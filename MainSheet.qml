import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    Row {
        Column {
            Row {
                spacing: abilityScores.columnSpacing
                AbilityScoresArea {
                    id: abilityScores
                }

                HitPointsArea {
//                    height: parent.height
                }
            }

//        RowLayout {
//            DescriptionBox {
//                title: "AC"
//                description: "Armour Class"
//                Layout.fillWidth: true
//            }
//            ValueBox {
//            }
//            Text {
//                text: "="
//            }
//            Text {
//                text: "10"
////                font.pixelSize:
//                Layout.fillWidth: true
//            }
//            ValueBox {
//            }
//            Text {
//                text: "+"
//            }
//            ValueBox {
//            }
//            Text {
//                text: "+"
//            }
//            ValueBox {
//            }
//            Text {
//                text: "+"
//            }
//            ValueBox {
//            }
//            Text {
//                text: "+"
//            }
//            ValueBox {
//            }
//            Text {
//                text: "+"
//            }
//            ValueBox {
//            }
//            Text {
//                text: "+"
//            }
//            ValueBox {
//            }
        }
        SkillsArea {

        }
    }
}
