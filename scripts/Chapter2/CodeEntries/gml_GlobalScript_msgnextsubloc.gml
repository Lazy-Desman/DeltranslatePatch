var args;
function msgnextsubloc() //gml_Script_msgnextsubloc
{
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var format_string = argument[0]
    var localized_string_id = argument[(len - 1)]
    format_string = scr_get_lang_string(format_string, localized_string_id)
    format_string = get_numeric_str(format_string, localized_string_id, args[1])
    var str = substringargs(format_string, 1, args)
    msgnext(str)
}

