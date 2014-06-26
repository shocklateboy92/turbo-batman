import QtQuick 2.0

Area {
    width: sizes.mWidth(80)
    height: sizes.mHeight(2)

    Row {
        anchors.fill: parent
        spacing: sizes.mWidth(1)

        RoundedDescriptionBox {
            title: "Base Attack Bonus"
            width: sizes.mWidth(40)
        }

        ValueBox {
            width: sizes.mWidth(12)
        }

        DescriptionBox {
            title: "SR"
            width: sizes.mWidth(16)
        }

        ValueBox {
        }
    }
}
