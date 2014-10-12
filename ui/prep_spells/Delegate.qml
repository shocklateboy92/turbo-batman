import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Rectangle {
    id: root
    height: name_input.implicitHeight

    color: palette.alternateBase
    radius: 5

    TextInput {
        id: name_input
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: anchors.leftMargin
//        visible: false
        text: "yolo"
        font.pointSize: 24
//        enabled: true
        readOnly: true
        onReadOnlyChanged: {
            if (!readOnly) {
                selectAll();
                forceActiveFocus();
            }
        }
        onAccepted: {
            console.debug("accepted!")
            root.state = "";
            deselect();
        }
        onActiveFocusChanged: {
            if (!activeFocus) {
                root.state = "";
            }
        }
        property bool blockUpdate: false
//        Keys.onPressed: {
//            completer.setPrefix(text);
//        }
        onTextChanged: {
            if (!blockUpdate) {
                blockUpdate = true;
                completer.setPrefix(text);
                blockUpdate = false;
            }
        }
    }

    property alias completionModel: completer.sourceModel
    Completer {
        id: completer
//        prefix: name_input.text
//        onBestMatchChanged: function(match) {
//            console.log(match);
////            name_input.text = match;
//        }
        onBestMatchChanged: {
            console.log("derp!" + text);
            var cur = name_input.cursorPosition;
//            name_input.cursorPosition = cur;
//            name_input.moveCursorSelection(text.length, TextInput.SelectCharacters)
            console.log(cur);
            console.log(text.length);
            name_input.text = text;
            name_input.select(cur, text.length);
//            if (text.length > name_input.text.length) {
//                var oldtext = name_input.text;
//                name_input.text = text;
////                name_input.select(text.length, oldtext.length);
//                name_input.select(0, 3);
//            }
        }
    }

    MouseArea {
        id: mouse_area
        anchors.fill: parent
        onClicked: {
            root.state = "editable";
            console.log("mosueEvent!")
        }
        enabled: true
        hoverEnabled: true
    }

    SystemPalette {
        id: palette
    }

    states: [
        State {
            name: "hovered"
            when: mouse_area.containsMouse
            PropertyChanges {
                target: root
                color: palette.highlight
            }
        },
        State {
            name: "editable"
            PropertyChanges {
                target: name_input
                readOnly: false
            }
            PropertyChanges {
                target: mouse_area
                enabled: false
            }
        }
    ]
}
