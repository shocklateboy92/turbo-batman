import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Attribute {
        id: yolo
        Modifier {
            id: mod
            addition: 7
        }
    }

    MainSheet {

    }
    color: "white"

    Button {
        onClicked: mod.addition += 7
    }
}
