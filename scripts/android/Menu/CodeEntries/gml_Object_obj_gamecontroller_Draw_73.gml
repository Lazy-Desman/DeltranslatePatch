if (!instance_exists(obj_CHAPTER_SELECT))
    exit;

if (os_type != os_windows && os_type != os_android)
    exit;

var scale_factor = 1.4;
var update_string = "";
var can_tr_be_loaded = false;
last_folded_text = scr_get_lang_string("List of changes. Press [Q] to expand.\n", "obj_gamecontroller_Create_1_0");
last_unfolded_text = scr_get_lang_string("List of changes. Press [Q] to fold.\n", "obj_gamecontroller_Create_2_0");

if (loading_new_translation_files)
    update_string = scr_get_lang_string("Loading", "obj_gamecontroller_Draw_73_5_0");

if ((array_length(loaded_files) > 0 && !loading_new_translation_files) || loading_error != "")
{
    if (loading_error == "")
        update_string = string(scr_get_lang_string("Succesfully updated to version {0}.\nHave a nice play.", "obj_gamecontroller_Draw_73_4_0"), version_to_string(cur_translation_version));
    else
        update_string = string(scr_get_lang_string("Something went wrong.\nHTTP error - {0}.", "obj_gamecontroller_Draw_73_4_1"), loading_error);
}

if (loading_error == "" && is_version_greater(last_translation_version, cur_translation_version))
{
    can_tr_be_loaded = true;
    update_string = string(scr_get_lang_string("Found new version {0} of translation.\nYour current version is {1}.", "obj_gamecontroller_Draw_73_1_0"), version_to_string(last_translation_version), version_to_string(cur_translation_version));
    
    if (!desc_folded && translation_version_description != "")
        update_string += ("\n\n" + translation_version_description);
}

if (translation_external_update)
{
    can_tr_be_loaded = false;
    update_string = string(scr_get_lang_string("Found new version {0} of translation.\nYour current version is {1}.\nIt's advised to install\nnew version manually.", "obj_gamecontroller_Draw_73_2_0"), version_to_string(last_translation_version), version_to_string(cur_translation_version));
    
    if (!desc_folded && translation_version_description != "")
        update_string += ("\n\n" + translation_version_description);
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var touch_click = device_mouse_check_button_pressed(0, mb_left);
var press_P = keyboard_check_pressed(ord("P"));
var press_Q = keyboard_check_pressed(ord("Q"));
var press_G = keyboard_check_pressed(ord("G"));
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

if (gui_w <= 0)
{
    gui_w = room_width;
    gui_h = room_height;
}

draw_set_font(scr_get_font("fnt_main"));

var draw_virtual_btn = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
{
    var hovered = arg5 >= arg0 && arg5 <= (arg0 + arg2) && arg6 >= arg1 && arg6 <= (arg1 + arg3);
    var bg_c = hovered ? 4210752 : 0;
    var brd_c = hovered ? 16777215 : arg9;
    draw_set_alpha(arg10);
    draw_rectangle_color(arg0, arg1, arg0 + arg2, arg1 + arg3, bg_c, bg_c, bg_c, bg_c, false);
    draw_set_alpha(arg10);
    draw_rectangle_color(arg0, arg1, arg0 + arg2, arg1 + arg3, brd_c, brd_c, brd_c, brd_c, true);
    draw_rectangle_color(arg0 + 1, arg1 + 1, (arg0 + arg2) - 1, (arg1 + arg3) - 1, brd_c, brd_c, brd_c, brd_c, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed_color(arg0 + (arg2 / 2), arg1 + (arg3 / 2), arg4, arg11, arg11, 0, arg8, arg8, arg8, arg8, arg10);
    return hovered && arg7;
};

if (update_string != "" || loading_new_translation_files)
{
    var target_alpha = instance_exists(obj_screen_transition) ? 0 : 1;
    _alpha = lerp(_alpha, target_alpha, instance_exists(obj_screen_transition) ? 0.18 : 0.06);
    
    if (panel_visible)
    {
        var extra_btn_height = loading_new_translation_files ? 0 : (50 * scale_factor);
        var str_w = string_width(update_string) * scale_factor;
        var str_h = string_height(update_string) * scale_factor;
        var w = max(380 * scale_factor, str_w + (40 * scale_factor));
        var h = str_h + (36 * scale_factor) + extra_btn_height;
        var xx = (gui_w / 2) - (w / 2);
        var yy = (gui_h / 2) - (h / 2);
        draw_set_alpha(_alpha * 0.95);
        draw_rectangle_color(xx, yy, xx + w, yy + h, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(_alpha);
        draw_rectangle_color(xx, yy, xx + w, yy + h, c_gray, c_gray, c_gray, c_gray, true);
        draw_rectangle_color(xx + 1, yy + 1, (xx + w) - 1, (yy + h) - 1, c_white, c_white, c_white, c_white, true);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_text_transformed_color(xx + (w / 2), yy + (18 * scale_factor), update_string, scale_factor, scale_factor, 0, c_white, c_white, c_white, c_white, _alpha);
        
        if (!loading_new_translation_files)
        {
            var btn_y = (yy + h) - (42 * scale_factor);
            var btn_h = 32 * scale_factor;
            var p_w = 95 * scale_factor;
            var p_x = (xx + w) - p_w - (14 * scale_factor);
            
            if (draw_virtual_btn(p_x, btn_y, p_w, btn_h, "[Close]", mx, my, touch_click, 16777215, 8421504, _alpha, scale_factor) || press_P)
                panel_visible = false;
            
            var q_label = desc_folded ? "[Changes]" : "[Hide]";
            var q_w = 125 * scale_factor;
            var q_x = p_x - q_w - (10 * scale_factor);
            
            if (draw_virtual_btn(q_x, btn_y, q_w, btn_h, q_label, mx, my, touch_click, 16777215, 8421504, _alpha, scale_factor) || press_Q)
                desc_folded = !desc_folded;
            
            if (can_tr_be_loaded)
            {
                var g_w = 110 * scale_factor;
                var g_x = q_x - g_w - (10 * scale_factor);
                
                if (draw_virtual_btn(g_x, btn_y, g_w, btn_h, "[> DOWNLOAD <]", mx, my, touch_click, 65535, 65535, _alpha, scale_factor) || press_G)
                {
                    load_settings();
                    loading_new_translation_files = true;
                }
            }
        }
    }
    else
    {
        var btn_w = 140 * scale_factor;
        var btn_h = 38 * scale_factor;
        var btn_x = (gui_w / 2) - (btn_w / 2);
        var btn_y = gui_h - (50 * scale_factor);
        
        if (draw_virtual_btn(btn_x, btn_y, btn_w, btn_h, "¡ NEW UPDATE !", mx, my, touch_click, 65535, 16777215, 1, scale_factor) || press_P)
            panel_visible = true;
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}
