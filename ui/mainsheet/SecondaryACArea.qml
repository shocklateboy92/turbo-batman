import QtQuick 2.0

Area {
    width: sizes.mWidth(80)
    height: sizes.mHeight(2)

    Row {
        anchors.fill: parent
        spacing: sizes.mWidth(1)

        DescriptionBox {
            title: "Touch"
            description: "Armour Class"
            width: sizes.mWidth(14)
        }

        ValueBox {
        }

        DescriptionBox {
            title: "Flat-Footed"
            description: "Armour Class"
            width: sizes.mWidth(18)
        }

        ValueBox {
        }

        ValueBox {
            textInnerTop: "Modifiers"
            width: sizes.mWidth(32)
        }
    }
}
