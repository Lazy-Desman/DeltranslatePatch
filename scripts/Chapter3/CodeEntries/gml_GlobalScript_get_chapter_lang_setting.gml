function get_chapter_lang_setting(argument0, argument1) //gml_Script_get_chapter_lang_setting
{
    var val = variable_struct_get(global.chapter_lang_settings, argument0)
    var sp_val = variable_struct_get(global.chapter_lang_settings,"sp_" + argument0)
    if (global.special_mode && !is_undefined(sp_val))
        return sp_val
    if (!is_undefined(val))
        return val
    return argument1
}

