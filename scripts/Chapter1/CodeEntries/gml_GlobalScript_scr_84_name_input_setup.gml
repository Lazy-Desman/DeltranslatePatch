function scr_84_name_input_setup() //gml_Script_scr_84_name_input_setup
{
    var menu = 0
    PLAYERNAMEY = 40
    menu[0] = scr_84_get_lang_string("scr_84_name_input_setup_0_0", "ABCDEFGHIJ")
    menu[1] = scr_84_get_lang_string("scr_84_name_input_setup_0_1", "KLMNOPQRST")
    menu[2] = scr_84_get_lang_string("scr_84_name_input_setup_0_2", "UVWXYZ%<%<")
    var i = 3
    while (scr_84_get_lang_string("scr_84_name_input_setup_0_" + string(i), "") != "") {
        menu[i] = scr_84_get_lang_string("scr_84_name_input_setup_0_" + string(i))
        i++
    }
    var xoff = max((68 - (10 * (string_length(menu[0]) - 10))), 20)
    var yoff = 70
    var xstep = floor(((320 - (xoff * 2)) / (string_length(menu[0]) - 1)))
    var ystep = min(20, 20 * 8 / array_length(menu))
    if (ystep < string_height(string_char_at(menu[0], 1)) + 1) {
        yoff -= 10
        ystep = min(20, 20 * 9 / array_length(menu))
    }
    CURX = 0
    CURY = 0
    YMAX = (array_length(menu) - 1)
    var check = 0
    for (j = 0; j <= YMAX; j += 1)
    {
        var str = menu[j]
        XMAX = (string_length(str) - 1)
        for (i = 0; i <= XMAX; i += 1)
        {
            NAME[i][j] = string_char_at(str, (i + 1))
            if (NAME[i][j] == "%")
            {
                if (check == 0)
                {
                    NAME[i][j] = scr_84_get_lang_string("scr_84_name_input_setup_1_0", "(B)BACK")
                    check++
                }
                else if (check == 1)
                {
                    NAME[i][j] = scr_84_get_lang_string("scr_84_name_input_setup_2_0", "(E)END")
                    check++
                }
            }
            NAMEX[i][j] = (xoff + (i * xstep))
            NAMEY[i][j] = (yoff + (j * ystep))
        }
    }
    HEARTX = ((NAMEX[CURX][CURY] + (string_width(NAME[CURX][CURY]) / 2)) - 10)
    HEARTY = NAMEY[CURX][CURY]
}