import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

SplitView {
    id: main_sheet
    property alias currentAttribute: modifiers_list.model

    orientation: Qt.Horizontal
    anchors.fill: parent

    Item {
        Layout.fillWidth: true

        Rectangle {
            id: tabview_main
            anchors.fill: parent

            border.color: palette.dark

            MainSheet {
                anchors.fill: parent
                anchors.margins: 10
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

                        onClicked: action.trigger()
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

    SystemPalette {
        id: palette
    }
}
