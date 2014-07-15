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
            width: parent.width

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

                    Keys.onDeletePressed: {
                        if (tedit.length == 0 && tnum.length == 0
                                && tnum.cursorPosition == 0) {
                            display.removeRow(index);
                        }
                    }

                    onTextChanged: {
                        display.bonus = text;
                    }
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
                    KeyNavigation.left: tnum
                }
            }

            function takeFocus(tIndex, prevPos) {
                var t = row.children[tIndex];
                t.cursorPosition = prevPos;
                t.forceActiveFocus();
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
                }

                if (nextItem) {
                    nextItem.takeFocus(tIndex, prevPos);
                }
            }
        }
    }
}
