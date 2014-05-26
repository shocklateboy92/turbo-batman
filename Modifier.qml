import QtQuick 2.0

Item {
    property int addition

    property var __eval: function(value) {
        return value + addition;
    }
}
