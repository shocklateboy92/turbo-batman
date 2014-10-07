import QtQuick 2.0
import QtQuick.Window 2.1

Area {
    width: sizes.mWidth(54)
    height: childrenRect.height
    Row {
        spacing: sizes.mWidth(0.5)

        Item {
            height: c1.height
            width: c1.width + sizes.mWidth(1)
            Column {
                id: c1

                Repeater {
                    model: skill_list.skills
                    delegate: Text {
                        text: modelData.name.toUpperCase()
                    }
                }
            }
        }

        Column {
            id: col_totals

            Repeater {
                model: skill_list.skills
                delegate: SkillValueBox {
                    text: modelData.value
                }
            }
        }

        SkillsAreaTextColumn {
            text: "="
        }

        Column {
            Repeater {
                model: skill_list.skills
                delegate: Text {
                    text: modelData.ability.title.toUpperCase()
                }
            }
        }

        Column {
            id: col_mods
            Repeater {
                model: skill_list.skills
                delegate: SkillValueBox {
                    text: modelData.ability.mod
                }
            }
        }

        SkillsAreaTextColumn {
            text: "+"
        }

        Column {
            id: col_ranks
            Repeater {
                model: skill_list.skills
                delegate: SkillValueBox {
                    text: modelData.ranks
                }
            }
        }

        SkillsAreaTextColumn {
            text: "+"
        }

        Column {
            id: col_misc
            Repeater {
                model: skill_list.skills
                delegate: SkillValueBox {
                    text: modelData.misc
                }
            }
        }
    }
}
