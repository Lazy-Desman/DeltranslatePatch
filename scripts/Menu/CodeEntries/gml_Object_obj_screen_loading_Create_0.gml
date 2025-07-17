_target_chapter = -1;
_init = false;
_callback = -4;
_initialize_text = "";
_font = 4;

show_loading_screen = function(arg0, arg1)
{
    _target_chapter = arg0;
    _callback = arg1;
    _initialize_text = get_text(_target_chapter);
    _font = get_font();
    _init = true;
    alarm[0] = 1;
};

get_text = function(arg0)
{
    var _text = string(scr_get_lang_string("INITIALIZING\nCHAPTER {0}", "gml_Object_obj_screen_loading_Create_0_0"), string(arg0));

    if (arg0 == 0)
    {
        _text = scr_get_lang_string("LOADING\nCHAPTER\nSELECT", "gml_Object_obj_screen_loading_Create_0_1");
    }
    
    return _text;
};

get_font = function()
{
    return scr_get_font("fnt_mainbig");
};
