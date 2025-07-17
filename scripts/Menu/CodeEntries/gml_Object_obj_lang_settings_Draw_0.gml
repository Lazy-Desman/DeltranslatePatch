draw_set_font(scr_get_font("fnt_main"))
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_text_transformed(room_width / 2, 10 * scale, config_text, 2 * scale, 2 * scale, 0)
draw_set_halign(fa_left)

draw_set_color((option == 0 ? c_yellow : c_white))
draw_text_transformed(xx_options, yy_options, lang_choice_text, scale, scale, 0)
draw_text_transformed(xx_options + string_width(lang_choice_text) * scale, yy_options, "< " + get_lang_setting("name") + " >", scale, scale, 0)
if (spec_mode_switch) {
    draw_set_color((option == 1 ? c_yellow : c_white))
    draw_text_transformed(xx_options, yy_options + yyoff_options, spec_mode_text, scale, scale, 0)
    draw_text_transformed(xx_options + string_width(spec_mode_text) * scale, yy_options + yyoff_options, (global.special_mode ? yes_text : no_text), scale, scale, 0)
}
if (translated_songs_switch) {
    draw_set_color((option == spec_mode_switch + 1 ? c_yellow : c_white))
    draw_text_transformed(xx_options, yy_options + spec_mode_switch * yyoff_options + yyoff_options, tr_songs_text, scale, scale, 0)
    draw_text_transformed(xx_options + string_width(tr_songs_text) * scale, yy_options + spec_mode_switch * yyoff_options + yyoff_options, (global.translated_songs ? yes_text : no_text), scale, scale, 0)
}

if (option == 1 && spec_mode_switch) {
    draw_set_halign(fa_center)
    draw_set_color(c_gray)
    draw_text_transformed(room_width / 2, yy_spec_mode_desc, (global.special_mode ? spec_mode_desc_enabled : spec_mode_desc_disabled), scale, scale, 0)
    draw_set_halign(fa_left)
}

draw_set_halign(fa_center)
draw_set_color((option == options_count ? c_yellow : c_white))
draw_text_transformed(room_width / 2, yy_return, return_text, scale, scale, 0)
draw_set_halign(fa_left)

if (option < options_count) {
    draw_sprite_ext(spr_heart, 0, xx_options - xxoff_heart, (yy_options + 4 * scale + option * yyoff_options), scale, scale, 0, c_white, 1)
} else {
    draw_sprite_ext(spr_heart, 0, (room_width - string_width(return_text) * 2) / 2 - xxoff_heart, yy_return + 4 * scale, scale, scale, 0, c_white, 1)
}



