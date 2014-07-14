import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Attribute {
    property AbilityScore ability
    property bool primary: false

    Bonus {
        name: "Base"
        bonus: primary ?
                   Math.floor((level.value / 2) + 2) :
                   Math.floor(level.value / 3)
    }

    Bonus {
        name: "Ability Modifier (" + ability.description + ")"
        bonus: ability.mod
    }
}
