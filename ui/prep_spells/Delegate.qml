import QtQuick 2.0

Rectangle {
    id: root
    height: name_input.implicitHeight

    color: palette.alternateBase
    radius: 5

    TextInput {
        id: name_input
        anchors.fill: parent
//        visible: false
        text: "yolo"
        font.pointSize: 24
        enabled: true
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
    }

    SystemPalette {
        id: palette
    }

    states: [
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
