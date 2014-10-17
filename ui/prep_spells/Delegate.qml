import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import org.lasath.turbo_batman 1.0

Loader {
    id: root

    readonly property bool editing: ListView.isCurrentItem
    function makeEditable() {
        view.currentIndex = index;
    }
    function makeUneditable() {
        view.currentIndex = -1;
    }

    SystemPalette {
        id: palette
    }

    sourceComponent: editing ? editDelegate : defaultDelegate

    Component {
        id: defaultDelegate
        Rectangle {
            id: edit_root
            height: layout.height
            color: palette.window
            radius: 5

            RowLayout {
                id: layout
                width: parent.width
                Text {
//                    Layout.fillWidth: true
                    font.pointSize: 24
                    text: model.name
                }
                Button {
                    id: edit_button
                    text: "Edit"
                    visible: false
                    onClicked: makeEditable()
                }
            }
            MouseArea {
                id: mouse_area
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.NoButton
            }
            states: [
                State {
                    name: "hovered"
                    when: mouse_area.containsMouse
                    PropertyChanges {
                        target: edit_root
                        color: palette.highlight
                    }
                    PropertyChanges {
                        target: edit_button
                        visible: true
                    }
                }
            ]
        }
    }
    Component {
        id: editDelegate
        RowLayout {
            TextField {
                id: name_input
                Layout.fillWidth: true

                text: model.name
                font.pointSize: 24
                Component.onCompleted: {
                    selectAll();
                    forceActiveFocus();
                }
                onAccepted: {
                    deselect();
                    model.name = text;

                    makeUneditable();
                }
                property bool updateBlocked: false
                onTextChanged: {
                    if (!updateBlocked) {
                        updateBlocked = true;
                        completer.setPrefix(text);
                        updateBlocked = false;
                    }
                }

                Completer {
                    id: completer
                    sourceModel: turbo_batman.spells_db
                    onBestMatchChanged: {
                        var cur = name_input.cursorPosition;
                        if (text.length > cur) {
                            name_input.text = text;
                            name_input.select(cur, text.length);
                        }
                    }
                }
            }

            ComboBox {
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true
                editable: true
                onAccepted: makeUneditable();
                onActiveFocusChanged: {
                    if (activeFocus) {
                        selectAll();
                    }
                }
                // TODO: Take these from the Feats DB
                model: ["No Metamagic", "Quickened", "Silenced",
                        "Maximized", "Heightened", "Empowered"]
            }

        }
    }
}
