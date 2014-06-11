import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Attribute {
    property string title: "XXX"
    property string description: ""

    property int abilityMod: Math.floor((value - 10) / 2)
}
