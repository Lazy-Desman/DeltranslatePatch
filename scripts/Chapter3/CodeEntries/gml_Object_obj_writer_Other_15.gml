if (formatted == 0)
{
    draw_set_font(myfont);
    length = string_length(mystring);
    charpos = 0;
    cur_string_width = 0;
    remspace = -1;
    remchar = -1;
    linecount = 0;
    stringmax = 0;
    widthmax = 0;
    aster = 0;
    additional_sprites = [];
    additional_sounds = [];
    
    // if (global.fc == 0)
    // {
    //     charline = originalcharline;
    //     max_string_width = max_string_width_base;
    // } else {
    //     charline = charline_face;
    //     max_string_width = max_string_width_face;
    //      if (global.fc == 22)
    //     {
    //         charline = 30;
    //         max_string_width = 30 * hspace;
    //     }
    // }
    
    for (i = 1; i < (length + 1); i += 1)
    {
        skip = 0;
        thischar = string_char_at(mystring, i);
        
        if (thischar == "`")
        {
            i++;
            thischar = string_char_at(mystring, i);
        }
        else if (thischar == "/" || thischar == "%")
        {
            // if (charpos > -1)
            // {
            //     charpos -= 1;
                
            //     if (get_lang_setting("monospace_fonts", false))
            //         cur_string_width -= hspace;
            //     else
            //         cur_string_width -= (string_width(thischar) * textscale);
            // }
            skip = 1
        }
        else if (thischar == "^")
        {
            // if (charpos > -1)
            // {
            //     if (get_lang_setting("monospace_fonts", false))
            //     {
            //         cur_string_width -= (hspace * 2);
            //     }
            //     else
            //     {
            //         cur_string_width -= (string_width(thischar) * textscale);
            //         cur_string_width -= (string_width(string_char_at(mystring, i + 1)) * textscale);
            //     }
                
            //     charpos -= 2;
            // }
            skip = 1
            i++
        }
        else if (thischar == "\\")
        {
            if (charpos > -1)
                charpos -= 3;
            
            if (dialoguer == 1)
            {
                nextchar = string_char_at(mystring, i + 1);
                nextchar2 = string_char_at(mystring, i + 2);
                
                if (nextchar == "E")
                {
                    __nextface = ord(nextchar2);
                    
                    if (__nextface >= 48 && __nextface <= 57)
                        global.fe = real(nextchar2);
                    else if (__nextface >= 65 && __nextface <= 90)
                        global.fe = __nextface - 55;
                    else if (__nextface >= 97 && __nextface <= 122)
                        global.fe = __nextface - 61;
                }
                
                if (nextchar == "F")
                {
                    if (nextchar2 == "0")
                        global.fc = 0;
                    
                    if (nextchar2 == "S")
                        global.fc = 1;
                    
                    if (nextchar2 == "R")
                        global.fc = 2;
                    
                    if (nextchar2 == "N")
                        global.fc = 3;
                    
                    if (nextchar2 == "T")
                        global.fc = 4;
                    
                    if (nextchar2 == "L")
                        global.fc = 5;
                    
                    if (nextchar2 == "s")
                        global.fc = 6;
                    
                    if (nextchar2 == "U")
                        global.fc = 9;
                    
                    if (nextchar2 == "A")
                        global.fc = 10;
                    
                    if (nextchar2 == "a")
                        global.fc = 11;
                    
                    if (nextchar2 == "B")
                        global.fc = 12;
                    
                    if (nextchar2 == "r")
                        global.fc = 15;
                    
                    if (nextchar2 == "u")
                        global.fc = 18;
                    
                    if (nextchar2 == "K")
                        global.fc = 20;
                    
                    if (nextchar2 == "Q")
                        global.fc = 21;
                    
                    if (global.fc == 0)
                    {
                        charline = originalcharline;
                        max_string_width = max_string_width_base;
                    }
                    else
                    {
                        charline = charline_face;
                        max_string_width = max_string_width_face;
                    }
                }
                
                if (nextchar == "T")
                {
                    if (nextchar2 == "0")
                    {
                        global.typer = 5;
                        
                        if (global.darkzone == 1)
                            global.typer = 6;
                    }
                    
                    if (nextchar2 == "1")
                        global.typer = 2;
                    
                    if (nextchar2 == "A")
                        global.typer = 18;
                    
                    if (nextchar2 == "a")
                        global.typer = 20;
                    
                    if (nextchar2 == "N")
                    {
                        global.typer = 12;
                        
                        if (global.darkzone == 1)
                            global.typer = 56;
                        
                        if (global.fighting == 1)
                            global.typer = 59;
                    }
                    
                    if (nextchar2 == "n")
                        global.typer = 23;
                    
                    if (nextchar2 == "B")
                    {
                        global.typer = 13;
                        
                        if (global.darkzone == 1)
                            global.typer = 57;
                        
                        if (global.fighting == 1)
                            global.typer = 77;
                    }
                    
                    if (nextchar2 == "S")
                    {
                        global.typer = 10;
                        
                        if (global.darkzone == 1)
                        {
                            global.typer = 30;
                            
                            if (global.fighting == 1)
                                global.typer = 47;
                        }
                    }
                    
                    if (nextchar2 == "R")
                    {
                        global.typer = 31;
                        
                        if (global.fighting == 1)
                            global.typer = 45;
                        
                        if (global.flag[30] == 1)
                            global.typer = 6;
                    }
                    
                    if (nextchar2 == "L")
                    {
                        global.typer = 32;
                        
                        if (global.fighting == 1)
                            global.typer = 46;
                    }
                    
                    if (nextchar2 == "X")
                        global.typer = 40;
                    
                    if (nextchar2 == "r")
                        global.typer = 55;
                    
                    if (nextchar2 == "T")
                        global.typer = 7;
                    
                    if (nextchar2 == "J")
                        global.typer = 35;
                    
                    if (nextchar2 == "K")
                    {
                        global.typer = 33;
                        
                        if (global.chapter == 1)
                        {
                            if (global.plot < 235)
                                global.typer = 36;
                        }
                        
                        if (global.fighting == 1)
                            global.typer = 48;
                    }
                    
                    if (nextchar2 == "q")
                        global.typer = 62;
                    
                    if (nextchar2 == "Q")
                        global.typer = 58;
                    
                    if (nextchar2 == "s")
                        global.typer = 14;
                    
                    if (nextchar2 == "U")
                        global.typer = 17;
                    
                    if (nextchar2 == "p")
                    {
                        global.typer = 67;
                        scr_texttype();
                    }
                    
                    scr_texttype();
                    draw_set_font(myfont);
                }
                
                if (nextchar == "m")
                    drawaster = 0;
                
                if (nextchar == "s")
                {
                    if (nextchar2 == "0")
                        skippable = 0;
                }
                
                if (nextchar == "O")
                {
                    var nextchar2var = real(nextchar2);
                    
                    if (global.writerobj[nextchar2var] == obj_funnytext) {
                        charpos += ceil(sprite_get_width(global.writerimg[nextchar2var]) / hspace);
                        cur_string_width += sprite_get_width(global.writerimg[nextchar2var])
                    }
                }
            }
            
            // if (charpos > -1)
            // {
            //     charpos -= 3;
                
            //     if (get_lang_setting("monospace_fonts", false))
            //     {
            //         cur_string_width -= (hspace * 3);
            //     }
            //     else
            //     {
            //         cur_string_width -= string_width(thischar) * textscale;
            //         cur_string_width -= string_width(string_char_at(mystring, i + 1)) * textscale;
            //         cur_string_width -= string_width(string_char_at(mystring, i + 2)) * textscale;
            //     }
            // }

            i += 2
            skip = 1
        }
        else if (thischar == "&" || thischar == "\n")
        {
            stringmax = max(stringmax, charpos);
            widthmax = max(widthmax, cur_string_width)
            
            remspace = -1;
            charpos = 0;
            cur_string_width = 0;
            linecount += 1;
            skip = 1;
            nextchar = string_char_at(mystring, i + 1);
            
            if (aster == 1 && autoaster == 1 && nextchar != "*" && global.lang != "ja")
            {
                // if (flag) {
                //     show_message(string(i) + " " + mystring)
                // }
                charpos = 2;
                cur_string_width += (hspace * 2);
                length += 2;
                mystring = string_insert("||", mystring, i + 1);
                i++;
                // if (flag) {
                //     show_message(string(i) + " " + mystring)
                // }
            }
        } else if (thischar == "{") {
            var nextchar = string_char_at(mystring, i + 1);
            if (nextchar == "I") {
                var ind = -1;
                for (var j = i; j < (length + 1); j++) {
                    if (string_char_at(mystring, j) == "}") {
                        ind = j;
                        break;
                    }
                }
                if (ind == -1) {
                    show_error("Broken string '" + mystring + "'")
                } else {
                    var spr_name = string_copy(mystring, i + 3, ind - i - 3)
                    var spr = scr_84_get_sprite(spr_name)
                    if (spr == -1) {
                        show_error("Bad sprite " + spr_name)
                    }
                    additional_sprites[array_length(additional_sprites)] = [i, spr, 0]
                    mystring = string_delete(mystring, i, ind - i + 1)
                    length = string_length(mystring)
                    charpos += ceil(sprite_get_width(spr) / hspace);
                    cur_string_width += sprite_get_width(spr)
                    i--
                    skip = 1
                }
            } else if (nextchar == "S") {
                var ind = -1;
                for (var j = i; j < (length + 1); j++) {
                    if (string_char_at(mystring, j) == "}") {
                        ind = j;
                        break;
                    }
                }
                if (ind == -1) {
                    show_error("Broken string '" + mystring + "'")
                } else {
                    var snd_name = string_copy(mystring, i + 3, ind - i - 3)
                    var snd = scr_84_get_sound(snd_name)
                    if (snd == -1) {
                        show_error("Bad sound " + snd_name)
                    }
                    additional_sounds[array_length(additional_sounds)] = [i, snd, 0]
                    mystring = string_delete(mystring, i, ind - i + 1)
                    length = string_length(mystring)
                    i--
                    skip = 1
                }
            }
        }
        
        if (skip == 0)
        {
            if (thischar == " ")
            {
                remspace = i;
                remchar = charpos;
            }
            
            if (thischar == "*")
                aster = 1;
            
            if (thischar == " " || thischar == "*" || get_lang_setting("monospace_fonts", false))
                cur_string_width += hspace;
            else
                cur_string_width += string_width(thischar) * textscale;
            
            if ((!limit_by_width && charpos >= charline) || (limit_by_width && cur_string_width >= max_string_width))
            {
                if (remspace > 2)
                {
                    // if (flag) {
                    //     show_message(string(i) + " " + mystring)
                    // }
                    mystring = string_delete(mystring, remspace, 1);
                    mystring = string_insert("&", mystring, remspace);
                    i = remspace + 1;
                    // if (flag) {
                    //     show_message(string(i) + " " + mystring + " " + string(i))
                    // }
                    
                    stringmax = max(stringmax, charpos);
                    widthmax = max(widthmax, cur_string_width)
                    
                    remspace = -1;
                    charpos = 1;
                    cur_string_width = 0;
                    linecount += 1;
                    scr_asterskip();
                }
                else
                {
                    // if (flag) {
                    //     show_message(string(i) + " " + mystring)
                    // }
                    stringmax = max(stringmax, charpos);
                    widthmax = max(widthmax, cur_string_width)
                    
                    mystring = string_insert("&", mystring, i);
                    length += 1;
                    charpos = 1;
                    cur_string_width = 0;
                    remspace = -1;
                    linecount += 1;
                    i += 1;
                    scr_asterskip();
                    // if (flag) {
                    //     show_message(string(i) + " " + mystring)
                    // }
                }
            }
            else
            {
                charpos += 1;
            }
        }
    }
    
    if (autocenter == 1)
    {
        x = ((camerax() + (camerawidth() / 2)) - ((stringmax * hspace) / 2)) + 5;
        y = (cameray() + (cameraheight() / 2)) - ((writingy + ((linecount + 1) * vspace)) / 2) - 10;
    }
    
    stringmax = max(stringmax, charpos);
    widthmax = max(widthmax, cur_string_width)
    
    formatted = 1;
}
