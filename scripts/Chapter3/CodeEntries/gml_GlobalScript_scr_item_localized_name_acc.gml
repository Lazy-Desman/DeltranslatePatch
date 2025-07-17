function scr_item_localized_name_acc(argument0, argument1, argument2) //gml_Script_scr_item_localized_name_acc
{
    var item = argument0

    // Просто предметы
    if (argument1 == 0 || argument1 == "item")
    switch (item) {
        case 0:
            return " ";
                    
        case 1:
            return stringsetloc(stringsetloc("Dark Candy", "scr_itemnamelist_slash_scr_itemnamelist_gml_8_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_8_1");
                    
        case 2:
            return stringsetloc(stringsetloc("ReviveMint", "scr_itemnamelist_slash_scr_itemnamelist_gml_11_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_11_1");
                    
        case 3:
            return stringsetloc(stringsetloc("Glowshard", "scr_itemnamelist_slash_scr_itemnamelist_gml_14_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_14_1");
                    
        case 4:
            return stringsetloc(stringsetloc("Manual", "scr_itemnamelist_slash_scr_itemnamelist_gml_17_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_17_1");
                    
        case 5:
            return stringsetloc(stringsetloc("BrokenCake", "scr_itemnamelist_slash_scr_itemnamelist_gml_20_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_20_1");
                    
        case 6:
            return stringsetloc(stringsetloc("Top Cake", "scr_itemnamelist_slash_scr_itemnamelist_gml_23_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_23_1");
                    
        case 7:
            return stringsetloc(stringsetloc("SpinCake", "scr_itemnamelist_slash_scr_itemnamelist_gml_26_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_26_1");
                    
        case 8:
            return stringsetloc(stringsetloc("Darkburger", "scr_itemnamelist_slash_scr_itemnamelist_gml_29_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_29_1");
                    
        case 9:
            return stringsetloc(stringsetloc("LancerCookie", "scr_itemnamelist_slash_scr_itemnamelist_gml_32_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_32_1");
                    
        case 10:
            return stringsetloc(stringsetloc("GigaSalad", "scr_itemnamelist_slash_scr_itemnamelist_gml_35_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_35_1");
                    
        case 11:
            return stringsetloc(stringsetloc("Clubswich", "scr_itemnamelist_slash_scr_itemnamelist_gml_38_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_38_1");
                    
        case 12:
            return stringsetloc(stringsetloc("HeartsDonut", "scr_itemnamelist_slash_scr_itemnamelist_gml_41_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_41_1");
                    
        case 13:
            return stringsetloc(stringsetloc("ChocDiamond", "scr_itemnamelist_slash_scr_itemnamelist_gml_44_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_44_1");
                    
        case 14:
            return stringsetloc(stringsetloc("FavSandwich", "scr_itemnamelist_slash_scr_itemnamelist_gml_47_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_47_1");
                    
        case 15:
            return stringsetloc(stringsetloc("RouxlsRoux", "scr_itemnamelist_slash_scr_itemnamelist_gml_50_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_50_1");
                    
        case 16:
            return stringsetloc(stringsetloc("CD Bagel", "scr_itemnamelist_slash_scr_itemnamelist_gml_53_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_53_1");
                    
        case 17:
            return stringsetloc(stringsetloc("Mannequin", "scr_itemnamelist_slash_scr_itemnamelist_gml_56_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_56_1");
                    
        case 18:
            return stringsetloc(stringsetloc("RottenTea", "scr_text_slash_scr_text_gml_10542_0"), "scr_text_slash_scr_text_gml_10542_1");
                    
        case 19:
            return stringsetloc(stringsetloc("RottenTea", "scr_text_slash_scr_text_gml_10542_0"), "scr_text_slash_scr_text_gml_10542_1");
                    
        case 20:
            return stringsetloc(stringsetloc("RottenTea", "scr_text_slash_scr_text_gml_10542_0"), "scr_text_slash_scr_text_gml_10542_1");
                    
        case 21:
            return stringsetloc(stringsetloc("RottenTea", "scr_text_slash_scr_text_gml_10542_0"), "scr_text_slash_scr_text_gml_10542_1");
                    
        case 22:
            return stringsetloc(stringsetloc("DD-Burger", "scr_itemnamelist_slash_scr_itemnamelist_gml_71_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_71_1");
                    
        case 23:
            return stringsetloc(stringsetloc("LightCandy", "scr_itemnamelist_slash_scr_itemnamelist_gml_74_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_74_1");
                    
        case 24:
            return stringsetloc(stringsetloc("ButJuice", "scr_itemnamelist_slash_scr_itemnamelist_gml_77_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_77_1");
                    
        case 25:
            return stringsetloc(stringsetloc("SpagettiCode", "scr_itemnamelist_slash_scr_itemnamelist_gml_80_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_80_1");
                    
        case 26:
            return stringsetloc(stringsetloc("JavaCookie", "scr_itemnamelist_slash_scr_itemnamelist_gml_83_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_83_1");
                    
        case 27:
            return stringsetloc(stringsetloc("TensionBit", "scr_itemnamelist_slash_scr_itemnamelist_gml_86_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_86_1");
                    
        case 28:
            return stringsetloc(stringsetloc("TensionGem", "scr_itemnamelist_slash_scr_itemnamelist_gml_89_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_89_1");
                    
        case 29:
            return stringsetloc(stringsetloc("TensionMax", "scr_itemnamelist_slash_scr_itemnamelist_gml_92_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_92_1");
                    
        case 30:
            return stringsetloc(stringsetloc("ReviveDust", "scr_itemnamelist_slash_scr_itemnamelist_gml_95_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_95_1");
                    
        case 31:
            return stringsetloc(stringsetloc("ReviveBrite", "scr_itemnamelist_slash_scr_itemnamelist_gml_98_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_98_1");
                    
        case 32:
            return stringsetloc(stringsetloc("S.POISON", "scr_itemnamelist_slash_scr_itemnamelist_gml_101_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_101_1");
                    
        case 33:
            return stringsetloc(stringsetloc("DogDollar", "scr_itemnamelist_slash_scr_itemnamelist_gml_104_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_104_1");
                    
        case 34:
            return stringsetloc(stringsetloc("TVDinner", "scr_itemnamelist_slash_scr_itemnamelist_gml_108_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_108_1");
                    
        case 35:
            return stringsetloc(stringsetloc("Pipis", "scr_itemnamelist_slash_scr_itemnamelist_gml_111_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_111_1");
                    
        case 36:
            return stringsetloc(stringsetloc("FlatSoda", "scr_itemnamelist_slash_scr_itemnamelist_gml_114_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_114_1");
                    
        case 37:
            return stringsetloc(stringsetloc("TVSlop", "scr_itemnamelist_slash_scr_itemnamelist_gml_117_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_117_1");
                    
        case 38:
            return stringsetloc(stringsetloc("ExecBuffet", "scr_itemnamelist_slash_scr_itemnamelist_gml_120_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_120_1");
                    
        case 39:
            return stringsetloc(stringsetloc("DeluxeDinner", "scr_itemnamelist_slash_scr_itemnamelist_gml_123_0"), "scr_itemnamelist_slash_scr_itemnamelist_gml_123_1");
            
    }

    // Броня
    if (argument1 == 1)
    switch item {
        case 0:
            return " "
            
        case 1:
            return stringsetloc(stringsetloc("Amber Card", "scr_armorinfo_slash_scr_armorinfo_gml_28_0"), "scr_armorinfo_slash_scr_armorinfo_gml_28_1");
        
        case 2:
            return stringsetloc(stringsetloc("Dice Brace", "scr_armorinfo_slash_scr_armorinfo_gml_49_0"), "scr_armorinfo_slash_scr_armorinfo_gml_49_1");
        
        case 3:
            return stringsetloc(stringsetloc("Pink Ribbon", "scr_armorinfo_slash_scr_armorinfo_gml_70_0"), "scr_armorinfo_slash_scr_armorinfo_gml_70_1");
        
        case 4:
            return stringsetloc(stringsetloc("White Ribbon", "scr_armorinfo_slash_scr_armorinfo_gml_98_0"), "scr_armorinfo_slash_scr_armorinfo_gml_98_1");
        
        case 5:
            return stringsetloc(stringsetloc("IronShackle", "scr_armorinfo_slash_scr_armorinfo_gml_125_0"), "scr_armorinfo_slash_scr_armorinfo_gml_125_1");
        
        case 6:
            return stringsetloc(stringsetloc("MouseToken", "scr_armorinfo_slash_scr_armorinfo_gml_146_0"), "scr_armorinfo_slash_scr_armorinfo_gml_146_1");
        
        case 7:
            return stringsetloc(stringsetloc("Jevilstail", "scr_armorinfo_slash_scr_armorinfo_gml_167_0"), "scr_armorinfo_slash_scr_armorinfo_gml_167_1");
        
        case 8:
            return stringsetloc(stringsetloc("Silver Card", "scr_armorinfo_slash_scr_armorinfo_gml_189_0"), "scr_armorinfo_slash_scr_armorinfo_gml_189_1");
        
        case 9:
            return stringsetloc(stringsetloc("TwinRibbon", "scr_armorinfo_slash_scr_armorinfo_gml_210_0"), "scr_armorinfo_slash_scr_armorinfo_gml_210_1");
        
        case 10:
            return stringsetloc(stringsetloc("GlowWrist", "scr_armorinfo_slash_scr_armorinfo_gml_232_0"), "scr_armorinfo_slash_scr_armorinfo_gml_232_1");
        
        case 11:
            return stringsetloc(stringsetloc("ChainMail", "scr_armorinfo_slash_scr_armorinfo_gml_254_0"), "scr_armorinfo_slash_scr_armorinfo_gml_254_1");
        
        case 12:
            return stringsetloc(stringsetloc("B.ShotBowtie", "scr_armorinfo_slash_scr_armorinfo_gml_276_0"), "scr_armorinfo_slash_scr_armorinfo_gml_276_1");
        
        case 13:
            return stringsetloc(stringsetloc("SpikeBand", "scr_armorinfo_slash_scr_armorinfo_gml_298_0"), "scr_armorinfo_slash_scr_armorinfo_gml_298_1");
        
        case 14:
            return stringsetloc(stringsetloc("Silver Watch", "scr_armorinfo_slash_scr_armorinfo_gml_320_0"), "scr_armorinfo_slash_scr_armorinfo_gml_320_1");
        
        case 15:
            return stringsetloc(stringsetloc("TensionBow", "scr_armorinfo_slash_scr_armorinfo_gml_342_0"), "scr_armorinfo_slash_scr_armorinfo_gml_342_1");
        
        case 16:
            return stringsetloc(stringsetloc("Mannequin", "scr_armorinfo_slash_scr_armorinfo_gml_364_0"), "scr_armorinfo_slash_scr_armorinfo_gml_364_1");
        
        case 17:
            return stringsetloc(stringsetloc("DarkGoldBand", "scr_armorinfo_slash_scr_armorinfo_gml_386_0"), "scr_armorinfo_slash_scr_armorinfo_gml_386_1");
        
        case 18:
            return stringsetloc(stringsetloc("SkyMantle", "scr_armorinfo_slash_scr_armorinfo_gml_408_0"), "scr_armorinfo_slash_scr_armorinfo_gml_408_1");
        
        case 19:
            return stringsetloc(stringsetloc("SpikeShackle", "scr_armorinfo_slash_scr_armorinfo_gml_430_0"), "scr_armorinfo_slash_scr_armorinfo_gml_430_1");
        
        case 20:
            return stringsetloc(stringsetloc("FrayedBowtie", "scr_armorinfo_slash_scr_armorinfo_gml_452_0"), "scr_armorinfo_slash_scr_armorinfo_gml_452_1");
        
        case 21:
            return stringsetloc(stringsetloc("Dealmaker", "scr_armorinfo_slash_scr_armorinfo_gml_491_0"), "scr_armorinfo_slash_scr_armorinfo_gml_491_1");
        
        case 22:
            return stringsetloc(stringsetloc("RoyalPin", "scr_armorinfo_slash_scr_armorinfo_gml_516_0"), "scr_armorinfo_slash_scr_armorinfo_gml_516_1");
        
        case 23:
            return stringsetloc(stringsetloc("ShadowMantle", "scr_armorinfo_slash_scr_armorinfo_gml_538_0"), "scr_armorinfo_slash_scr_armorinfo_gml_538_1");
        
        case 24:
            return stringsetloc(stringsetloc("LodeStone", "scr_armorinfo_slash_scr_armorinfo_gml_564_0"), "scr_armorinfo_slash_scr_armorinfo_gml_564_1");
        
        case 25:
            return stringsetloc(stringsetloc("GingerGuard", "scr_armorinfo_slash_scr_armorinfo_gml_621_0"), "scr_armorinfo_slash_scr_armorinfo_gml_621_1");
        
        case 26:
            return stringsetloc(stringsetloc("BlueRibbon", "scr_armorinfo_slash_scr_armorinfo_gml_643_0"), "scr_armorinfo_slash_scr_armorinfo_gml_643_1");
        
        case 27:
            return stringsetloc(stringsetloc("TennaTie", "scr_armorinfo_slash_scr_armorinfo_gml_682_0"), "scr_armorinfo_slash_scr_armorinfo_gml_682_1");

    }

    // Оружие
    if (argument1 == 2)
    switch item {
        case 0:
            return " "

        case 1:
            return stringsetloc(stringsetloc("Wood Blade", "scr_weaponinfo_slash_scr_weaponinfo_gml_33_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_33_1");
        
        case 2:
            return stringsetloc(stringsetloc("Mane Ax", "scr_weaponinfo_slash_scr_weaponinfo_gml_59_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_59_1");
        
        case 3:
            return stringsetloc(stringsetloc("Red Scarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_81_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_81_1");
        
        case 4:
            return stringsetloc(stringsetloc("EverybodyWeapon", "scr_weaponinfo_slash_scr_weaponinfo_gml_105_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_105_1");
        
        case 5:
            return stringsetloc(stringsetloc("Spookysword", "scr_weaponinfo_slash_scr_weaponinfo_gml_127_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_127_1");
        
        case 6:
            return stringsetloc(stringsetloc("Brave Ax", "scr_weaponinfo_slash_scr_weaponinfo_gml_149_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_149_1");
        
        case 7:
            return stringsetloc(stringsetloc("Devilsknife", "scr_weaponinfo_slash_scr_weaponinfo_gml_171_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_171_1");
        
        case 8:
            return stringsetloc(stringsetloc("Trefoil", "scr_weaponinfo_slash_scr_weaponinfo_gml_194_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_194_1");
        
        case 9:
            return stringsetloc(stringsetloc("Ragger", "scr_weaponinfo_slash_scr_weaponinfo_gml_215_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_215_1");
        
        case 10:
            return stringsetloc(stringsetloc("DaintyScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_237_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_237_1");
        
        case 11:
            return stringsetloc(stringsetloc("TwistedSwd", "scr_weaponinfo_slash_scr_weaponinfo_gml_260_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_260_1");
        
        case 12:
            return stringsetloc(stringsetloc("SnowRing", "scr_weaponinfo_slash_scr_weaponinfo_gml_282_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_282_1");
        
        case 13:
            return stringsetloc(stringsetloc("ThornRing", "scr_weaponinfo_slash_scr_weaponinfo_gml_305_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_305_1");
        
        case 14:
            return stringsetloc(stringsetloc("BounceBlade", "scr_weaponinfo_slash_scr_weaponinfo_gml_328_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_328_1");
        
        case 15:
            return stringsetloc(stringsetloc("CheerScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_351_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_351_1");
        
        case 16:
            return stringsetloc(stringsetloc("MechaSaber", "scr_weaponinfo_slash_scr_weaponinfo_gml_374_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_374_1");
        
        case 17:
            return stringsetloc(stringsetloc("AutoAxe", "scr_weaponinfo_slash_scr_weaponinfo_gml_397_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_397_1");
        
        case 18:
            return stringsetloc(stringsetloc("FiberScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_420_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_420_1");
        
        case 19:
            return stringsetloc(stringsetloc("Ragger2", "scr_weaponinfo_slash_scr_weaponinfo_gml_443_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_443_1");
        
        case 20:
            return stringsetloc(stringsetloc("BrokenSwd", "scr_weaponinfo_slash_scr_weaponinfo_gml_467_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_467_1");
        
        case 21:
            return stringsetloc(stringsetloc("PuppetScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_490_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_490_1");
        
        case 22:
            return stringsetloc(stringsetloc("FreezeRing", "scr_weaponinfo_slash_scr_weaponinfo_gml_513_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_513_1");
        
        case 23:
            return stringsetloc(stringsetloc("Saber10", "scr_weaponinfo_slash_scr_weaponinfo_gml_537_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_537_1");
        
        case 24:
            return stringsetloc(stringsetloc("ToxicAxe", "scr_weaponinfo_slash_scr_weaponinfo_gml_560_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_560_1");
        
        case 25:
            return stringsetloc(stringsetloc("FlexScarf", "scr_weaponinfo_slash_scr_weaponinfo_gml_583_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_583_1");
        
        case 26:
            return stringsetloc(stringsetloc("BlackShard", "scr_weaponinfo_slash_scr_weaponinfo_gml_606_0"), "scr_weaponinfo_slash_scr_weaponinfo_gml_606_1");

    }

    // Ключевые предметы
    if (argument1 == 3)
    switch item {
        case 0:
            return " "
        
        case 1:
            return stringsetloc(stringsetloc("Cell Phone", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_14_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_14_1");
        
        case 2:
            return stringsetloc(stringsetloc("Egg", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_19_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_19_1");
        
        case 3:
            return stringsetloc(stringsetloc("BrokenCake", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_24_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_24_1");
        
        case 4:
            return stringsetloc(stringsetloc("Broken Key A", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_28_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_28_1");
        
        case 5:
            return stringsetloc(stringsetloc("Door Key", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_32_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_32_1");
        
        case 6:
            return stringsetloc(stringsetloc("Broken Key B", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_36_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_36_1");
        
        case 7:
            return stringsetloc(stringsetloc("Broken Key C", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_40_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_40_1");
        
        case 8:
            return stringsetloc(stringsetloc("Lancer", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_48_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_48_1");
        
        case 9:
            return stringsetloc(stringsetloc("Rouxls Kaard", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_53_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_53_1");
        
        case 10:
            return stringsetloc(stringsetloc("EmptyDisk", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_57_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_57_1");
        
        case 11:
            return stringsetloc(stringsetloc("LoadedDisk", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_61_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_61_1");
        
        case 12:
            return stringsetloc(stringsetloc("KeyGen", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_65_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_65_1");
        
        case 13:
            return stringsetloc(stringsetloc("ShadowCrystal", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_71_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_71_1");
        
        case 14:
            return stringsetloc(stringsetloc("Starwalker", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_123_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_123_1");
        
        case 15:
            return stringsetloc(stringsetloc("PureCrystal", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_132_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_132_1");
        
        case 16:
            return stringsetloc(stringsetloc("OddController", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_158_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_158_1");
        
        case 17:
            return stringsetloc(stringsetloc("BackstagePass", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_162_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_162_1");
        
        case 18:
            return stringsetloc(stringsetloc("TripTicket", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_166_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_166_1");

        case 19:
            if (global.flag[1099] > 1) {
                return stringsetsubloc(stringsetsubloc("LancerConX~1", string(global.flag[1099]), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_189_0"), string(global.flag[1099]), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_189_1");
            } else { 
                return stringsetloc(stringsetloc("LancerCon", "scr_keyiteminfo_slash_scr_keyiteminfo_gml_185_0"), "scr_keyiteminfo_slash_scr_keyiteminfo_gml_185_1");
            }
    }

    // Светлый мир
    if (argument1 == 4)
    switch item {
        case 0:
            return " "
        case 1:
            return stringsetloc(stringsetloc("Hot Chocolate", "scr_litemname_slash_scr_litemname_gml_6_0"), "scr_litemname_slash_scr_litemname_gml_6_1")
        case 2:
            return stringsetloc(stringsetloc("Pencil", "scr_litemname_slash_scr_litemname_gml_7_0"), "scr_litemname_slash_scr_litemname_gml_7_1")
        case 3:
            return stringsetloc(stringsetloc("Bandage", "scr_litemname_slash_scr_litemname_gml_8_0"), "scr_litemname_slash_scr_litemname_gml_8_1")
        case 4:
            return stringsetloc(stringsetloc("Bouquet", "scr_litemname_slash_scr_litemname_gml_9_0"), "scr_litemname_slash_scr_litemname_gml_9_1")
        case 5:
            return stringsetloc(stringsetloc("Ball of Junk", "scr_litemname_slash_scr_litemname_gml_10_0"), "scr_litemname_slash_scr_litemname_gml_10_1")
        case 6:
            return stringsetloc(stringsetloc("Halloween Pencil", "scr_litemname_slash_scr_litemname_gml_11_0"), "scr_litemname_slash_scr_litemname_gml_11_1")
        case 7:
            return stringsetloc(stringsetloc("Lucky Pencil", "scr_litemname_slash_scr_litemname_gml_12_0"), "scr_litemname_slash_scr_litemname_gml_12_1")
        case 8:
            return stringsetloc(stringsetloc("Egg", "scr_litemname_slash_scr_litemname_gml_13_0"), "scr_litemname_slash_scr_litemname_gml_13_1")
        case 9:
            return stringsetloc(stringsetloc("Cards", "scr_litemname_slash_scr_litemname_gml_14_0"), "scr_litemname_slash_scr_litemname_gml_14_1")
        case 10:
            return stringsetloc(stringsetloc("Box of Heart Candy", "scr_litemname_slash_scr_litemname_gml_15_0"), "scr_litemname_slash_scr_litemname_gml_15_1")
        case 11:
            return stringsetloc(stringsetloc("Glass", "scr_litemname_slash_scr_litemname_gml_16_0"), "scr_litemname_slash_scr_litemname_gml_16_1")
        case 12:
            return stringsetloc(stringsetloc("Eraser", "scr_litemname_slash_scr_litemname_gml_17_0"), "scr_litemname_slash_scr_litemname_gml_17_1")
        case 13:
            return stringsetloc(stringsetloc("Mech. Pencil", "scr_litemname_slash_scr_litemname_gml_18_0"), "scr_litemname_slash_scr_litemname_gml_18_1")
        case 14:
            return stringsetloc(stringsetloc("Wristwatch", "scr_litemname_slash_scr_litemname_gml_19_0"), "scr_litemname_slash_scr_litemname_gml_19_1")
    }

    if (argument2 != undefined)
        return argument2
    return item
}