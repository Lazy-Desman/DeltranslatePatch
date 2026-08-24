var ww = window_get_width();
var wh = window_get_height();
var sw = surface_get_width(application_surface);
var sh = surface_get_height(application_surface);
var border_w = 1920;
var border_h = 1080;
var xx, yy;

if (window_get_fullscreen() && global.screen_border_active && global.screen_border_id != "None" && global.screen_border_id != "Wide")
{
    if ((ww / wh) > (border_w / border_h))
    {
        var scale = wh / border_h;
        border_w *= scale;
        border_h *= scale;
        xx = (320 * (wh / 1080)) + (abs(ww - border_w) / 2);
        yy = 60 * (wh / 1080);
    }
    else
    {
        var scale = ww / border_w;
        border_w *= scale;
        border_h *= scale;
        xx = 320 * (ww / 1920);
        yy = (60 * (ww / 1920)) + (abs(wh - border_h) / 2);
    }
}
else if ((ww / wh) >= (4/3))
{
    var game_width_43 = (wh * 4) / 3;
    xx = floor((ww - game_width_43) / 2);
    yy = 0;
}
else
{
    var game_height_43 = (ww * 3) / 4;
    xx = 0;
    yy = floor((wh - game_height_43) / 2);
}

global.window_xofs = xx;
global.window_yofs = yy;

if (scr_is_switch_os() && wh == 720)
    texture_set_interpolation(true);
else
    texture_set_interpolation(false);

if (window_get_fullscreen() && global.screen_border_active && border_alpha >= 0 && global.screen_border_id != "None")
{
    scr_draw_screen_border(global.screen_border_id);
    
    if (border_alpha < 1)
    {
        draw_set_alpha(1 - border_alpha);
        draw_set_color(c_black);
        ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
        draw_set_alpha(1);
        draw_set_color(c_white);
    }
}
else
{
    var room_id = room;
    
    if (instance_exists(obj_savepoint))
        global.disable_border = false;
    
    if (room_id == PLACE_CONTACT || room_id == 317 || room_id == PLACE_MENU || room_id == room_splashscreen || room_id == room_gameover || room_id == PLACE_DOG || room_id == room_dark1a || room_id == room_dark_eyepuzzle || room_id == ROOM_INITIALIZE)
        global.disable_border = true;
}

draw_enable_alphablend(false);
draw_surface_stretched(application_surface, xx, yy, ww - (2 * xx), wh - (2 * yy));

if (paused)
{
    if (sprite_exists(screenshot))
        draw_sprite_stretched(screenshot, 0, xx, yy, ww - (2 * xx), wh - (2 * yy));
}

draw_enable_alphablend(true);

if (quit_timer >= 1 && borders_added())
{
    var _ui_sc = wh / 480;
    
    if (_ui_sc < 1)
        _ui_sc = 1;
    
    var _draw_x = floor(xx + (4 * _ui_sc));
    var _draw_y = floor(yy + (4 * _ui_sc));
    var _m_scale = 2 * _ui_sc;
    var _alpha = clamp(quit_timer / 15, 0, 1);
    var _spr = scr_84_get_sprite("spr_quitmessage");
    
    if (sprite_exists(_spr))
        draw_sprite_ext(_spr, quit_timer / 7, _draw_x, _draw_y, _m_scale, _m_scale, 0, c_white, _alpha);
}

texture_set_interpolation(false);
