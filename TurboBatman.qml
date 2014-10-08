import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0

import org.lasath.turbo_batman 1.0

ApplicationWindow {
    id: batman

    visible: true
    width: 640
    height: 480
    title: qsTr("Turbo Batman")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: quitDialog.open();
            }
        }
    }

    Item {
        anchors.fill: parent
        TabView {
            Tab {
                title: "Spontaneous Spells"
                TabView {
                    Repeater{
                        delegate: Tab {
                            title: "Spells" + modelData
                            source: "SpellsPane.qml"

                            // I'm scared by this, but it works
                            asynchronous: true
                        }
                        model: 10

                    }
                }
            }

            Tab {
                title: "Main Sheet"
                source: "CharacterSheet.qml"
            }

            Tab {
                title: "All Spells"
                source: "ui/allspells/SpellsTab.qml"
                asynchronous: true
            }

            Tab {
                title: "Prepared Spells"
                source: "ui/prep_spells/PreparedSpells.qml"
            }

            id: tabview_main
            anchors.fill: parent
            anchors.margins: 5
            focus: true
            clip: true
        }

        Instantiator {
            model: tabview_main.count
            delegate: Action {
                shortcut: "Alt+" + (index + 1)
                onTriggered: {
                    tabview_main.currentIndex = index;
                    tabview_main.getTab(index).forceActiveFocus();
                }
            }
        }
    }



    MessageDialog {
        id: quitDialog

        icon: StandardIcon.Information
        standardButtons: StandardButton.Yes | StandardButton.Cancel

        title: "Confirm Quit"
        text: "Are you sure you want to exit?\nIf you exit now, all newly created modifiers will be lost."

        onYes: Qt.quit();
    }

    onClosing: {
        close.accepted = false;
        quitDialog.open();
    }
}
