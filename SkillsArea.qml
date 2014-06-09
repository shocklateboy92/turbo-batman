import QtQuick 2.0
import QtQuick.Window 2.1

Row {
    spacing: 20
    Column {
        id: yolo
        Repeater {
            model: skill_list.skills
            delegate: Rectangle {Text {
                text: modelData.name.toUpperCase()
                font.pointSize: 10
                id: t
            }
            width: Math.max(t.paintedWidth, yolo.width)
            height: t.height
            color: "red"}
        }
    }
    Column {
        Repeater {
            model: skill_list.skills
            delegate: Text {
                text: "DEX"
            }
        }
    }
    Component.onCompleted: {
        console.log(yolo.width)
    }
}
