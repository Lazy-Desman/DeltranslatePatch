choice_text[0] = scr_84_get_lang_string("gml_Object_obj_chapter_continue_Create_0_0", "Continue to Chapter 1");
choice_text[1] = scr_84_get_lang_string("gml_Object_obj_chapter_continue_Create_0_1", "Keep Playing Chapter 2");
choice_index = 0;
confirmed_selection = false;
text_alpha = 0;
move_noise = false;
select_noise = false;
base_text_ypos = __view_get(e__VW.YView, 0) + 180;
base_heart_ypos = __view_get(e__VW.YView, 0) + 195;
ypos_offset = 40;
init = 0;
snd_free_all();

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
