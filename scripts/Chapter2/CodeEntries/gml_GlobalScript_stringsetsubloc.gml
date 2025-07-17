var args;
function stringsetsubloc() //gml_Script_stringsetsubloc
{
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var format_string = argument[0]
    var localized_format_string_id = argument[(len - 1)]
    format_string = scr_get_lang_string(format_string, localized_format_string_id)
    format_string = get_numeric_str(format_string, localized_format_string_id, args[1])
    var str = substringargs(format_string, 1, args)
    return stringset(str);
}

