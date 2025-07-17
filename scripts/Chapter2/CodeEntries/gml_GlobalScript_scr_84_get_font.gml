function scr_84_get_font(argument0) //gml_Script_scr_84_get_font
{
    var ret = ds_map_find_value(global.font_map, "fnt_" + argument0);

    if (!is_undefined(ret))
        return ret
    return asset_get_index(argument0)
}

