import QtQuick 2.0
import QtQuick.Window 2.1

Row {
    spacing: sizes.mWidth(2)
    Column {
        Repeater {
            model: skill_list.skills
            delegate: Text {
                text: modelData.name.toUpperCase()
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
        console.log(yolo.width);
        console.log(sizes.pixelWidth(8));
        console.log(sizes.pixelHeight(8));
        console.log(sizes.mHeight(1.5));
        console.log(sizes.mWidth(1));
    }
}
