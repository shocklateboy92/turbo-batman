import QtQuick 2.0

Rectangle {
    border.color: "red"
    width: main_row.width
    height: 62

    Row {
        id: main_row
        anchors {
            top: parent.top
            bottom: parent.bottom
        }

        DescriptionBox {
            title: "AC"
            description: "Armour Class"
            width: sizes.mWidth(12)
        }

        Rectangle {
            width: sizes.mWidth(1)
            height: parent.height
        }

        LabeledValueBox {
            text: "TOTAL"
        }
        GapText {
            text: "= 10 +"
            width: sizes.mWidth(7)
        }

        LabeledValueBox {
            text: "Armour Bonus"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Sheild Bonus"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Dex Modifier"
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

        LabeledValueBox {
            text: "Natural Armour"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Deflection Modifier"
        }
        GapText {
            text: "+"
        }

        LabeledValueBox {
            text: "Misc Modifier"
        }
    }

    Component.onCompleted: {
        console.log("ArmourClassArea Completed:")
        console.log(width);
        console.debug(width/sizes.mWidth(1));
    }
}
