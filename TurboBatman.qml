import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0

import org.lasath.turbo_batman 1.0

ApplicationWindow {
    id: batman
    property alias currentAttribute: modifiers_list.model

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


    SplitView {
        orientation: Qt.Horizontal
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            TabView {
                id: tabview_main
                anchors.fill: parent
                anchors.margins: 5

                focus: true

                Tab {
                    focus: true
                    title: "Main Sheet"
                    Item {
                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: 10

                            MainSheet {
                                anchors.fill: parent
                                anchors.margins: 10
                            }
                        }

                    }
                }

                Tab {
                    focus: true
                    title: "Spells"
                    source: "SpellsPane.qml"

                    // I'm scared by this, but it works
                    asynchronous: true
                }

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

        SplitView {
            orientation: Qt.Vertical
            width: parent.width * 0.4

            Item {
                height: parent.height * 0.4
                GroupBox {
                    anchors.fill: parent
                    anchors.margins: 10
                    title: "Conditions"

                    ListView {
                        delegate: CheckBox {
                            text: modelData.name

                            checked: action.checked
                            Binding {
                                target: modelData
                                property: "active"
                                value: action.checked
                            }

                            onClicked: action.trigger(event.source)
                            Action {
                                id: action
                                shortcut: modelData.shortcut
                                checkable: true
                            }
                        }

                        anchors.fill: parent
                        anchors.margins: 5
                        model: conds.conditions
                    }
                }
            }

            Item {
                width: parent.width

                GroupBox {
                    title: "Modifiers"
                    anchors.margins: 10
                    anchors.fill: parent

                    Flickable {
                        anchors.fill: parent
                        contentWidth: width
                        contentHeight: modifiers_list.height
                        clip: true

                        ModifiersListView {
                            id: modifiers_list
                        }
                    }
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
