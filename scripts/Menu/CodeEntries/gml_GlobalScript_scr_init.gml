function scr_init()
{
}

function create_choice(arg0, arg1) constructor
{
    choice_text = arg0;
    choice_value = arg1;
}

function get_chapter_confirm_sound(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return 1;
            break;
        
        case UnknownEnum.Value_2:
            return 0;
            break;
        
        case UnknownEnum.Value_3:
            return 2;
            break;
        
        case UnknownEnum.Value_4:
            return 4;
            break;
        
        default:
            return 3;
            break;
    }
}

function get_chapter_title(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return scr_get_lang_string("The Beginning", "gml_GlobalScript_scr_init_0");
            break;
        
        case UnknownEnum.Value_2:
            return scr_get_lang_string("A Cyber's World", "gml_GlobalScript_scr_init_1");
            break;
        
        case UnknownEnum.Value_3:
            return scr_get_lang_string("Late Night", "gml_GlobalScript_scr_init_2");
            break;
        
        case UnknownEnum.Value_4:
            return scr_get_lang_string("Prophecy", "gml_GlobalScript_scr_init_3");
            break;
        
        default:
            return scr_get_lang_string("- -", "gml_GlobalScript_scr_init_4");
            break;
    }
}

function get_version()
{
    var version = scr_get_lang_string("v15", "gml_GlobalScript_scr_init_5");
    return version;
}

function get_chapter_icon_index(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return UnknownEnum.Value_1;
            break;
        
        case UnknownEnum.Value_2:
            return UnknownEnum.Value_2;
            break;
        
        case UnknownEnum.Value_3:
            return scr_completed_chapter_any_slot(arg0) ? UnknownEnum.Value_4 : UnknownEnum.Value_3;
            break;
        
        case UnknownEnum.Value_4:
            return UnknownEnum.Value_5;
            break;
        
        default:
            return UnknownEnum.Value_0;
            break;
    }
}

function get_title()
{
    var title = scr_get_lang_string("DELTARUNE", "gml_GlobalScript_scr_init_6");
    return title;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5
}
