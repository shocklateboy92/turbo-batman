import QtQuick 2.0

Area {
    height: sizes.mHeight(6)
    width: sizes.mWidth(54)

    Column {
        id: col_main

        Row {
            spacing: sizes.mWidth(1)
            height: sizes.mHeight(3)

            DescriptionBox {
                title: "Speed"
                description: "land"
            }

            LabeledValueBox {
                width: sizes.mWidth(16)
                text: "Base Speed"
            }
            LabeledValueBox {
                width: sizes.mWidth(16)
                text: "With Armour"
            }
        }

        Row {
            spacing: sizes.mWidth(1)

            LabeledValueBox {
                width: sizes.mWidth(17)
                text: "Fly"
            }
            LabeledValueBox {
                id: vbox_swim
                width: sizes.mWidth(8)

                text: "Swim"
            }

            LabeledValueBox {
                text: "Climb"
                width: vbox_swim.width
            }
            LabeledValueBox {
                text: "Burrow"
                width: vbox_swim.width
            }
        }
    }

    ValueBox {
        id: vbox_movement_modifiers

        height: sizes.mHeight(5)
        anchors {
            left: col_main.right
            leftMargin: sizes.mWidth(1)
            right: parent.right
        }

        textInnerTop: "Temp\nModifiers"
    }
}
