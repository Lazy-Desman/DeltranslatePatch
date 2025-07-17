function scr_84_name_input_setup()
{
    var menu = 0;
    PLAYERNAMEY = 40;
    menu[0] = stringsetloc("ABCDEFGHIJ", "scr_84_name_input_setup_0_0");
    menu[1] = stringsetloc("KLMNOPQRST", "scr_84_name_input_setup_0_1");
    menu[2] = stringsetloc("UVWXYZ%<%<", "scr_84_name_input_setup_0_2");

    var i = 3
    while (!is_undefined(ds_map_find_value(global.lang_map, "scr_84_name_input_setup_0_" + string(i)))) {
        menu[i] = stringsetloc("", "scr_84_name_input_setup_0_" + string(i));
        i++
    }
    
    var xoff = max(68 - (10 * (string_length(menu[0]) - 10)), 20);
    var yoff = 70;
    var xstep = floor((320 - (xoff * 2)) / (string_length(menu[0]) - 1));
    var ystep = min(20, 160 / array_length(menu));
    
    if (ystep < (string_height(string_char_at(menu[0], 1)) + 1))
    {
        yoff -= 20;
        ystep = min(20, 180 / array_length(menu));
    }
    
    CURX = 0;
    CURY = 0;
    YMAX = array_length(menu) - 1;
    var check = 0;
    
    for (j = 0; j <= YMAX; j += 1)
    {
        var str = menu[j];
        XMAX = string_length(str) - 1;
        
        for (var i = 0; i <= XMAX; i += 1)
        {
            NAME[i][j] = string_char_at(str, i + 1);
            
            if (NAME[i][j] == "%")
            {
                if (check == 0)
                {
                    NAME[i][j] = stringsetloc("(B)BACK", "scr_84_name_input_setup_1_0");
                    check++;
                }
                else if (check == 1)
                {
                    NAME[i][j] = stringsetloc("(E)END", "scr_84_name_input_setup_2_0");
                    check++;
                }
            }
            
            NAMEX[i][j] = xoff + (i * xstep);
            NAMEY[i][j] = yoff + (j * ystep);
        }
    }
    
    HEARTX = (NAMEX[CURX][CURY] + (string_width(NAME[CURX][CURY]) / 2)) - 10;
    HEARTY = NAMEY[CURX][CURY];
}
