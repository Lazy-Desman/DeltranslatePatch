function draw_text_shadow(argument0, argument1, argument2, argument3) //gml_Script_draw_text_shadow
{
    if (argument3 == undefined)
        argument3 = 1
    __txtcolor__ = draw_get_color()
    draw_set_color(c_black)
    draw_text_transformed((argument0 + 1 * argument3), (argument1 + 1 * argument3), string_hash_to_newline(argument2), argument3, argument3, 0)
    draw_set_color(__txtcolor__)
    draw_text_transformed(argument0, argument1, string_hash_to_newline(argument2), argument3, argument3, 0)
}

