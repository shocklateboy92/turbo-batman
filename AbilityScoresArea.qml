import QtQuick 2.0

Row {
    id: root
    property int columnSpacing: sizes.mWidth(1.5)
    property int rowSpacing: sizes.mHeight(0.5)

    spacing: root.columnSpacing

    Column {
        spacing: root.rowSpacing
        Repeater {
            model: abilityScore_list.data
            delegate: DescriptionBox {
                title: modelData.title
                description: modelData.description
            }
        }
    }

    Grid {
        flow: GridView.TopToBottom
        rowSpacing: root.rowSpacing
        columnSpacing: root.columnSpacing
        rows: 6
        columns: 4

        Repeater {
            model: abilityScore_list.data
            delegate: ValueBox {
            }
        }

        Repeater {
            model: 18
            delegate: ValueBox {
            }
        }
    }
}
