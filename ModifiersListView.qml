import QtQuick 2.2
import QtQuick.Controls 1.1

import org.lasath.turbo_batman 1.0

Column {
    id: modifiers_list

    property alias model: rep.model

    anchors.fill: parent

    Repeater {
        id: rep

        delegate: Item {
            height: childrenRect.height
            width: modifiers_list.width

            Rectangle {
                id: bg
                color: "#F1F1F1"
                anchors.fill: parent
                border.color: "#a4a4a4"
                visible: tedit.activeFocus || tnum.activeFocus
            }

            Row {
                id: row
                spacing: sizes.mWidth(2)

                TextInput {
                    id: tnum
                    width: sizes.mWidth(6)

//                    readOnly: display.persistent
                    text: display.bonus
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
                    height: Math.max(parent.height, paintedHeight)

                    text: display.name
                    renderType: TextEdit.NativeRendering
                    verticalAlignment: TextEdit.AlignVCenter

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
                    rep.model.insertRows(index +1, 1);
                    rep.itemAt(index +1).makeVolatile();
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
