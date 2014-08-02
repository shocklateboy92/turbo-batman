import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    width: 800
    height: 800

    SystemPalette {
        id: palette
    }

//    color: "#00000000"
//    color: "blue"
//    border.color: "blue"
    GroupBox {
        title: "All Spells"
        anchors.fill: parent
        anchors.margins: 10

        ListView {
            id: view
            anchors.fill: parent
//            anchors.margins: 5

            clip: true
            model: all_spells

            delegate: Column {
                width: parent.width
                Text {
                    height: 40
//                    width: parent.width
                    text: name
                    verticalAlignment: Text.AlignVCenter
                }
//                Rectangle {
//                    height: 1
//                    width: parent.width
//                }
            }
        }
    }


    Component.onCompleted: {
        console.debug(view.count);
    }
}
