if (formatted == 0)
{
    monospace_fonts = get_lang_setting("monospace_fonts", false)
    if (is_array(monospace_fonts)) {
        var flag = false
        for (var iii = 0; iii < array_length(monospace_fonts); iii++) {
            if (scr_84_get_font(monospace_fonts[iii]) == myfont) {
                flag = true
                break
            }
        }
        monospace_fonts = flag
    }
    limit_by_width = !monospace_fonts;

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
    wide_pref = 0;
    
    for (i = 1; i < (length + 1); i += 1)
    {
        skip = 0;
        var wide_image = 0;
        thischar = string_char_at(mystring, i);
        
        if (thischar == "`")
        {
            i++;
            thischar = string_char_at(mystring, i);
        }
        else if (thischar == "/" || thischar == "%")
        {
            skip = 1
        }
        else if (thischar == "^")
        {
            skip = 1
            i++
        }
        else if (thischar == "\\")
        {
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
                
                if (nextchar == "M")
                {
                    if (nextchar2 == "0")
                        global.flag[20] = 0;
                    
                    if (nextchar2 == "1")
                        global.flag[20] = 1;
                    
                    if (nextchar2 == "2")
                        global.flag[20] = 2;
                    
                    if (nextchar2 == "3")
                        global.flag[20] = 3;
                    
                    if (nextchar2 == "4")
                        global.flag[20] = 4;
                    
                    if (nextchar2 == "5")
                        global.flag[20] = 5;
                    
                    if (nextchar2 == "6")
                        global.flag[20] = 6;
                    
                    if (nextchar2 == "7")
                        global.flag[20] = 7;
                    
                    if (nextchar2 == "8")
                        global.flag[20] = 8;
                    
                    if (nextchar2 == "9")
                        global.flag[20] = 9;
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
                    
                    if (nextchar2 == "◘")
                        global.fc = 25;
                    
                    if (global.fc == 0)
                    {
                        charline = originalcharline;
                        writingx = x;
                    }
                    else
                    {
                        charline = charline_face;
                        writingx = x + (58 * f);
                    }
                }
                
                if (nextchar == "m") {
                    drawaster = 0;
                    wide_pref = global.wide_pref_size;
                }
                
                if (nextchar == "s")
                {
                    if (nextchar2 == "0")
                        skippable = 0;
                }
            }
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
                charpos = 2;
                cur_string_width += (hspace * 2);
                length += 2;
                mystring = string_insert("||", mystring, i + 1);
                i += 2;
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
            
            if (thischar == " " || thischar == "*" || thischar == "\t" || get_lang_setting("monospace_fonts", false))
                cur_string_width += hspace;
            else
                cur_string_width += string_width(thischar) * textscale;
            charpos += 1;
            
            if (global.typer == 97) {
                charline = 23;
            }
            
            if (i_ex(obj_battlecontroller)) {
                charline = 37;
            }
            
            if (i_ex(obj_battlecontroller) && i_ex(obj_face) && global.fc != 0) {
                charline = 29;
            }
        }
            
        if (!wide_image && ((!limit_by_width && charpos > charline) || (limit_by_width && cur_string_width > charline * hspace)))
        {
            var insert_substr = "&";
            if (wide_pref == 1) {
                insert_substr = "&\t";
            }
            if (wide_pref == 2) {
                insert_substr = "&\t\t";
            }
            if (remspace > 2)
            {
                mystring = string_delete(mystring, remspace, 1);
                mystring = string_insert(insert_substr, mystring, remspace);
                i = remspace + string_length(insert_substr);
                length += string_length(insert_substr) - 1;
                
                stringmax = max(stringmax, charpos);
                widthmax = max(widthmax, cur_string_width)
                
                remspace = -1;
                charpos = string_length(insert_substr);
                cur_string_width = (string_length(insert_substr) - 1) * hspace;
                linecount += 1;
                scr_asterskip();
            }
            else
            {
                stringmax = max(stringmax, charpos);
                widthmax = max(widthmax, cur_string_width)
                
                mystring = string_insert(insert_substr, mystring, i);
                length += string_length(insert_substr);
                charpos = string_length(insert_substr);
                cur_string_width = (string_length(insert_substr) - 1) * hspace;
                remspace = -1;
                linecount += 1;
                i += string_length(insert_substr);
                scr_asterskip();
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
