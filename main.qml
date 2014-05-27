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
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: -3
            name: "Point Buy"
        }
        Modifier {
            bonus: 4
            name: "Race Bonus (Boggard)"
        }
    }

    Attribute {
        id: dexterity
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: 2
            name: "Point Buy"
        }
        Modifier {
            bonus: -2
            name: "Race Bonus (Boggard)"
        }
    }

    Attribute {
        id: constitution
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: +4
            name: "Point Buy"
        }
        Modifier {
            bonus: 4
            name: "Race Bonus (Boggard)"
        }
    }

    Attribute {
        id: intelligence
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: 8
            name: "Point Buy"
        }
        Modifier {
            bonus: +2
            name: "Race Bonus (Human)"
        }
        Modifier {
            name: "Headband of Vast Intelligence"
            bonus: 6
        }
    }

    Attribute {
        id: wisdom
        Modifier {
            bonus: 10
            name: "Base"
        }
    }

    Attribute {
        id: charistma
        Modifier {
            bonus: 10
            name: "Base"
        }
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical

        SplitView {
            orientation: Qt.Horizontal
            Layout.fillHeight: true

            Item {
                Rectangle {
                    color: "white"
                    radius: 3
                    anchors.fill: parent
                    anchors.margins: 10
                }

                Layout.fillWidth: true
                MainSheet {
                    anchors.fill: parent
                    anchors.margins: 20
                }
            }

            Item {
                width: parent.width * 0.4
                GroupBox {
                    anchors.fill: parent
                    anchors.margins: 10
                    title: "Conditions"
                }
            }
        }

        Item {
            height: 400
            GroupBox {
                title: "Modifiers"
                anchors.margins: 10
                anchors.fill: parent
            }
        }
    }
}
