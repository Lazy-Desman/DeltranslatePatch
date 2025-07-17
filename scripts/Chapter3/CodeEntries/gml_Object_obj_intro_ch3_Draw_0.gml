if (con == 1)
{
    logotimer++;
    draw_sprite_ext(scr_84_get_sprite("IMAGE_LOGO_CENTER"), 0, 160, 100, 1, 1, 0, c_white, 1);
    
    if ((logotimer % 15) == 1)
    {
        if (max_logo_pieces < array_length(logo_piece))
        {
            if (max_logo_pieces == 0)
            {
                snd_stop(snd_tv_static);
                snd_loop(snd_tv_static);
            }
            
            max_logo_pieces++;
        }
        
        if (max_logo_pieces > 1 && revealed_pieces < array_length(logo_piece))
        {
            revealed_pieces++;
            
            if (revealed_pieces == array_length(logo_piece))
                snd_stop(snd_tv_static);
        }
    }
    
    if (logotimer == 190)
        play_cheer();
    
    if (logotimer >= 190)
    {
        draw_set_font(scr_84_get_font("mainbig"));
        draw_set_color(c_white);
        draw_set_halign(fa_center)
        draw_text_ext(camerax() + camerawidth() / 2, cameray() + 120, stringsetloc("CHAPTER 3", "obj_intro_ch3_slash_Draw_0_gml_1_0"), 10, 900);
        scr_84_set_draw_font("mainbig");
        draw_set_halign(fa_left)
    }
    
    if (logotimer == 280)
        fade_out();
    
    if (logotimer == 370)
        exit_screen();
    
    draw_set_alpha(1);
    scr_draw_set_mask(true, true);

    for (var i = revealed_pieces; i < array_length(logo_piece); i++)
    {
        var _xx = logo_piece[i][0];
        var _char_width = logo_piece[i][1];
        var _yy = logo_piece[i][2];
        var _char_height = logo_piece[i][3];
        ossafe_fill_rectangle(_xx, _yy, _xx + _char_width, _yy + _char_height);
    }
    
    scr_draw_in_mask_begin();
    static_anim += 0.4;
    draw_sprite_ext(spr_static_effect, static_anim, 0, 0, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_static_effect, static_anim, 128, 0, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_static_effect, static_anim, 256, 0, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_static_effect, static_anim, 384, 0, 1, 1, 0, c_white, 1);
    // draw_sprite_ext(spr_static_effect, static_anim, 150, 0, 1, 1, 0, c_white, 1);
    scr_draw_in_mask_end();
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_color(c_black);
    
    for (var i = max_logo_pieces; i < array_length(logo_piece); i++)
    {
        var _xx = logo_piece[i][0];
        var _char_width = logo_piece[i][1];
        var _yy = logo_piece[i][2];
        var _char_height = logo_piece[i][3];
        ossafe_fill_rectangle(_xx, _yy, _xx + _char_width, _yy + _char_height);
    }
}

draw_set_alpha(fade_alpha);
ossafe_fill_rectangle(-10, -10, room_width + 10, room_height + 10);
draw_set_alpha(1);
draw_set_color(c_white);
