import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Attribute {
    id: root
    property string name: "<unnamed_skill>"

    property AbilityScore ability
    property int ranks
    property int misc: value - ranks - ability.mod
    property bool class_skill: false

    Modifier {
        name: "Ability Score (" + ability.description + ")"
        bonus: ability.mod
    }

    Modifier {
        name: "Ranks"
        bonus: ranks
    }

    property Modifier __class_skill_mod: Modifier {
        name: "Class Skill"
        bonus: 3
    }

    Component.onCompleted: {
        if (class_skill) {
            root.addModifier(__class_skill_mod);
        }
    }
}
