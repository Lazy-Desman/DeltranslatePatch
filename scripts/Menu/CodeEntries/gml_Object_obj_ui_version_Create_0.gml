_copyright_enabled = false;
_copyright_text = scr_get_lang_string("(C) Toby Fox 2018-2025", "gml_Object_obj_ui_version_Create_0_0");
_version_text = scr_get_lang_string("DELTARUNE ", "gml_Object_obj_ui_version_Create_0_1") + get_version();
_scale = 1;
_alpha = 1;
_font = scr_get_font("fnt_main");

set_screen_state = function(arg0)
{
    if (arg0 == UnknownEnum.Value_4)
        _copyright_enabled = true;
};

set_alpha = function(arg0)
{
    _alpha = arg0;
};

enum UnknownEnum
{
    Value_4 = 4
}
