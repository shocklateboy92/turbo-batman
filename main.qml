import QtQuick 2.2

import org.lasath.turbo_batman 1.0

TurboBatman {

    AttributeList {
        id: abilityScore_list

        AbilityScore {
            id: strength
            title: "STR"
            description: "Strength"

            Bonus {
                bonus: 10
                name: "Base"
            }
            Bonus {
                bonus: -3
                name: "Point Buy"
            }
            Bonus {
                bonus: tfa_old.active ? -2 : 0
                name: "Threefold Aspect"
            }
        }

        AbilityScore {
            id: dexterity
            title: "dex"
            description: "dexterity"

            Bonus {
                bonus: 10
                name: "Base"
            }
            Bonus {
                bonus: 2
                name: "Point Buy"
            }
            Bonus {
                bonus: 2
                name: "Race Bonus (Catfolk)"
            }
            Bonus {
                bonus: tfa_young.active ? 2 : tfa_mid.active ? -2 : tfa_old.active ? -2 : 0
                name: "Threefold Aspect"
            }
        }

        AbilityScore {
            id: constitution
            title: "con"
            description: "Constitution"

            Bonus {
                bonus: 10
                name: "Base"
            }
            Bonus {
                bonus: +4
                name: "Point Buy"
            }
            Bonus {
                bonus: tfa_young.active ? 2 : 0
                name: "Threefold Aspect"
            }
        }

        AbilityScore {
            id: intelligence
            title: "int"
            description: "Intelligence"

            Bonus {
                bonus: 10
                name: "Base"
            }
            Bonus {
                bonus: 8
                name: "Point Buy"
            }
            Bonus {
                bonus: +2
                name: "Race Bonus (Human)"
            }
            Bonus {
                bonus: 6
                name: "Headband of Vast Intelligence"
            }
            Bonus {
                bonus: 1
                name: "Level 4 Stat Increase"
            }
            Bonus {
                bonus: 1
                name: "Level 8 Stat Increase"
            }
            Bonus {
                bonus: 1
                name: "Level 12 Stat Increase"
            }
        }

        AbilityScore {
            id: wisdom
            title: "wis"
            description: "Wisdom"

            Bonus {
                bonus: 10
                name: "Base"
            }
            Bonus {
                bonus: tfa_young.active ? -2 : tfa_mid.active ? 2 : tfa_old.active ? 4 : 0
                name: "Threefold Aspect"
            }
        }

        AbilityScore {
            id: charistma
            title: "cha"
            description: "Charistma"

            Bonus {
                bonus: 10
                name: "Base"
            }
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
        Condition {
            id: ring_shield
            name: "Ring of Shield"
        }
        Condition {
            id: wand_mage_armor
            name: "Wand of Mage Armour"
        }
    }

    AttributeList {
        id: skill_list
        Skill {
            name: "Acrobatics"
            mod: dexterity
        }
        Skill {
            name: "Appraise"
            mod: intelligence
            ranks: 6
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
            name: "Craft (Alchemy)"
            mod: intelligence
            ranks: 7
        }
        Skill {
            name: "Diplomacy"
            mod: charistma
            ranks: 2

            Bonus {
                bonus: 4
                name: "Race Bonus (Catfolk)"
            }
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
            ranks: 14
        }
        Skill {
            name: "Handle Animal"
            mod: charistma
            ranks: 14
        }
        Skill {
            name: "Heal"
            mod: wisdom
        }
        Skill {
            name: "Intimidate"
            mod: charistma
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Arcana)"
            mod: intelligence
            class_skill: true
            ranks: 14
        }
        Skill {
            name: "Knowledge (Dungeoneering)"
            mod: intelligence
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Engineering)"
            mod: intelligence
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Geography)"
            mod: intelligence
            class_skill: true
            ranks: 3
        }
        Skill {
            name: "Knowledge (History)"
            mod: intelligence
            class_skill: true
            ranks: 14

            Bonus {
                bonus: 2
                name: "Race Bonus (Catfolk)"
            }
        }
        Skill {
            name: "Knowledge (Local)"
            mod: intelligence
            class_skill: true
            ranks: 14

            Bonus {
                bonus: 2
                name: "Race Bonus (Catfolk)"
            }
        }
        Skill {
            name: "Knowledge (Nature)"
            mod: intelligence
            class_skill: true
            ranks: 9
        }
        Skill {
            name: "Knowledge (Nobility)"
            mod: intelligence
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Planes)"
            mod: intelligence
            class_skill: true
            ranks: 3
        }
        Skill {
            name: "Knowledge (Religion)"
            mod: intelligence
            class_skill: true
            ranks: 14
        }
        Skill {
            name: "Linguistics"
            mod: intelligence
            class_skill: true
            ranks: 3
        }
        Skill {
            name: "Perception"
            mod: wisdom
            class_skill: true
            ranks: 14
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
            ranks: 4
        }
        Skill {
            name: "Sense Motive"
            mod: wisdom
            Bonus {
                bonus: 2
                name: "Misc Mod"
            }
        }
        Skill {
            name: "Sleight of Hand"
            mod: dexterity
            ranks: 1
        }
        Skill {
            name: "Spellcraft"
            mod: intelligence
            class_skill: true
            ranks: 14
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
            ranks: 3
        }
        Skill {
            name: "Use Magic Device"
            mod: charistma
            class_skill: true
            ranks: 11
        }
    }

    Attribute {
        id: initiative
        Bonus {
            bonus: dexterity.abilityMod
            name: "Dexterity Modifier"
        }
        Bonus {
            bonus: 4
            name: "Improved Initiative"
        }
    }

    Attribute {
        id: hit_points
        Bonus {
            bonus: 125
            name: "Stuff"
        }
    }

    Attribute {
        id: armour_class

        Bonus {
            bonus: 10
            name: "Base"
        }
        Bonus {
            bonus: 4
            source: ring_shield
        }
        Bonus {
            bonus: 4
            source: wand_mage_armor
        }

        Bonus {
            bonus: 1
            name: "Armour Bonus (From somewhere)"
        }
        Bonus {
            bonus: 1
            name: "Natural Armour (From somewhere)"
        }
        Bonus {
            bonus: dexterity.abilityMod
            name: "Dexterity Modifier"
        }
        Bonus {
            bonus: 1
            name: "Ring of Protection"
        }
    }

    Attribute {
        id: fortitude
        Bonus {
            bonus: 4
            name: "Base"
        }
        Bonus {
            bonus: constitution.abilityMod
            name: "Ability Modifier"
        }
        Bonus {
            bonus: 5
            name: "Cloak of Resistance"
        }
    }

    Attribute {
        id: reflex
        Bonus {
            bonus: 4
            name: "Base"
        }
        Bonus {
            bonus: dexterity.abilityMod
            name: "Ability Modifier"
        }
        Bonus {
            bonus: 5
            name: "Cloak of Resistance"
        }
    }

    Attribute {
        id: will
        Bonus {
            bonus: 9
            name: "Base"
        }
        Bonus {
            bonus: wisdom.abilityMod
            name: "Ability Modifier"
        }
        Bonus {
            bonus: 5
            name: "Cloak of Resistance"
        }
    }

    Attribute {
        id: base_attack_bonus
        Bonus {
            bonus: 6
            name: "Witch BAB Progression"
        }
    }
}
