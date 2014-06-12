import QtQuick 2.2

import org.lasath.turbo_batman 1.0

TurboBatman {

    AbilityScore {
        id: strength
        title: "STR"
        description: "Strength"

        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: -3
            name: "Point Buy"
        }
        Modifier {
            bonus: 4
            name: "Race Bonus (Boggard)"
        }
        Modifier {
            bonus: tfa_old.active ? -2 : 0
            name: "Threefold Aspect"
        }
    }

    AbilityScore {
        id: dexterity
        title: "dex"
        description: "dexterity"

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
        Modifier {
            bonus: tfa_young.active ? 2 : tfa_mid.active ? -2 : tfa_old.active ? -2 : 0
            name: "Threefold Aspect"
        }
    }

    AbilityScore {
        id: constitution
        title: "con"
        description: "Constitution"

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
        Modifier {
            bonus: tfa_young.active ? 2 : 0
            name: "Threefold Aspect"
        }
    }

    AbilityScore {
        id: intelligence
        title: "int"
        description: "Intelligence"

        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: 8
            name: "Point Buy"
        }
        Modifier {
            bonus: +2
            name: "Race Bonus (Human)"
        }
        Modifier {
            bonus: 6
            name: "Headband of Vast Intelligence"
        }
        Modifier {
            bonus: 1
            name: "Level 4 Stat Increase"
        }
        Modifier {
            bonus: 1
            name: "Level 8 Stat Increase"
        }
        Modifier {
            bonus: 1
            name: "Level 12 Stat Increase"
        }
    }

    AbilityScore {
        id: wisdom
        title: "wis"
        description: "Wisdom"

        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: tfa_young.active ? -2 : tfa_mid.active ? 2 : tfa_old.active ? 4 : 0
            name: "Threefold Aspect"
        }
    }

    AbilityScore {
        id: charistma
        title: "cha"
        description: "Charistma"

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
            id: tfa_mid
            name: "Threefold Aspect (Adult)"
        }
        Condition {
            id: tfa_old
            name: "Threefold Aspect (Elderly)"
        }
    }

    SkillList {
        id: skill_list
        Skill {
            name: "Acrobatics"
            mod: dexterity
        }
        Skill {
            name: "Appraise"
            mod: intelligence
        }
        Skill {
            name: "Bluff"
            mod: charistma
        }
        Skill {
            name: "Climb"
            mod: strength
        }
        Skill {
            name: "Craft"
            mod: intelligence
        }
        Skill {
            name: "Diplomacy"
            mod: charistma
        }
        Skill {
            name: "Disable Device"
            mod: dexterity
        }
        Skill {
            name: "Disguise"
            mod: charistma
        }
        Skill {
            name: "Escape Artist"
            mod: dexterity
        }
        Skill {
            name: "Fly"
            mod: dexterity
        }
        Skill {
            name: "Handle Animal"
            mod: charistma
        }
        Skill {
            name: "Heal"
            mod: wisdom
        }
        Skill {
            name: "Intimidate"
            mod: charistma
        }
        Skill {
            name: "Knowledge"
            mod: intelligence
            class_skill: true
        }
        Skill {
            name: "Linguistics"
            mod: intelligence
            class_skill: true
        }
        Skill {
            name: "Perception"
            mod: wisdom
            class_skill: true
        }
        Skill {
            name: "Perform"
            mod: charistma
        }
        Skill {
            name: "Profession"
            mod: wisdom
            class_skill: true
        }
        Skill {
            name: "Ride"
            mod: dexterity
        }
        Skill {
            name: "Sense Motive"
            mod: wisdom
        }
        Skill {
            name: "Sleight of Hand"
            mod: dexterity
        }
        Skill {
            name: "Spellcraft"
            mod: intelligence
            class_skill: true
        }
        Skill {
            name: "Stealth"
            mod: dexterity
        }
        Skill {
            name: "Survival"
            mod: wisdom
        }
        Skill {
            name: "Swim"
            mod: strength
        }
        Skill {
            name: "Use Magic Device"
            mod: charistma
            class_skill: true
        }
    }
}
