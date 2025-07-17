function scr_item_localized_name_acc(argument0, argument1) //gml_Script_scr_item_localized_name_acc
{
    var item = argument0

    // Просто предметы
    if (argument1 == 0)
    switch (item) {
        case 1:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_8_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_8_0"))
        case 2:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_11_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_11_0"))
        case 3:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_14_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_14_0"))
        case 4:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_17_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_17_0"))
        case 5:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_20_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_20_0"))
        case 6:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_23_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_23_0"))
        case 7:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_26_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_26_0"))
        case 8:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_29_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_29_0"))
        case 9:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_32_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_32_0"))
        case 10:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_35_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_35_0"))
        case 11:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_38_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_38_0"))
        case 12:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_41_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_41_0"))
        case 13:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_44_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_44_0"))
        case 14:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_47_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_47_0"))
        case 15:
            return scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_50_1", scr_84_get_lang_string("scr_itemnamelist_slash_scr_itemnamelist_gml_50_0"))
    }

    // Броня
    if (argument1 == 1)
    switch item {
        case 0:
            return " "
        case 1:
            return scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_26_1", scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_26_0")) // Amber Card
        case 2:
            return scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_46_1", scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_46_0")) // Dice Brace
        case 3:
            return scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_66_1", scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_66_0")) // Pink Ribbon
        case 4:
            return scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_87_1", scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_87_0")) // White Ribbon
        case 5:
            return scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_108_1", scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_108_0")) // IronShackle
        case 6:
            return scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_128_1", scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_128_0")) // MouseToken
        case 7:
            return scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_148_1", scr_84_get_lang_string("scr_armorinfo_slash_scr_armorinfo_gml_148_0")) // Jevilstail
    }

    // Оружие
    if (argument1 == 2)
    switch item {
        case 0:
            return " "
        case 1:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_29_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_29_0")) // Wood Blade
        case 2:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_54_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_54_0")) // Mane Ax
        case 3:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_75_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_75_0")) // Red Scarf
        case 4:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_97_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_97_0")) // EverybodyWeapon
        case 5:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_118_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_118_0")) // Spookysword
        case 6:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_139_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_139_0")) // Brave Ax
        case 7:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_160_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_160_0")) // Devilsknife
        case 8:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_181_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_181_0")) // Trefoil
        case 9:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_202_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_202_0")) // Ragger
        case 10:
            return scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_223_1", scr_84_get_lang_string("scr_weaponinfo_slash_scr_weaponinfo_gml_223_0")) // DaintyScarf
    }

    // Ключевые предметы
    if (argument1 == 3)
    switch item {
        case 0:
            return " "
        case 1:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_14_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_14_0")) // Cell Phone
        case 2:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_19_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_19_0")) // Egg
        case 3:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_24_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_24_0")) // BrokenCake
        case 4:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_28_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_28_0")) // Broken Key A
        case 5:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_32_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_32_0")) // Door Key
        case 6:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_36_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_36_0")) // Broken Key B
        case 7:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_40_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_40_0")) // Broken Key C
        case 13:
            return scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_42_1", scr_84_get_lang_string("scr_keyiteminfo_slash_scr_keyiteminfo_gml_42_0")) // ShadowCrystal
    }

    // Светлый мир
    if (argument1 == 4)
    switch item {
        case 0:
            return " "
        case 1:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_6_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_6_0")) // Hot Chocolate
        case 2:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_7_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_7_0")) // Pencil
        case 3:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_8_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_8_0")) // Bandage
        case 4:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_9_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_9_0")) // Bouquet
        case 5:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_10_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_10_0")) // Ball of Junk
        case 6:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_11_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_11_0")) // Halloween Pencil
        case 7:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_12_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_12_0")) // Lucky Pencil
        case 8:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_13_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_13_0")) // Egg
        case 11:
            return scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_14_1", scr_84_get_lang_string("scr_litemname_slash_scr_litemname_gml_14_0")) // Glass
    }

    return item
}