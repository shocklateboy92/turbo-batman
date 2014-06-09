import QtQuick 2.0
import QtQuick.Window 2.1
import "util.js" as Dim

Row {
    spacing: 20
    Column {
        id: yolo
        Repeater {
            model: skill_list.skills
            delegate: Text {
                text: modelData.name.toUpperCase()
                font.pointSize: 10
            }
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
