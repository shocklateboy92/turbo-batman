import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    Row {
    ColumnLayout {
        spacing: 20
//        anchors.fill: parent
        Row {
            spacing: abilityScores.columnSpacing
            AbilityScoresArea {
                id: abilityScores
            }

            ColumnLayout {
                width: abilityScores.width
                height: abilityScores.height
                spacing: 10
                RowLayout {
                    spacing: 10
                    DescriptionBox {
                        title: "HP"
                        description: "Hit Points"
                    }
                    ValueBox {
                        Layout.fillWidth: true
                    }
                    ValueBox {
                        Layout.fillWidth: true
                    }
                }
                ValueBox {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                ValueBox {
                    Layout.fillWidth: true
                }
                RowLayout {
                    DescriptionBox {
                        Layout.fillWidth: true
                        title: "INITIATIVE"
                        description: "Modifier"
                    }
                    ValueBox {
                    }
                    Text {
                        text: "="
                    }
                    ValueBox {
                    }
                    Text {
                        text: "+"
                    }
                    ValueBox {
                    }
                }
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
//        }
    }
    SkillsArea {

    }
    }
}
