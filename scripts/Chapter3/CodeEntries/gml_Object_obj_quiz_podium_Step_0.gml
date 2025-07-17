if (init == 0)
{
    init = 1;
    
    if (global.plot >= 80)
    {
        if (name == "ralsei")
            mystring = stringsetloc("RAL", "obj_ch3_GSA02_slash_Step_0_gml_313_0");
        
        if (name == "susie")
            mystring = stringsetloc("ASS", "obj_ch3_GSA02_slash_Step_0_gml_388_0");
        
        if (name == "kris")
            mystring = scr_gameshowname();
        
        if (global.lang == "ja")
        {
            if (name == "ralsei")
                mystring = "ラルセ";
            
            if (name == "susie")
                mystring = "クソダ";
            
            if (name == "kris")
                mystring = scr_gameshowname();
        }
    }
}

if (nameentry == true)
{
    nameentry = false;
    
    if (name == "kris")
    {
        mystring = "";
        entry = instance_create(x, y, obj_gameshow_nameentry);
        entry.mydad = id;
    }
}
