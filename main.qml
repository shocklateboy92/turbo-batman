import QtQuick 2.2

import org.lasath.turbo_batman 1.0

TurboBatman {

    Attribute {
        id: strength
        modifiers: [Modifier {
            bonus: 10
            name: "Base"
        },
        Modifier {
            bonus: -3
            name: "Point Buy"
        },
        Modifier {
            bonus: 4
            name: "Race Bonus (Boggard)"
        }]
    }

    Attribute {
        id: dexterity
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: 2
            name: "Point Buy"
        }
        Modifier {
            bonus: -2
            name: "Race Bonus (Boggard)"
        }
    }

    Attribute {
        id: constitution
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: +4
            name: "Point Buy"
        }
        Modifier {
            bonus: 4
            name: "Race Bonus (Boggard)"
        }
    }

    Attribute {
        id: intelligence
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: tfa_young.active ? 8 : 0
            name: "Point Buy"
        }
        Modifier {
            bonus: +2
            name: "Race Bonus (Human)"
        }
        Modifier {
            name: "Headband of Vast Intelligence"
            bonus: 6
        }
    }

    Attribute {
        id: wisdom
        Modifier {
            bonus: 10
            name: "Base"
        }
    }

    Attribute {
        id: charistma
        Modifier {
            bonus: 10
            name: "Base"
        }
    }

    ConditionList {
        id: conds

        Condition {
            id: tfa_young
            name: "Threefold Aspect (Young)"
        }
        Condition {
            id: swamp
            name: "Funky Bonus"
        }
    }
}
