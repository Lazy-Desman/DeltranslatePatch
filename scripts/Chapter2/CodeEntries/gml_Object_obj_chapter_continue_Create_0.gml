var chapter = string(global.chapter);
var next_chapter = string(global.chapter + 1);
choice_text[0] = stringsetsubloc("Continue to Chapter ~1", next_chapter, "obj_chapter_continue_slash_Create_0_gml_1_0");
choice_text[1] = stringsetsubloc("Keep Playing Chapter ~1", chapter, "obj_chapter_continue_slash_Create_0_gml_2_0");
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
