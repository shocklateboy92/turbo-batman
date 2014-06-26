import QtQuick 2.0

Area {
    width: sizes.mWidth(80)
    height: sizes.mHeight(3.6)

    Row {
        id: row_cmb
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
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
            id: der
            text: "Size Modifier"
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
        height: der.height
    }
}
