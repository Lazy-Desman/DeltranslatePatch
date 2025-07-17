function get_lang_setting(argument0, argument1) //gml_Script_get_lang_setting
{
    var ls = ds_map_find_value(global.langs_settings, global.lang)
    if (is_undefined(ls))
        return argument1
    var val = ds_map_find_value(ls, argument0)
    if (is_undefined(val))
        return argument1
    return val
}

