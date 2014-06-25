import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    Row {
    ColumnLayout {
        spacing: 20
//        anchors.fill: parent
        Row {
            spacing: sizes.mHeight(1)
            Column {
                spacing: sizes.mWidth(1)
                Repeater {
                    model: abilityScore_list.data
                    delegate: DescriptionBox {
                        title: modelData.title
                        description: modelData.description
                    }
                }
            }

            Grid {
                id: abilityScores
                flow: GridView.TopToBottom
                spacing: sizes.mWidth(1)
                rows: 6
                columns: 4

                ValueBox {
                    target: strength
                }
                ValueBox {
                    target: dexterity
                }
                ValueBox {
                    target: constitution
                }
                ValueBox {
                    target: intelligence
                }
                ValueBox {
                    target: wisdom
                }
                ValueBox {
                    target: charistma
                }

                Repeater {
                    model: 18
                    delegate: ValueBox {

                    }
                }
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
