function scr_itemget_anytype_text()
{
    noroom = 0;
    scr_itemget_anytype(argument[0], argument[1]);
    var itemgetstring = "";
    itemname = "NULL";
    itemtypename = "NULL";
    var _itemtype = argument1;
    var _itemid = argument0;
    
    if (_itemtype == "armor")
    {
        scr_armorinfo(_itemid);
        itemname = scr_item_localized_name_acc(_itemid, 1);
        itemtypename = stringsetloc("ARMORs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_22_0");
    }
    else if (_itemtype == "weapon")
    {
        scr_weaponinfo(_itemid);
        itemname = scr_item_localized_name_acc(_itemid, 2);
        itemtypename = stringsetloc("WEAPONs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_29_0");
    }
    
    if (_itemtype == "item")
    {
        scr_iteminfo(_itemid);
        itemname = scr_item_localized_name_acc(_itemid, 0);
        itemtypename = stringsetloc("ITEMs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_36_0");
        
        if (_pocketed)
            itemtypename = stringsetloc("STORAGE", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_38_0");
    }
    
    if (_itemtype == "key")
    {
        scr_keyiteminfo(_itemid);
        itemname = scr_item_localized_name_acc(_itemid, 3);
        itemtypename = stringsetloc("KEY ITEMs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_44_0");
    }
    
    if (_itemtype == "money")
    {
        noroom = 0;
        global.gold += _itemid;
        itemtypename = stringsetloc("MONEY HOLE", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_51_0");
        itemname = string(_itemid) + get_numeric_str(stringsetloc(" Dark Dollars", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_52_0"), "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_52_0", string(_itemid));
    }
    
    if (_itemtype == "points")
    {
        noroom = 0;
        global.flag[1044] += _itemid;
        
        if (global.flag[1044] > 9999)
            global.flag[1044] = 9999;
        
        itemtypename = stringsetloc("SCORE", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_63_0");
        itemname = string(_itemid) + get_numeric_str(stringsetloc(" POINTs", "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_64_0"), "scr_itemget_anytype_text_slash_scr_itemget_anytype_text_gml_64_0", string(_itemid));
    }
    
    if (noroom == 0)
        itemgetstring = stringsetsubloc("* (\\cY~1\\cW was added to your \\cY~2\\cW.)", itemname, itemtypename, "obj_treasure_room_slash_Other_10_gml_76_0");
    else
        itemgetstring = stringsetsubloc("* (You have too many \\cY~2\\cW to take \\cY~1\\c0.)", itemname, itemtypename, "obj_treasure_room_slash_Other_10_gml_83_0");
    
    if (argument_count >= 3)
        itemgetstring += argument[2];
    else
        itemgetstring += "/%";
    
    return itemgetstring;
}
