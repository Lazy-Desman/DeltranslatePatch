function scr_asterskip() //gml_Script_scr_asterskip
{
    if (aster == 1 && autoaster == 1)
    {
        length += 2
        mystring = string_insert("||", mystring, i)
        cur_string_width += hspace * 2
        i += 1
    }
    if (aster == 2)
        aster = 1
}

