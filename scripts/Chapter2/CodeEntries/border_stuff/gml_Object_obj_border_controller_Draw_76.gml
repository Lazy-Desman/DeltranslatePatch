var ww = window_get_width();
var wh = window_get_height();
var sw = surface_get_width(application_surface);
var sh = surface_get_height(application_surface);
var scale_w = ww / sw;
var scale_h = wh / sh;

if (scr_is_switch_os() || os_type == os_ps4 || os_type == os_ps5)
{
    if (scr_is_switch_os() && wh == 720)
        global.window_scale = 4/3;
    else
        global.window_scale = floor(min(scale_w, scale_h));
}
else if (!window_get_fullscreen())
{
    if (instance_exists(obj_time))
        global.window_scale = obj_time.window_size_multiplier;
    else
        global.window_scale = 2;
}
else
{
    global.window_scale = wh / 480;
}

if (os_type == os_windows && !window_get_fullscreen())
{
    var _mult = 2;
    
    if (instance_exists(obj_time))
        _mult = obj_time.window_size_multiplier;
    
    var _h = 480 * _mult;
    var _w = 640 * _mult;
    
    if (ww != _w || wh != _h)
    {
        window_set_size(_w, _h);
        
        if (instance_exists(obj_time))
        {
            if (obj_time.alarm[2] <= 0)
                obj_time.alarm[2] = 2;
        }
    }
}

texture_set_interpolation(false);
