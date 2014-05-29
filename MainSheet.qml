import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    anchors.centerIn: parent
    ColumnLayout {
        spacing: 20
//        anchors.fill: parent
        Row {
            spacing: 10

            Grid {
                id: abilityScores
                flow: GridView.TopToBottom
                spacing: 10
                rows: 6
                columns: 5

                DescriptionBox {
                    title: "STR"
                    description: "Strength"
                }

                DescriptionBox {
                    title: "dex"
                    description: "dexterity"
                }

                DescriptionBox {
                    title: "con"
                    description: "Constitution"
                }

                DescriptionBox {
                    title: "int"
                    description: "Intelligence"
                }

                DescriptionBox {
                    title: "wis"
                    description: "Wisdom"
                }

                DescriptionBox {
                    title: "cha"
                    description: "Charistma"
                }

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
        RowLayout {
            DescriptionBox {
                title: "AC"
                description: "Armour Class"
                Layout.fillWidth: true
            }
            ValueBox {
            }
            Text {
                text: "="
            }
            Text {
                text: "10"
//                font.pixelSize:
                Layout.fillWidth: true
            }
            ValueBox {
            }
            Text {
                text: "+"
            }
            ValueBox {
            }
            Text {
                text: "+"
            }
            ValueBox {
            }
            Text {
                text: "+"
            }
            ValueBox {
            }
            Text {
                text: "+"
            }
            ValueBox {
            }
            Text {
                text: "+"
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
