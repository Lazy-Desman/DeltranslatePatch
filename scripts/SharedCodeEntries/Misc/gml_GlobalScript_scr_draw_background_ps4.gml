function scr_draw_background_ps4(arg0, arg1, arg2)
{
    if (global.screen_border_id != "Wide")
    {
        var bg = arg0;
        var xx = arg1;
        var yy = arg2;
        var ww = window_get_width();
        var wh = window_get_height();
        var border_w = 1920;
        var border_h = 1080;
        var border_aspect = border_w / border_h;
        var window_aspect = ww / wh;
        var scale;
        
        if (window_aspect > border_aspect)
            scale = wh / border_h;
        else
            scale = ww / border_w;
        
        var draw_w = background_get_width(bg) * scale;
        var draw_h = background_get_height(bg) * scale;
        var off_x = (ww - (border_w * scale)) / 2;
        var off_y = (wh - (border_h * scale)) / 2;
        var draw_x = off_x + (xx * scale);
        var draw_y = off_y + (yy * scale);
        draw_background_stretched(bg, draw_x, draw_y, draw_w, draw_h);
        var c_bak = draw_get_color();
        var a_bak = draw_get_alpha();
        draw_set_color(c_black);
        draw_set_alpha(1);
        
        if (window_aspect > border_aspect)
        {
            ossafe_fill_rectangle(0, 0, off_x - 1, wh);
            ossafe_fill_rectangle(draw_w + draw_x, 0, ww, wh);
        }
        else if (window_aspect != border_aspect)
        {
            ossafe_fill_rectangle(0, 0, ww, off_y - 1);
            ossafe_fill_rectangle(0, draw_h + draw_y, ww, wh);
        }
        
        draw_set_color(c_bak);
        draw_set_alpha(a_bak);
    }
    else if (global.screen_border_id == "Wide")
    {
        var bg = arg0;
        
        if (!sprite_exists(bg))
            exit;
        
        var ww = window_get_width();
        var wh = window_get_height();
        var border_w = 1920;
        var border_h = 1080;
        var scale_x = ww / border_w;
        var scale_y = wh / border_h;
        var ofs_y = 71 * scale_y;
        draw_background_ext(bg, arg1 * scale_x, (arg2 * scale_y) - ofs_y, scale_x, scale_y + ((ofs_y * 2) / border_h), 0, c_white, draw_get_alpha());
    }
}
