function scr_get_lang_string(argument0, argument1) //gml_Script_scr_get_lang_string
{
    var lang_orig = argument0
    var lang_string_id = argument1
    var str = ds_map_find_value(global.lang_map, lang_string_id)
    if global.special_mode
    {
        if (ds_map_find_value(global.lang_map, ("sp_" + lang_string_id)) != undefined)
            str = ds_map_find_value(global.lang_map, ("sp_" + lang_string_id))
    }
    if is_undefined(str)
        return lang_orig
        // show_error((((("No such a string \"" + lang_string_id) + "\" in ") + global.lang) + " localization file."), 1)
    return str;
}