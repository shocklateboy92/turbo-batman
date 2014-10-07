import QtQuick 2.0

Area {
    width: sizes.mWidth(80)
    height: sizes.mHeight(8)

    Row {
        id: row_cmb
        anchors {
            left: parent.left
            top: parent.top
//            bottom: parent.bottom
        }

        RoundedDescriptionBox {
            title: "CMB"
            width: sizes.mWidth(28)
        }

        Spacer {
            width: sizes.mWidth(2)
        }

        LabeledValueBox {
             text: "TOTAL"
        }
        GapText {
            text: "="
        }

        LabeledValueBox {
            text: "BAB"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Strength Modifier"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Size Modifier"
        }
    }

    Row {
        id: row_cmd
        anchors {
            left: parent.left
            top: row_cmb.bottom
            topMargin: sizes.mHeight(0.5)
            bottom: parent.bottom
        }

        RoundedDescriptionBox {
            title: "CMD"
            width: sizes.mWidth(28)
        }

        Spacer {
            width: sizes.mWidth(2)
        }

        LabeledValueBox {
             text: "TOTAL"
        }
        GapText {
            text: "="
        }

        LabeledValueBox {
            text: "BAB"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Strength Modifier"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Dexterity Modifier"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Size Modifier"
        }
        GapText {
            text: "+"
        }
        GapText {
            text: "10"
            font.pointSize: 13
        }
    }

    ValueBox {
        textInnerTop: "Modifiers"
        anchors {
            left: row_cmb.right
            leftMargin: sizes.mWidth(2)
            right: parent.right
            top: parent.top
        }
        height: row_cmb.height
    }
}
