var ratio = display_get_gui_width() / 640
var ratioVertical = display_get_gui_height() / 480
draw_sprite_ext(spr_black, 0, 0, 0, (1 * ratio), (1 * ratioVertical), 0, c_white, black_fade)
draw_set_font(settings_font)
draw_sprite_ext(spr_controls_config, 0, (220 * ratio), (22.5 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_button_scale, 0, (120.5 * ratio), (75 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_arrow_leftright, 0, (459.5 * ratio), (75 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_analog_scale, 0, (120.5 * ratio), (121 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_arrow_leftright, 0, (459.5 * ratio), (121 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_analog_type, 0, (124 * ratio), (167 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_arrow_leftright, 0, (459.5 * ratio), (167 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_controls_opacity, 0, (106.5 * ratio), (213 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_arrow_leftright, 0, (459.5 * ratio), (213 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_reset_config, 0, (241 * ratio), (412.25 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade)
draw_sprite_ext(spr_activar_mando, 0, (241 * ratio), (275 * ratioVertical), (2 * ratio), (2 * ratioVertical), 0, c_white, text_black_fade);
draw_text_transformed_colour((settings_num_x * ratio), (67 * ratioVertical), button_scale, (1 * ratio), (1 * ratioVertical), 0, c_white, c_white, c_white, c_white, text_black_fade)
draw_text_transformed_colour((settings_num_x * ratio), (113 * ratioVertical), analog_scale, (1 * ratio), (1 * ratioVertical), 0, c_white, c_white, c_white, c_white, text_black_fade)
draw_text_transformed_colour((settings_num_x * ratio), (159 * ratioVertical), joystick_type, (1 * ratio), (1 * ratioVertical), 0, c_white, c_white, c_white, c_white, text_black_fade)
draw_text_transformed_colour((settings_num_x * ratio), (205 * ratioVertical), controls_opacity, (1 * ratio), (1 * ratioVertical), 0, c_white, c_white, c_white, c_white, text_black_fade)
if (is_in_castle_town())
{
    draw_sprite_ext(asset_get_index("spr_ct_z_button") != -1 ? spr_ct_z_button : spr_z_button, keyboard_check(ord("Z")), (zx * ratio), (zy * ratioVertical), (button_scale * ratio), (button_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_ct_x_button") != -1 ? spr_ct_x_button : spr_x_button, keyboard_check(ord("X")), (xx * ratio), (xy * ratioVertical), (button_scale * ratio), (button_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_ct_c_button") != -1 ? spr_ct_c_button : spr_c_button, keyboard_check(ord("C")), (cx * ratio), (cy * ratioVertical), (button_scale * ratio), (button_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_ct_joybase") != -1 ? spr_ct_joybase : spr_joybase, joystick_type, (analog_posx * ratio), (analog_posy * ratioVertical), (analog_scale * ratio), (analog_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_ct_joystick") != -1 ? spr_ct_joystick : spr_joystick, joystick_type, (analog_center_x * ratio), (analog_center_y * ratioVertical), (analog_scale * ratio), (analog_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_ct_settings") != -1 ? spr_ct_settings : spr_settings, keyboard_check(92 /* ord("\") */), (settingsx * ratio), (settingsy * ratioVertical), (button_scale/* * 0.5*/ * ratio), (button_scale/* * 0.5*/ * ratioVertical), 0, c_white, controls_opacity)
}
else
{
    draw_sprite_ext(asset_get_index("spr_dw_z_button") != -1 && global.darkzone ? spr_dw_z_button : spr_z_button, keyboard_check(ord("Z")), (zx * ratio), (zy * ratioVertical), (button_scale * ratio), (button_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_dw_x_button") != -1 && global.darkzone ? spr_dw_x_button : spr_x_button, keyboard_check(ord("X")), (xx * ratio), (xy * ratioVertical), (button_scale * ratio), (button_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_dw_c_button") != -1 && global.darkzone ? spr_dw_c_button : spr_c_button, keyboard_check(ord("C")), (cx * ratio), (cy * ratioVertical), (button_scale * ratio), (button_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_dw_joybase") != -1 && global.darkzone ? spr_dw_joybase : spr_joybase, joystick_type, (analog_posx * ratio), (analog_posy * ratioVertical), (analog_scale * ratio), (analog_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_dw_joystick") != -1 && global.darkzone ? spr_dw_joystick : spr_joystick, joystick_type, (analog_center_x * ratio), (analog_center_y * ratioVertical), (analog_scale * ratio), (analog_scale * ratioVertical), 0, c_white, controls_opacity)
    draw_sprite_ext(asset_get_index("spr_dw_settings") != -1 && global.darkzone ? spr_dw_settings : spr_settings, keyboard_check(92 /* ord("\") */), (settingsx * ratio), (settingsy * ratioVertical), (button_scale/* * 0.5*/ * ratio), (button_scale/* * 0.5*/ * ratioVertical), 0, c_white, controls_opacity)
}

if (variable_global_exists("chapter") && global.darkzone && !is_in_castle_town() && global.chapter == 2)
    draw_sprite_ext(asset_get_index("spr_dw_f1_button") != -1 && global.darkzone ? spr_dw_f1_button : spr_f1_button, keyboard_check(vk_f1), (f1x * ratio), (f1y * ratioVertical), (button_scale/* * 0.5*/ * ratio), (button_scale/* * 0.5*/ * ratioVertical), 0, c_white, controls_opacity);
