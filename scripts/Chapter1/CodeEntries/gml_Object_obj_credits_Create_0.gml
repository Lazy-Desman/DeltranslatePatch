con = 0;
timer = 0;
lyric = " ";
textalpha = 1;
creditalpha = 1;

if (scr_is_switch_os())
    instance_create_depth(0, 0, 0, obj_switchAsyncHelper);

for (i = 0; i < 8; i += 1)
{
    line[i] = " ";
    linecolor[i] = c_white;
}

timings = get_chapter_lang_setting("do_not_forget_timings", [60, 108, 180, 201, 278, 298, 366, 390, 480, 520, 526, 573, 645, 668, 735, 765, 798, 870, 960, 1030, 1033, 1086, 1300, 1560, 1560, 1660, 1680]);
