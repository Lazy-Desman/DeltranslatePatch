if (i_ex(obj_chefs_game) && obj_chefs_game.gameover)
    con = 2;

if (i_ex(obj_chefs_game) && obj_chefs_game.timer < 3)
    con = 2;

if (con == 1 && image_alpha < 1)
    image_alpha += 0.1;

if (con == 2)
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (!i_ex(obj_gameover_minigame))
{
    var _x = camerax() + 634;
    var _y = cameray() + 416;
    var _y2 = cameray() + 446;
    var _string3 = stringsetsubloc("Throw ~1    Jump ~2", scr_get_input_name(4), scr_get_input_name(5), "obj_chef_controls_ui_slash_Draw_0_gml_19_0");
    var _string4 = stringsetloc("@ : Throw     @ : Jump", "obj_chef_controls_ui_slash_Draw_0_gml_20_0");
    draw_set_halign(fa_right);
    draw_set_color(c_white);
    scr_84_set_draw_font("mainbig");
    draw_set_alpha(image_alpha);
    
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        var _xx = 0;
        
        if (global.lang == "ja")
            _xx = 55;

        var button_x1 = _x - string_width(_string4) - string_width("@") / 2;
        var button_x2 = _x - string_width(_string4) - string_width("@") / 2;
        var flag = 1;
        
        for (i = 0; i < string_length(_string4); i++)
        {
            if (string_char_at(_string4, i + 1) == "@")
            {
                if (flag)
                    flag = 0;
                else
                    break;
            }
            
            button_x1 += (string_width(string_char_at(_string4, i + 1)) * flag);
            button_x2 += string_width(string_char_at(_string4, i + 1));
        }
        
        draw_set_colour(c_black);
        draw_text_transformed(_x - 1, _y2 - 1, _string4, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 - 1, _string4, 1, 1, 0);
        draw_text_transformed(_x - 1, _y2 + 1, _string4, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 + 1, _string4, 1, 1, 0);
        draw_set_colour(c_white);
        draw_text_transformed(_x, _y2, _string4, 1, 1, 0);
        var xSpr = scr_getbuttonsprite(global.input_g[4], false);
        draw_sprite_ext(xSpr, 0, button_x1, _y + 4 + 30, 2, 2, 0, c_white, image_alpha);
        xSpr = scr_getbuttonsprite(global.input_g[5], false);
        draw_sprite_ext(xSpr, 0, button_x2, _y2 + 4, 2, 2, 0, c_white, image_alpha);
    }
    else
    {
        draw_set_colour(c_black);
        draw_text_transformed(_x - 1, _y2 - 1, _string3, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 - 1, _string3, 1, 1, 0);
        draw_text_transformed(_x - 1, _y2 + 1, _string3, 1, 1, 0);
        draw_text_transformed(_x + 1, _y2 + 1, _string3, 1, 1, 0);
        draw_set_colour(c_white);
        draw_text_transformed(_x, _y2, _string3, 1, 1, 0);
    }
    
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}
