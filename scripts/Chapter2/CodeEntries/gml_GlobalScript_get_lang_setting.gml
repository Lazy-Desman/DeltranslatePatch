function get_lang_setting(argument0, argument1) //gml_Script_get_lang_setting
{
    var ls = variable_struct_get(global.langs_settings, global.lang)
    if (is_undefined(ls))
        return argument1
    var val = variable_struct_get(ls, argument0)
    if (is_undefined(val))
        return argument1
    return val
}

