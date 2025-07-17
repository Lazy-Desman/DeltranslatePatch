var fnt;
function scr_get_font(argument0) //gml_Script_scr_get_font
{
    fnt = ds_map_find_value(global.font_map, argument0)
    if (fnt != -1)
        return fnt;
    return asset_get_index(argument0);
}

