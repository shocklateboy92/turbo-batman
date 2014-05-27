import QtQuick 2.0

Item {
    id: root

    property list<Modifier> __mods_list;
    default property alias modifiers: root.__mods_list

    property variant value: {
        var sum = 0;
        for (var k in root.__mods_list) {
            sum = root.__mods_list[k].__eval(sum);
        }
        return sum;
    }
}
