import QtQuick 2.0
import QtQuick.Layouts 1.1

Area {
    width: sizes.mWidth(80)
    height: sizes.mHeight(9.5)

    Column {
        id: col_main
        spacing: sizes.mHeight(0.5)
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        Row {
            spacing: sizes.mWidth(2)
            Repeater {
                id: rep_titles
                model: ["SAVING THROWS", "TOTAL", "Base Save", "Ability Modifier",
                    "Magic Modifier", "Misc Modifier", "Temproaray Modifier"]
                delegate: Text {
                    text: modelData
                    wrapMode: Text.WordWrap

                    width: index < 1 ? sizes.mWidth(16) : sizes.mWidth(6)
                    height: sizes.mHeight(2)

                    font: index < 2 ? sizes.smallFont : sizes.tinyFont

                    verticalAlignment: Text.AlignBottom
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        Repeater {
            model: [
                ["Fortitude", fortitude],
                ["Reflex", reflex],
                ["Will", will]
            ]
            delegate:  Row {
                DescriptionBox {
                    title: modelData[0]
                    description: modelData[1].ability.description
                    width: sizes.mWidth(16)
                }

                Rectangle {
                    height: sizes.mHeight(2)
                    width: sizes.mWidth(2)
                }

                ValueBox {
                    target: modelData[1]
                }
                GapText{
                    text: "="
                }

                ValueBox {
                }
                GapText{
                    text: "+"
                }

                ValueBox {
                }
                GapText{
                    text: "+"
                }

                ValueBox {
                }
                GapText{
                    text: "+"
                }

                ValueBox {
                }
                GapText{
                    text: "+"
                }

                ValueBox {
                }
            }
        }
    }

    ValueBox {
        anchors {
            left: col_main.right
            leftMargin: sizes.mWidth(2)
            right: parent.right
            top: parent.top
            topMargin: sizes.mHeight(0.8)
            bottom: parent.bottom
        }

        textInnerTop: "Modifiers"
    }
}
