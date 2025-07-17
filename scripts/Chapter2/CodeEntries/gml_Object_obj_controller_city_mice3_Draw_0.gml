if (solve != 2)
{
    draw_sprite_ext(scr_84_get_sprite("spr_mice3_progressBar"), 0, 326, 164, 2, 2, 0, c_white, 1)
    scr_84_set_draw_font("main")
    if (micescore < micetarget)
        draw_set_color(c_white)
    else
        draw_set_color(c_lime)
    language = 0
    var str = stringsetloc("ILOVEMOUSE", "obj_controller_city_mice3_slash_Draw_0_gml_18_0")
    draw_set_halign(fa_left)
    draw_text_transformed(342, 173, string_copy(str, 1, micescore), 2, 2, 0)
    draw_set_color(c_red)
    
    draw_set_halign(fa_right)
    var w = string_width(string_copy(str, micescore + 1, micetarget - micescore)) / (max(1, micetarget - micescore)) * 2
    var l = 0
    for (var i = micetarget - 1; i >= micescore; i--) {
        draw_text_transformed(342 + string_width(str) * 2 - l, 173, "?", 2, 2, 0)
        l += w
    }
    draw_set_halign(fa_left)
}
draw_set_color(c_white)
draw_set_halign(fa_left)
if (weird == true)
{
    if (drawshine == true)
    {
        draw_sprite_ext(spr_mouseHole, 0, 200, 240, 2, 2, 0, c_white, 1)
        shineindex += 0.25
        draw_sprite_ext(spr_shine, shineindex, 215, 270, 2, 2, 0, c_white, 1)
    }
}