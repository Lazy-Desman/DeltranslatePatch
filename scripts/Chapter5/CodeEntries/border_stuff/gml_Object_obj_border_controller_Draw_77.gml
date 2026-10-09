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

if ((scr_is_switch_os() && wh == 720) || (os_type == os_switch2 && wh == 1440))
    texture_set_interpolation(true);
else
    texture_set_interpolation(false);

var border_id = global.screen_border_id;
draw_enable_alphablend(false);

if (border_id == "Dynamic" || border_id == "ダイナミック" || border_id == "Wide" || border_id == "ワイド")
{
    if (_border_image == border_dw_garden_cliff)
    {
        var sunyy = 0;
        
        if (i_ex(obj_parallax_cliffs))
        {
            sunyy = clamp01(obj_parallax_cliffs.suny);
            
            if (room == room_dw_fcastle_flowerydash)
            {
                _palette_index = (obj_parallax_cliffs.sun_colour > 1) ? (obj_parallax_cliffs.sun_colour - 1) : _palette_index;
                _sky_color = _sky_palette[_palette_index];
            }
            
            _final_colour = merge_color(_dark_color, _sky_color, sunyy);
        }
        
        draw_set_color(_final_colour);
        ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
        draw_set_color(c_white);
        draw_enable_alphablend(true);
        
        if (room == room_dw_garden_finalplatforming)
        {
            var vert_active = global.plot >= 290;
            var vert_pos = cameray() / (room_height + 200);
            var vert_target = (-(sprite_get_height(_border_image) * 2 * vert_pos) + (view_hport[0] * 2)) - 220;
            
            if (vert_active)
            {
                if (cameray() >= 4820)
                    vert_target = -1610;
                else if (cameray() <= 1600)
                    vert_target = 0;
                
                var garden_frame_pos = clamp((cameray() - _garden_frame_min_y_pos) / (_garden_frame_max_y_pos - _garden_frame_min_y_pos), 0, 1);
                var cliff_frame_pos = clamp((cameray() - _cliff_frame_min_y_pos) / (_garden_frame_max_y_pos - _cliff_frame_min_y_pos), 0, 1);
                _border_frame_top_alpha_target = 1 - cliff_frame_pos;
                _border_frame_bottom_alpha_target = garden_frame_pos;
            }
            else
            {
                vert_target = -1610;
            }
            
            _vert_y = scr_movetowards(_vert_y, vert_target, 8);
            scr_draw_background_ps4(border_dw_garden_cliff_lattice, 0, _vert_y);
            scr_draw_background_ps4(_border_image, 0, _vert_y);
            var bottom_vert_y = _vert_y + 1350;
            scr_draw_background_ps4(border_dw_garden_cliff_lattice_bottom, 0, bottom_vert_y);
            scr_draw_background_ps4(border_dw_garden_cliff_bottom, 0, bottom_vert_y);
        }
        else if ((_is_cliff_border || _is_cliff_border_prev) && room != room_dw_garden_aquahole_left)
        {
            _vert_y = 0;
            _border_frame_top_alpha = 1;
            _border_frame_top_alpha_target = 1;
            _border_frame_bottom_alpha = 0;
            _border_frame_bottom_alpha_target = 0;
            _lut_tex_strength = i_ex(obj_parallax_cliffs) ? obj_parallax_cliffs.suny : 0;
            
            if (room == room_dw_fcastle_flowerydash)
            {
                var tex_color = UnknownEnum.Value_6;
                
                switch (_sky_color)
                {
                    case UnknownEnum.Value_4060703:
                        tex_color = UnknownEnum.Value_4;
                        break;
                    
                    case UnknownEnum.Value_14399608:
                        tex_color = UnknownEnum.Value_5;
                        break;
                    
                    case UnknownEnum.Value_38911:
                        tex_color = UnknownEnum.Value_6;
                        break;
                    
                    case UnknownEnum.Value_672767:
                        tex_color = UnknownEnum.Value_6;
                        break;
                    
                    case UnknownEnum.Value_5235199:
                        tex_color = UnknownEnum.Value_8;
                        break;
                    
                    case UnknownEnum.Value_16731501:
                        tex_color = UnknownEnum.Value_9;
                        break;
                }
                
                _lut_tex = sprite_get_texture(spr_luts, tex_color);
            }
            
            shader_replace_simple_set_hook(14);
            shader_set_uniform_f(u_strength, _lut_tex_strength);
            texture_set_stage(u_lut_tex, _lut_tex);
            scr_draw_background_ps4(border_dw_garden_cliff_lattice, 0, _vert_y);
            scr_draw_background_ps4(_border_image, 0, _vert_y);
            var bottom_vert_y = _vert_y + 1350;
            scr_draw_background_ps4(border_dw_garden_cliff_lattice_bottom, 0, bottom_vert_y);
            scr_draw_background_ps4(border_dw_garden_cliff_bottom, 0, bottom_vert_y);
            shader_replace_simple_reset_hook();
        }
        else
        {
            _vert_y = -1610;
            _border_frame_top_alpha = 0;
            _border_frame_top_alpha_target = 0;
            _border_frame_bottom_alpha = 1;
            _border_frame_bottom_alpha_target = 1;
            scr_draw_background_ps4(border_dw_garden_cliff_lattice, 0, _vert_y);
            scr_draw_background_ps4(_border_image, 0, _vert_y);
            var bottom_vert_y = _vert_y + 1350;
            scr_draw_background_ps4(border_dw_garden_cliff_lattice_bottom, 0, bottom_vert_y);
            scr_draw_background_ps4(border_dw_garden_cliff_bottom, 0, bottom_vert_y);
        }
        
        _border_frame_top_alpha = scr_movetowards(_border_frame_top_alpha, _border_frame_top_alpha_target, 0.2);
        _border_frame_bottom_alpha = scr_movetowards(_border_frame_bottom_alpha, _border_frame_bottom_alpha_target, 0.2);
        draw_set_alpha(_border_frame_top_alpha);
        scr_draw_background_ps4(border_dw_garden_cliff_frame, 0, 0);
        draw_set_alpha(1);
        draw_set_alpha(_border_frame_bottom_alpha);
        scr_draw_background_ps4(border_dw_garden_cliff_bottom_frame, 0, 0);
        draw_set_alpha(1);
        draw_enable_alphablend(false);
    }
    else
    {
        scr_draw_background_ps4(_border_image, 0, 0);
    }
    
    global.disable_border = obj_time.border_alpha != 1;
}

draw_set_alpha(1);
draw_enable_alphablend(true);

if (_border_image != _border_image_temp || _border_crossfade)
{
    if (_border_image_temp == border_dw_garden_cliff)
    {
        if (_is_cliff_border)
        {
            _vert_y = 0;
            var sunyy = 0;
            
            if (i_ex(obj_parallax_cliffs))
            {
                sunyy = obj_parallax_cliffs.suny;
                _final_colour = merge_color(_dark_color, _sky_color, sunyy);
            }
            
            draw_set_alpha(_border_image_temp_alpha);
            draw_set_color(_final_colour);
            ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
            draw_set_color(c_white);
            scr_draw_background_ps4(border_dw_garden_cliff_frame, 0, 0);
            draw_set_alpha(1);
        }
        else
        {
            _vert_y = -1610;
        }
    }
    else
    {
        _vert_y = 0;
    }
    
    if (_is_cliff_border)
    {
        var _lut_index = 0;
        var _lut_strength = i_ex(obj_parallax_cliffs) ? obj_parallax_cliffs.suny : 0;
        shader_replace_simple_set_hook(14);
        shader_set_uniform_f(u_strength, _lut_strength);
        texture_set_stage(u_lut_tex, _lut_tex);
        draw_set_alpha(_border_image_temp_alpha);
        scr_draw_background_ps4(border_dw_garden_cliff_lattice, 0, _vert_y);
        scr_draw_background_ps4(_border_image_temp, 0, _vert_y);
        var bottom_vert_y = _vert_y + 1350;
        scr_draw_background_ps4(border_dw_garden_cliff_lattice_bottom, 0, bottom_vert_y);
        scr_draw_background_ps4(border_dw_garden_cliff_bottom, 0, bottom_vert_y);
        shader_replace_simple_reset_hook();
        scr_draw_background_ps4(border_dw_garden_cliff_frame, 0, _vert_y);
        scr_draw_background_ps4(border_dw_garden_cliff_bottom_frame, 0, bottom_vert_y);
    }
    else
    {
        draw_set_alpha(_border_image_temp_alpha);
        scr_draw_background_ps4(_border_image_temp, 0, _vert_y);
        
        if (_border_image_temp == border_dw_garden_cliff)
        {
            var bottom_vert_y = _vert_y + 1350;
            scr_draw_background_ps4(border_dw_garden_cliff_lattice_bottom, 0, bottom_vert_y);
            scr_draw_background_ps4(border_dw_garden_cliff_bottom, 0, bottom_vert_y);
            scr_draw_background_ps4(border_dw_garden_cliff_bottom_frame, 0, 0);
        }
    }
    
    _border_image_temp_alpha += _border_image_temp_alpha_amount;
    
    if (_border_image_temp_alpha > 1)
    {
        _border_crossfade = false;
        _border_image_temp_alpha = 0;
        _border_image = _border_image_temp;
        _is_cliff_border_prev = _is_cliff_border;
    }
    
    draw_set_alpha(1);
}

if (_is_cliff_border && _cliff_cross_fade)
{
    if (!sprite_exists(_border_prev_sprite))
    {
        if (!surface_exists(_border_prev_surface))
            _border_prev_surface = surface_create(ww, wh);
        
        surface_set_target(_border_prev_surface);
        draw_clear_alpha(c_black, 0);
        draw_set_alpha(1);
        draw_set_color(_final_colour_temp);
        ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
        draw_set_color(c_white);
        draw_set_alpha(1);
        shader_replace_simple_set_hook(14);
        shader_set_uniform_f(u_strength, _lut_tex_strength_temp);
        texture_set_stage(u_lut_tex, _lut_tex_temp);
        draw_set_alpha(1);
        scr_draw_background_ps4(border_dw_garden_cliff_lattice, 0, _vert_y);
        scr_draw_background_ps4(border_dw_garden_cliff, 0, _vert_y);
        var bottom_vert_y = _vert_y + 1350;
        scr_draw_background_ps4(border_dw_garden_cliff_lattice_bottom, 0, bottom_vert_y);
        scr_draw_background_ps4(border_dw_garden_cliff_bottom, 0, bottom_vert_y);
        draw_set_alpha(1);
        shader_replace_simple_reset_hook();
        scr_draw_background_ps4(border_dw_garden_cliff_frame, 0, _vert_y);
        scr_draw_background_ps4(border_dw_garden_cliff_bottom_frame, 0, bottom_vert_y);
        _border_prev_sprite = sprite_create_from_surface(_border_prev_surface, 0, 0, ww, wh, false, true, 0, 0);
        surface_reset_target();
        surface_free(_border_prev_surface);
    }
    
    if (sprite_exists(_border_prev_sprite))
    {
        _cliff_cross_fade_alpha = scr_movetowards(_cliff_cross_fade_alpha, 0, 0.05);
        draw_sprite_ext(_border_prev_sprite, 0, 0, 0, 1, 1, 0, c_white, _cliff_cross_fade_alpha);
        
        if (_cliff_cross_fade_alpha <= 0)
        {
            _cliff_cross_fade = false;
            clean_up();
        }
    }
}

if (custom_effect >= 0)
{
    if (custom_effect_con == 0)
    {
        if (custom_effect_alpha < custom_effect_alpha_target)
            custom_effect_alpha += custom_effect_fade_speed;
    }
    
    if (custom_effect_con == 1)
    {
        custom_effect_alpha -= custom_effect_fade_speed;
        
        if (custom_effect_alpha <= 0)
        {
            custom_effect = -1;
            custom_effect_con = 0;
        }
    }
    
    draw_set_alpha(custom_effect_alpha);
    draw_set_color(custom_effect_color);
    ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (room == room_dw_cliff_sethaqua_battle)
{
    if (cameray() >= 440)
    {
        overlay_alpha = scr_movetowards(overlay_alpha, 0, 0.04);
        overlay_alpha_target = overlay_alpha;
    }
    else
    {
        var target_alpha = 1 - clamp(lerp(0, 1, cameray() / 800), 0, 1);
        overlay_alpha = scr_movetowards(overlay_alpha, target_alpha, 0.04);
        overlay_alpha_target = overlay_alpha;
        
        if (cameray() <= 46)
        {
            overlay_alpha = 1;
            overlay_alpha_target = 1;
        }
    }
}

draw_set_alpha(overlay_alpha);
draw_set_color(overlay_color);
ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
draw_set_alpha(1);
draw_set_color(c_white);

for (var i = 0; i < array_length(_overlay_layers); i++)
{
    var _overlay_layer = _overlay_layers[i];
    _overlay_layer.fade();
    draw_set_alpha(_overlay_layer.get_alpha());
    draw_set_color(_overlay_layer.get_color());
    ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (border_id == "Simple" || border_id == "シンプル")
{
    scr_draw_background_ps4(border_line_1080, 0, 0);
    global.disable_border = obj_time.border_alpha != 1;
}

if (!global.screen_border_active)
{
    if (!variable_global_exists("currentroom"))
        global.currentroom = room;
    
    var room_id = global.currentroom;
    
    if (instance_exists(obj_savepoint))
        global.disable_border = false;
    
    if (room_id == PLACE_CONTACT || room_id == 1545 || room_id == PLACE_MENU || room_id == room_gameover || room_id == PLACE_DOG)
        global.disable_border = true;
    
    draw_set_alpha(1);
    draw_set_color(c_black);
    ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
    draw_set_color(c_white);
}

draw_enable_alphablend(false);
draw_surface_stretched(application_surface, xx, yy, ww - (2 * xx), wh - (2 * yy));

if (instance_exists(obj_time))
{
    var is_paused = false;
    
    with (obj_time)
        is_paused = paused;
    
    if (is_paused)
    {
        if (sprite_exists(obj_time.screenshot))
            draw_sprite_ext(obj_time.screenshot, 0, xx, yy, global.window_scale, global.window_scale, 0, c_white, 1);
    }
}

draw_enable_alphablend(true);

if (instance_exists(obj_time))
{
    var _q = obj_time.quit_timer;
    
    if (_q >= 1 && borders_added())
    {
        var _ui_sc = wh / 480;
        
        if (_ui_sc < 1)
            _ui_sc = 1;
        
        var _draw_x = floor(xx + (4 * _ui_sc));
        var _draw_y = floor(yy + (4 * _ui_sc));
        var _m_scale = 2 * _ui_sc;
        var _alpha = clamp(_q / 15, 0, 1);
        draw_sprite_ext(scr_84_get_sprite("spr_quitmessage"), _q / 7, _draw_x, _draw_y, _m_scale, _m_scale, 0, c_white, _alpha);
    }
}

texture_set_interpolation(false);

enum UnknownEnum
{
    Value_4 = 4,
    Value_5,
    Value_6,
    Value_8 = 8,
    Value_9,
    Value_38911 = 38911,
    Value_672767 = 672767,
    Value_4060703 = 4060703,
    Value_5235199 = 5235199,
    Value_14399608 = 14399608,
    Value_16731501 = 16731501
}
