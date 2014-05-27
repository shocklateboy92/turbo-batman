import QtQuick 2.0

Item {
    id: root
    property int bonus
    property string name: "<unnamed_bonus>"

    property var __eval: function(value) {
        return value + bonus;
    }

    property variant targets: []

    Component.onCompleted: {
        for (var i in targets) {
            var mods = targets[i].__mods_list;
            mods[mods.length] = root;
            console.debug(JSON.stringify(mods));
//            targets[i].__mods_list = mods;
        }
    }
}
