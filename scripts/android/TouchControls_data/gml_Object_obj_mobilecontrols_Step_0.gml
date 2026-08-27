if ((!(display_get_gui_width() == latestGuiW)) || (!(display_get_gui_height() == latestGuiH)))
    scr_add_keys()
if mouse_check_button(mb_left)
{
    var centro_base_x = analog_posx + ((59 * analog_scale) / 2)
    var centro_base_y = analog_posy + ((59 * analog_scale) / 2)
    if (point_distance(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), centro_base_x, centro_base_y) < (75 * analog_scale))
    {
        analog_center_x = device_mouse_x_to_gui(0) - (20 * analog_scale)
        analog_center_y = device_mouse_y_to_gui(0) - (20 * analog_scale)
    }
}
else
{
    analog_center_x = (analog_posx + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2)))
    analog_center_y = (analog_posy + (((59 * analog_scale) / 2) - ((41 * analog_scale) / 2)))
}
if keyboard_check_pressed(92)
{
    edit += 1
    if (edit == 1)
    {
        black_fade = 0.4
        text_black_fade = 0.9
    }
    else if (edit == 3)
    {
        ini_open("touchconfig.ini")
        ini_write_real("CONFIG", "zx", zx)
        ini_write_real("CONFIG", "zy", zy)
        ini_write_real("CONFIG", "xx", xx)
        ini_write_real("CONFIG", "xy", xy)
        ini_write_real("CONFIG", "cx", cx)
        ini_write_real("CONFIG", "cy", cy)
        ini_write_real("CONFIG", "f1x", f1x)
        ini_write_real("CONFIG", "f1y", f1y)
        ini_write_real("CONFIG", "analog_posx", analog_posx)
        ini_write_real("CONFIG", "analog_posy", analog_posy)
        ini_write_real("CONFIG", "button_scale", button_scale)
        ini_write_real("CONFIG", "analog_scale", analog_scale)
        ini_write_real("CONFIG", "joystick_type", joystick_type)
        ini_write_real("CONFIG", "controls_opacity", controls_opacity)
        ini_close()
        black_fade = 0
        text_black_fade = 0
        edit = 0
        scr_add_keys()
    }
}
if (edit == 0) return;
scr_add_keys()
if (keyboard_check(125))
{
    zx = (device_mouse_x_to_gui(0) - (19.5 * button_scale))
    zy = (device_mouse_y_to_gui(0) - (18 * button_scale))
}
if (keyboard_check(124))
{
    xx = (device_mouse_x_to_gui(0) - (19.5 * button_scale))
    xy = (device_mouse_y_to_gui(0) - (18 * button_scale))
}
if keyboard_check(94)
{
    cx = (device_mouse_x_to_gui(0) - (19.5 * button_scale))
    cy = (device_mouse_y_to_gui(0) - (18 * button_scale))
}
if keyboard_check(ord("4"))
{
    f1x = device_mouse_x_to_gui(0) - (19.5 * button_scale);
    f1y = device_mouse_y_to_gui(0) - (18 * button_scale);
}

if keyboard_check(93)
{
    analog_posx = (device_mouse_x_to_gui(0) - (29.5 * analog_scale))
    analog_posy = (device_mouse_y_to_gui(0) - (29.5 * analog_scale))
}
if (device_mouse_x_to_gui(0) >= 459.5 && device_mouse_y_to_gui(0) >= 75 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 93 && mouse_check_button_pressed(mb_left))
{
    if (button_scale > 1)
        button_scale -= 0.1
}
if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 75 && device_mouse_x_to_gui(0) <= 541.5 && device_mouse_y_to_gui(0) <= 93 && mouse_check_button_pressed(mb_left))
{
    if (button_scale < 3)
        button_scale += 0.1
}
if (device_mouse_x_to_gui(0) >= 459.5 && device_mouse_y_to_gui(0) >= 121 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 139 && mouse_check_button_pressed(mb_left))
{
    if (analog_scale > 1)
        analog_scale -= 0.1
}
if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 121 && device_mouse_x_to_gui(0) <= 541.5 && device_mouse_y_to_gui(0) <= 139 && mouse_check_button_pressed(mb_left))
{
    if (analog_scale < 4)
        analog_scale += 0.1
}
if (device_mouse_x_to_gui(0) >= 459.5 && device_mouse_y_to_gui(0) >= 167 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 185 && mouse_check_button_pressed(mb_left))
{
    if (joystick_type == 1)
        joystick_type -= 1
}
if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 167 && device_mouse_x_to_gui(0) <= 541.5 && device_mouse_y_to_gui(0) <= 185 && mouse_check_button_pressed(mb_left))
{
    if (joystick_type == 0)
        joystick_type += 1
}
if (device_mouse_x_to_gui(0) >= 459.5 && device_mouse_y_to_gui(0) >= 167 && device_mouse_x_to_gui(0) <= 469.5 && device_mouse_y_to_gui(0) <= 231 && mouse_check_button_pressed(mb_left))
{
    if (controls_opacity > 0.10)
        controls_opacity -= 0.1
}
if (device_mouse_x_to_gui(0) >= 531.5 && device_mouse_y_to_gui(0) >= 167 && device_mouse_x_to_gui(0) <= 541.5 && device_mouse_y_to_gui(0) <= 231 && mouse_check_button_pressed(mb_left))
{
    if (controls_opacity < 1.00)
        controls_opacity += 0.1
}

if (device_mouse_x_to_gui(0) >= 241 && device_mouse_y_to_gui(0) >= 275 && device_mouse_x_to_gui(0) <= 399 && device_mouse_y_to_gui(0) <= 299 && mouse_check_button_pressed(mb_left))
{
    if (controls_opacity > 0)
        controls_opacity = 0
    else if (controls_opacity == 0)
        controls_opacity = 0.5
}
if (device_mouse_x_to_gui(0) >= 241 && device_mouse_y_to_gui(0) >= 412.25 && device_mouse_x_to_gui(0) <= 399 && device_mouse_y_to_gui(0) <= 436.25 && mouse_check_button_pressed(mb_left))
{
    zx = 475
    zy = 340
    xx = 525
    xy = 280
    cx = 575
    cy = 220
    f1x = 610
    f1y = 5
    button_scale = 2.5
    analog_scale = 3.3
    analog_posx = -100
    analog_posy = 232.5
    joystick_type = 0
    controls_opacity = 0.5
}

