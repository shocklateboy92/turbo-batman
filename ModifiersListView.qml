import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

import org.lasath.turbo_batman 1.0

Column {
    id: root

    property alias model: rep.model

    anchors.fill: parent

    Repeater {
        id: rep

        delegate: Item {
            height: Math.max(tnum.height, tedit.paintedHeight)
            width: root.width

            Rectangle {
                id: bg
                anchors.fill: parent

                color: "#00000000"
                border.color: "#00000000"

                states: [
                    State {
                        name: "active"
                        extend: "hovered"
                        when: tedit.activeFocus || tnum.activeFocus
                        PropertyChanges {
                            target: bg
                            border.color: "#a4a4a4"
                        }
                    },
                    State {
                        name: "hovered"
                        when: bg_area.containsMouse
                        PropertyChanges {
                            target: bg
                            color: "#F1F1F1"
                        }
                    }
                ]
            }

            RowLayout {
                id: row
                anchors.fill: parent
                spacing: sizes.mWidth(2)

                TextInput {
                    id: tnum
                    Layout.preferredWidth: sizes.mWidth(6)

//                    readOnly: display.persistent
                    text: display.phantom ? "" : display.bonus
                    font.pointSize: 18
                    renderType: TextEdit.NativeRendering
                    horizontalAlignment: TextEdit.AlignRight

                    Keys.enabled: true
                    Keys.onPressed: processKeyEvent(event,
                                                    Positioner.index,
                                                    cursorPosition)
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    validator: IntValidator {}

                    Binding {
                        target: display
                        property: "bonus"
                        value: tnum.text
                        when: !display.persistent
                    }

                    KeyNavigation.left: tnum
                    KeyNavigation.tab: tedit
                }

                TextEdit {
                    id: tedit
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    text: display.name
                    renderType: TextEdit.NativeRendering
                    verticalAlignment: TextEdit.AlignVCenter
                    wrapMode: TextEdit.Wrap

                    // FIXME: do cursor manually, to mimic GMail's
                    selectByMouse: true
                    Keys.enabled: true
                    Keys.onPressed: processKeyEvent(event,
                                                    Positioner.index,
                                                    cursorPosition)

                    Binding {
                        target: display
                        property: "name"
                        value: tedit.text
                        when: !display.persistent
                    }
                }
            }

            MouseArea {
                id: bg_area
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.NoButton
                cursorShape: "IBeamCursor"
            }

            function takeFocus(tIndex, prevPos) {
                var t = row.children[tIndex];
                t.cursorPosition = prevPos;
                t.forceActiveFocus();
            }

            function makeVolatile() {
                display.persistent = false;
                tnum.forceActiveFocus();
                tnum.selectAll();
            }

            function processKeyEvent(event, tIndex, prevPos) {
                var nextItem;
                switch (event.key) {

                case Qt.Key_Up:
                    nextItem = rep.itemAt(index -1);
                    break;
                case Qt.Key_Down:
                    nextItem = rep.itemAt(index +1);
                    break;
                case Qt.Key_Return:
                    if (!display.phantom) {
                        rep.model.insertRows(index +1, 1);
                        rep.itemAt(index +1).makeVolatile();
                    }
                    event.accepted = true;
                    break;
                }

                if (nextItem) {
                    nextItem.takeFocus(tIndex, prevPos);
                }
            }
        }
    }
}
