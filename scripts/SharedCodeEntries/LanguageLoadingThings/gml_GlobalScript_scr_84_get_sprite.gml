function scr_84_get_sprite(argument0) //gml_Script_scr_84_get_sprite
{
    if (global.orig_en) {
        return asset_get_index(argument0)
    }

	var alt_name = scr_letter_fix(argument0), ret = -1;
    if (!global.translated_songs) {
        ret = ds_map_find_value(global.chemg_sprite_map, "spm_" + alt_name)
        if (!is_undefined(ret) && ret != -1)
            return ret
        ret = ds_map_find_value(global.chemg_sprite_map, "spm_" + argument0)
        if (!is_undefined(ret) && ret != -1)
            return ret
    }
    
    if (global.special_mode) {
        ret = ds_map_find_value(global.chemg_sprite_map, "sp_" + alt_name)
        if (!is_undefined(ret) && ret != -1)
            return ret
        ret = ds_map_find_value(global.chemg_sprite_map, "sp_" + argument0)
        if (!is_undefined(ret) && ret != -1)
            return ret
    }

    ret = ds_map_find_value(global.chemg_sprite_map, alt_name);
    if (!is_undefined(ret) && ret != -1)
        return ret
    ret = ds_map_find_value(global.chemg_sprite_map, argument0);
    if (!is_undefined(ret) && ret != -1)
        return ret

    return asset_get_index(argument0)
}

