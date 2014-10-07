import QtQuick 2.0

Column {
    id: root
    property string text

    Repeater {
        model: skill_list.skills.length
        delegate: Text {
            text: root.text
        }
    }
}
