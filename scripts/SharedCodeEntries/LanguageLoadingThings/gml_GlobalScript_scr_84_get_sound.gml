function scr_84_get_sound(argument0) //gml_Script_scr_84_get_sound
{
    if (global.orig_en)
        return asset_get_index(argument0)
    
	var alt_name = scr_letter_fix(argument0), ret = -1;
    if (!global.translated_songs && array_includes(global.songs_list, argument0)) {
        return asset_get_index(argument0)
    }
        
    if (global.special_mode) {
        ret = ds_map_find_value(global.chemg_sound_map, "sp_" + alt_name)
        if (!is_undefined(ret))
            return ret
        ret = ds_map_find_value(global.chemg_sound_map, "sp_" + argument0)
        if (!is_undefined(ret))
            return ret
    }
	
	ret = ds_map_find_value(global.chemg_sound_map, alt_name);
    if (!is_undefined(ret))
        return ret	
    ret = ds_map_find_value(global.chemg_sound_map, argument0);
    if (!is_undefined(ret))
        return ret

    return asset_get_index(argument0)
}

