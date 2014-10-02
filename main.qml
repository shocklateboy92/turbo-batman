import QtQuick 2.2

import org.lasath.turbo_batman 1.0

TurboBatman {

    // Items
    // Greater Quicken Metamagic Rod
    // Wand of Knock
    // Earrings of Telpathic Bonds


    // Spells
    // 8th
    //  1x Maze
    //  1x Destruction
    //  1x Quickend Power Word Stun
    // 7th
    //  1x Quickened Silence
    // 6th
    //  3x Greater Dispel Magic
    //  2x True Seeing
    // 5th
    //  1x Quickend Dimention Door
    //  1x Break Enchantment
    //  4x Dimention Door

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
            Bonus {
                bonus: 6
                name: "Belt of Physical Might (+6)"
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
            Bonus {
                bonus: 6
                name: "Belt of Physical Might (+6)"
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
            Bonus {
                bonus: 1
                name: "Level 16 Stat Increase"
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
        Condition {
            id: robe_runes
            name: "Robe of Runes"
        }
    }

    AttributeList {
        id: skill_list
        Skill {
            name: "Acrobatics"
            ability: dexterity
        }
        Skill {
            name: "Appraise"
            ability: intelligence
            ranks: 6
        }
        Skill {
            name: "Bluff"
            ability: charistma
        }
        Skill {
            name: "Climb"
            ability: strength
        }
        Skill {
            name: "Craft (Alchemy)"
            ability: intelligence
            ranks: 7
        }
        Skill {
            name: "Diplomacy"
            ability: charistma
            ranks: 2

            Bonus {
                bonus: 4
                name: "Race Bonus (Catfolk)"
            }
        }
        Skill {
            name: "Disable Device"
            ability: dexterity
        }
        Skill {
            name: "Disguise"
            ability: charistma
        }
        Skill {
            name: "Escape Artist"
            ability: dexterity
        }
        Skill {
            name: "Fly"
            ability: dexterity
            ranks: 14
        }
        Skill {
            name: "Handle Animal"
            ability: charistma
            ranks: 14
        }
        Skill {
            name: "Heal"
            ability: wisdom
        }
        Skill {
            name: "Intimidate"
            ability: charistma
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Arcana)"
            ability: intelligence
            class_skill: true
            ranks: level.value
        }
        Skill {
            name: "Knowledge (Dungeoneering)"
            ability: intelligence
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Engineering)"
            ability: intelligence
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Geography)"
            ability: intelligence
            class_skill: true
            ranks: 3
        }
        Skill {
            name: "Knowledge (History)"
            ability: intelligence
            class_skill: true
            ranks: level.value

            Bonus {
                bonus: 2
                name: "Race Bonus (Catfolk)"
            }
        }
        Skill {
            name: "Knowledge (Local)"
            ability: intelligence
            class_skill: true
            ranks: level.value

            Bonus {
                bonus: 2
                name: "Race Bonus (Catfolk)"
            }
        }
        Skill {
            name: "Knowledge (Nature)"
            ability: intelligence
            class_skill: true
            ranks: 9
        }
        Skill {
            name: "Knowledge (Nobility)"
            ability: intelligence
            class_skill: true
            ranks: 2
        }
        Skill {
            name: "Knowledge (Planes)"
            ability: intelligence
            class_skill: true
            ranks: 3
        }
        Skill {
            name: "Knowledge (Religion)"
            ability: intelligence
            class_skill: true
            ranks: level.value
        }
        Skill {
            name: "Linguistics"
            ability: intelligence
            class_skill: true
            ranks: 3
        }
        Skill {
            name: "Perception"
            ability: wisdom
            class_skill: true
            ranks: level.value
        }
        Skill {
            name: "Perform"
            ability: charistma
        }
        Skill {
            name: "Profession"
            ability: wisdom
            class_skill: true
        }
        Skill {
            name: "Ride"
            ability: dexterity
            ranks: 4
        }
        Skill {
            name: "Sense Motive"
            ability: wisdom
            Bonus {
                bonus: 2
                name: "Misc Mod"
            }
        }
        Skill {
            name: "Sleight of Hand"
            ability: dexterity
            ranks: 1
        }
        Skill {
            name: "Spellcraft"
            ability: intelligence
            class_skill: true
            ranks: level.value
        }
        Skill {
            name: "Stealth"
            ability: dexterity
        }
        Skill {
            name: "Survival"
            ability: wisdom
        }
        Skill {
            name: "Swim"
            ability: strength
            ranks: 3
        }
        Skill {
            name: "Use Magic Device"
            ability: charistma
            class_skill: true
            ranks: 11
        }
    }

    Attribute {
        id: initiative
        Bonus {
            bonus: dexterity.mod
            name: "Dexterity Modifier"
        }
        Bonus {
            bonus: 4
            name: "Witch's Familiar (Scropion)"
        }
    }

    Attribute {
        id: hit_points
        Bonus {
            bonus: 6
            name: "Health Roll, Level 1 (6)"
        }
        Bonus {
            bonus: 12 * 5
            name: "Health Rolls, Level 2-13 (5)"
        }
        Bonus {
            bonus: 2
            name: "Health Roll, Level 14 (2)"
        }
        Bonus {
            bonus: 6
            name: "Health Roll, Level 15 (6)"
        }

        Bonus {
            bonus: 1
            name: "Favoured Class, Level 14"
        }
        Bonus {
            bonus: 3
            name: "Health Roll, Level 16 (3)"
        }
        Bonus {
            bonus: 1
            name: "Favoured Class, Level 16"
        }

        Bonus {
            bonus: constitution.mod * level.value
            name: "Constitution Modifier"
        }
    }

    Attribute {
        id: current_hit_points

        Bonus {
            bonus: hit_points.value
            name: "Starting Hit Points (Full)"
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
            bonus: 1
            name: "Armour Bonus (From somewhere)"
        }
        Bonus {
            bonus: 1
            name: "Natural Armour (From somewhere)"
        }
        Bonus {
            bonus: dexterity.mod
            name: "Dexterity Modifier"
        }
        Bonus {
            bonus: 1
            name: "Ring of Protection"
        }
        Bonus {
            bonus: 5
            name: "Braces of Armour +5"
        }
    }

    Save {
        id: fortitude
        ability: constitution
        Bonus {
            bonus: 5
            name: "Cloak of Resistance"
        }
    }

    Save {
        id: reflex
        ability: dexterity
        Bonus {
            bonus: 5
            name: "Cloak of Resistance"
        }
    }

    Save {
        id: will
        ability: wisdom
        primary: true
        Bonus {
            bonus: 5
            name: "Cloak of Resistance"
        }
    }

    Attribute {
        id: base_attack_bonus
        Bonus {
            bonus: level.value / 2
            name: "Witch BAB Progression (Half)"
        }
    }

    Attribute {
        id: level

        Bonus {
            bonus: 16
            name: "Witch"
        }
    }
}
