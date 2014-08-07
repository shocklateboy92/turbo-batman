import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Area {
    width: col_main.width
    height: sizes.mHeight(4)

    Row {
        id: col_main
        spacing: sizes.mWidth(2)

        DescriptionBox {
            title: "Hex DC"
            description: "Difficulty Class"
            width: sizes.mWidth(14)
            anchors.bottom: parent.bottom
        }
        ValueBox {
            anchors.bottom: parent.bottom
            target: Attribute {
                Bonus {
                    bonus: 10
                    name: "Base"
                }
                Bonus {
                    bonus: level.value / 2
                    name: "Level / 2"
                }
                Bonus {
                    bonus: intelligence.mod
                    name: "Intelligence Modifier"
                }
            }
        }

        Column {
            Text {
                text: "Spell Level".toUpperCase()
                anchors.right: parent.right
            }

            DescriptionBox {
                title: "Spell DC's"
                description: "Difficulty Class"
                width: sizes.mWidth(24)
            }
        }

        Repeater {
            model: 10

            Column {
                Text {
                    text: modelData
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                }
                ValueBox {
                    target: Attribute {
                        Bonus {
                            bonus: 10
                            name: "Base"
                        }
                        Bonus {
                            bonus: modelData
                            name: "Spell Level"
                        }
                        Bonus {
                            bonus: intelligence.mod
                            name: "Int Modifier"
                        }
                        Bonus {
                            bonus: 2
                            source: robe_runes
                        }
                    }
                }
            }
        }
    }
}
