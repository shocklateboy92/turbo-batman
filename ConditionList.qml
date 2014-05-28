import QtQuick 2.0

Item {
    id: root

    property list<Condition> __data
    default property alias conditions: root.__data
}
