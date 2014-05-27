import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

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
        id: strength
    }
    Attribute {
        id: dexterity
    }
    Attribute {
        id: constitution
    }
    Attribute {
        id: intelligence
    }
    Attribute {
        id: wisdom
    }
    Attribute {
        id: charistma
    }


    SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical

        SplitView {
            orientation: Qt.Horizontal
            Layout.fillHeight: true

            Rectangle {
                color: "white"
                Layout.fillWidth: true
                MainSheet {
                    anchors.fill: parent
                    anchors.margins: 20
                }
            }

            Rectangle {
                width: parent.width * 0.4
            }
        }

        Rectangle {
            height: 200
        }
    }
}
