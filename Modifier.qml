import QtQuick 2.0

Item {
    id: root
    property int bonus
    property string name: "<unnamed_bonus>"

    property var __eval: function(value) {
        return value + bonus;
    }
}
