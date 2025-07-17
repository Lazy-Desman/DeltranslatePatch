if show_queen
{
    if queen_animate
    {
        queen_siner++
        queen_sprite_index = queen_siner / 3
    }
    else
        queen_sprite_index = 0
    draw_sprite_ext(queen_sprite, queen_sprite_index, (view_wport[0] / 4), queen_y_pos, 1, 1, 0, c_white, queen_alpha)
}
else
{
    var spr_SEP = scr_84_get_sprite("IMAGE_LOGO_CENTER_SEPARATE")
    var draw_timer = 8 * (sprite_get_number(spr_SEP) + 1)
    if (init == 0 && con == 1)
    {
        logopieces = 0
        init = 1
        for (i = 0; i < sprite_get_number(spr_SEP); i++)
            drawlogopart[i] = 0
        con = 2
        logotimer = 0
    }
    if (con == 2)
    {
        logotimer++
        if ((logotimer % 8) == 0 && logotimer < draw_timer)
        {
            snd_play_x(snd_noise, 0.8, (0.5 + random(1)))
            if (logopieces % 2 == 0) {
                drawlogopart[logopieces / 2] = 1
            } else {
                drawlogopart[sprite_get_number(spr_SEP) - (logopieces + 1) /  2] = 1
            }
            logopieces++
        }
        for (i = 0; i < sprite_get_number(spr_SEP); i++)
        {
            if (drawlogopart[i] == 1)
                draw_sprite_ext(spr_SEP, i, 160, 100, 1, 1, 0, c_white, 1)
        }
        if (logotimer == 40 + draw_timer)
            snd_play(snd_queen_laugh_title)
        if (logotimer >= 40 + draw_timer)
        {
            scr_84_set_draw_font("mainbig")
            draw_set_color(c_white)
            draw_text_ext(105, 120, stringsetloc("CHAPTER 2", "gml_Object_obj_intro_ch2_Draw_0_gml_1_0"), 10, 900)
        }
        if (logotimer >= 160 + draw_timer)
            room_goto(PLACE_MENU)
    }
}
