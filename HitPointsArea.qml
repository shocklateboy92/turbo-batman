import QtQuick 2.0

Area {
    width: top_row.childrenRect.width
    height: sizes.mHeight(16)

    Column {
        Row {
            id: top_row

            spacing: sizes.mWidth(1)
            height: sizes.mHeight(2.5)

            DescriptionBox {
                title: "HP"
                description: "HIT POINTS"
                height: parent.height
            }

            ValueBox {
                width: sizes.mWidth(14)
                textInnerTop: "Total"
                height: parent.height
            }

            ValueBox {
                width: sizes.mWidth(10)
                textInnerTop: "DR"
                height: parent.height
            }
        }

        Column {
            width: parent.width
            Text {
                font: sizes.smallFont
                text: "wounds/current hp"
                height: sizes.mHeight(1.5)
                verticalAlignment: Text.AlignBottom
            }

            ValueBox {
                height: sizes.mHeight(4)
                width: parent.width
            }
        }

        Column {
            width: parent.width
            Text {
                font: sizes.smallFont
                text: "nonlethal damage"
                height: sizes.mHeight(1.5)
                verticalAlignment: Text.AlignBottom
            }

            ValueBox {
                height: sizes.mHeight(2)
                width: parent.width
            }
        }

        Rectangle {
            width: parent.width
            height: sizes.mHeight(1)
        }

        Row {
            DescriptionBox {
                title: "initiative"
                description: "modifier"
                width: sizes.mWidth(13)
            }
            Rectangle {
                height: sizes.mHeight(2)
                width: sizes.mWidth(1)
            }

            LabeledValueBox {
                text: "Total"
            }

            GapText {
                text: "="
            }

            LabeledValueBox {
                text: "Dex Modifier"
            }

            GapText {
                text: "+"
            }

            LabeledValueBox {
                text: "Misc Modifier"
            }
        }
    }
}
