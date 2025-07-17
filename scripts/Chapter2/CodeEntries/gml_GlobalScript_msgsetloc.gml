function msgsetloc(argument0, argument1, argument2) //gml_Script_msgsetloc
{
    var msg_index = argument0
    var str = argument1
    var localized_string_id = argument2
    str = scr_get_lang_string(str, localized_string_id)
    msgset(msg_index, str)
}

