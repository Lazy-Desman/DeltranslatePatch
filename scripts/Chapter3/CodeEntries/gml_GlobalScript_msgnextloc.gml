function msgnextloc(argument0, argument1) //gml_Script_msgnextloc
{
    var str = argument0
    var localized_string_id = argument1
    str = scr_get_lang_string(str, localized_string_id)
    msgnext(str)
}

