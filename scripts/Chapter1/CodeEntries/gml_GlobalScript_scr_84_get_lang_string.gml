function scr_84_get_lang_string(argument0, argument1) //gml_Script_scr_84_get_lang_string
{
    if (global.special_mode) {
        if (ds_map_find_value(global.lang_map, ("sp_" + argument0)) != undefined)
            return ds_map_find_value(global.lang_map, ("sp_" + argument0))
    }
    if (ds_map_find_value(global.lang_map, argument0) == undefined) {
        if (argument1 != undefined)
            return argument1
        else return ""
        // show_message("No such a string '" + argument0 + "'")
    }
    return ds_map_find_value(global.lang_map, argument0)
}
