function get_numeric_str(argument0, argument1, argument2) //gml_Script_get_numeric_str
{
    if (argument2 == "" || is_undefined(argument2))
        return argument0;
    if (string_length(string_digits(argument2)) == string_length(argument2)) {
        var options = [2, 0, 1, 1, 1, 2];
        var num = (argument2 % 100 > 4 && argument2 % 100 < 20) 
            ? 2 
            : options[(argument2 % 10 < 5) 
                ? argument2 % 10 
                : 5
            ]
        return scr_get_lang_string(argument0, argument1 + "_" + string(num))
    }
    return argument0
}

