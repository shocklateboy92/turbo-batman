import QtQuick 2.0

Grid {
    flow: GridView.TopToBottom
    anchors.centerIn: parent
    spacing: 10
    rows: 6
    columns: 5

    DescriptionBox {
        title: "STR"
        description: "Strength"
    }

    DescriptionBox {
        title: "dex"
        description: "dexterity"
    }

    DescriptionBox {
        title: "con"
        description: "Constitution"
    }

    DescriptionBox {
        title: "int"
        description: "Intelligence"
    }

    DescriptionBox {
        title: "wis"
        description: "Wisdom"
    }

    DescriptionBox {
        title: "cha"
        description: "Charistma"
    }

    Repeater {
        model: 24
        delegate: ValueBox {

        }
    }
}
