import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Attribute {
    property string name: "<unnamed_skill>"

    property AbilityScore mod
    property int ranks
    property int misc: value - ranks - mod.abilityMod

    Modifier {
        name: "Ability Score (" + mod.description + ")"
        bonus: mod.abilityMod
    }

    Modifier {
        name: "Ranks"
        bonus: ranks
    }
}
