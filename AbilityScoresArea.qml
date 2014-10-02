import QtQuick 2.0

Area {
    id: root
    property int columnSpacing: sizes.mWidth(1.5)
    property int rowSpacing: sizes.mHeight(0.5)

    height: sizes.mHeight(15)
    width: sizes.mWidth(42)

    Column {
        id: col_titles
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        spacing: root.rowSpacing
        Repeater {
            model: abilityScore_list.data
            delegate: DescriptionBox {
                title: modelData.title
                description: modelData.description
                width: sizes.mWidth(12)
            }
        }
    }

    Grid {
        id: grid
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        flow: GridView.TopToBottom
        rowSpacing: root.rowSpacing
        columnSpacing: root.columnSpacing
        rows: 6
        columns: 4

        Repeater {
            model: abilityScore_list.data
            delegate: ValueBox {
                target: modelData
            }
        }

        Repeater {
            model: abilityScore_list.data
            delegate: ValueBox {
                target: modelData
//                overrideText: modelData.mod > 0 ?
//                                  "+" + modelData.mod :
//                                  modelData.mod
                overrideText: modelData.mod
            }
        }

        Repeater {
            model: 12
            delegate: ValueBox {
            }
        }
    }
}
