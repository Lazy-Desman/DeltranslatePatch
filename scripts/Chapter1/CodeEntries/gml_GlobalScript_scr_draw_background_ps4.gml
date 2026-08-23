function scr_draw_background_ps4(arg0, arg1, arg2)
{
    var dw, dh;
    
    if (os_type == os_windows || os_type == os_android)
    {
        dw = window_get_width();
        dh = window_get_height();
    }
    else
    {
        dw = display_get_width();
        dh = display_get_height();
    }
    
    var bw = background_get_width(arg0);
    var bh = background_get_height(arg0);
    var scale_x = dw / bw;
    var scale_y = dh / bh;
    var scale = min(scale_x, scale_y);
    var draw_w = bw * scale;
    var draw_h = bh * scale;
    var draw_x = (dw - draw_w) * 0.5;
    var draw_y = (dh - draw_h) * 0.5;
    
    if (arg0 == 3232)
    {
        draw_background_ext(arg0, draw_x, draw_y, scale, scale, 0, c_white, 1);
        exit;
    }
    
    if (global.screen_border_id == "Wide")
    {
        var ofs = 71;
        draw_background_stretched(arg0, 0, -ofs, dw, dh + (ofs * 2));
    }
    else if (global.screen_border_id != "None")
    {
        draw_background_ext(arg0, draw_x, draw_y, scale, scale, 0, c_white, 1);
    }
}
