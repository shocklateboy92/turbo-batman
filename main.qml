import QtQuick 2.2

import org.lasath.turbo_batman 1.0

TurboBatman {

    Attribute {
        id: strength
        modifiers: Modifier {
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
        Modifier {
            bonus: tfa_young.active ? 2 : tfa_mid.active ? -2 : tfa_old.active ? -2 : 0
            name: "Threefold Aspect"
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
        Modifier {
            bonus: tfa_young.active ? 2 : 0
            name: "Threefold Aspect"
        }
    }

    Attribute {
        id: intelligence
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

    Attribute {
        id: wisdom
        Modifier {
            bonus: 10
            name: "Base"
        }
        Modifier {
            bonus: tfa_young.active ? -2 : tfa_mid.active ? 2 : tfa_old.active ? 4 : 0
            name: "Threefold Aspect"
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
        }
        Skill {
            name: "Appraise"
        }
        Skill {
            name: "Bluff"
        }
        Skill {
            name: "Climb"
        }
        Skill {
            name: "Craft"
        }
        Skill {
            name: "Diplomacy"
        }
        Skill {
            name: "Disable Device"
        }
        Skill {
            name: "Disguise"
        }
        Skill {
            name: "Escape Artist"
        }
        Skill {
            name: "Fly"
        }
        Skill {
            name: "Handle Animal"
        }
        Skill {
            name: "Heal"
        }
        Skill {
            name: "Intimidate"
        }
        Skill {
            name: "Knowledge"
        }
        Skill {
            name: "Linguistics"
        }
        Skill {
            name: "Perception"
        }
        Skill {
            name: "Perform"
        }
        Skill {
            name: "Profession"
        }
        Skill {
            name: "Ride"
        }
        Skill {
            name: "Sense Motive"
        }
        Skill {
            name: "Sleight of Hand"
        }
        Skill {
            name: "Spellcraft"
        }
        Skill {
            name: "Survival"
        }
        Skill {
            name: "Swim"
        }
        Skill {
            name: "Use Magic Device"
        }
    }
}
