// Говна из ВУМШСУ_ЬУТГ

if (SUBTYPE == 0 && DOORDRAWN == 1) {
    draw_sprite_ext(spr_giantdarkdoor, 1, 43, 48, 2, 2, 0, COL_A, (0.03 + (sin(BG_SINER / 20)) * 0.04))
    draw_sprite_ext(spr_giantdarkdoor, 1, 47, 48, 2, 2, 0, COL_A, (0.03 + (sin(BG_SINER / 20)) * 0.04))
    draw_sprite_ext(spr_giantdarkdoor, 1, 43, 52, 2, 2, 0, COL_A, (0.03 + (sin(BG_SINER / 20)) * 0.04))
    draw_sprite_ext(spr_giantdarkdoor, 1, 47, 52, 2, 2, 0, COL_A, (0.03 + (sin(BG_SINER / 20)) * 0.04))
    draw_sprite_ext(spr_giantdarkdoor, 1, 45, 50, 2, 2, 0, COL_A, 0.25)
    BG_SINER++
}
if (BGMADE == 1 && SUBTYPE == 1) {
    ANIM_SINER += 1
    ANIM_SINER_B += 1
    BG_SINER += 1
    __WAVEHEIGHT = 240
    __WAVEWIDTH = 320
    for (i = 0; i < (__WAVEHEIGHT - 50); i += 1)
    {
        __WAVEMINUS = BGMAGNITUDE * (i / __WAVEHEIGHT) * 1.3
        if (__WAVEMINUS > BGMAGNITUDE)
            __WAVEMAG = 0
        else
            __WAVEMAG = BGMAGNITUDE - __WAVEMINUS
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, ((sin(i / 8 + BG_SINER / 30)) * __WAVEMAG), (-10 + i - BG_ALPHA * 20), 1, 1, image_blend, (BG_ALPHA * 0.8))
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, ((-(sin(i / 8 + BG_SINER / 30))) * __WAVEMAG), (-10 + i - BG_ALPHA * 20), 1, 1, image_blend, (BG_ALPHA * 0.8))
    }
    T_SINER_ADD = (sin(ANIM_SINER_B / 10)) * 0.6 - 0.25
    if (T_SINER_ADD >= 0)
        TRUE_ANIM_SINER += T_SINER_ADD
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12), 0, (10 - BG_ALPHA * 20 + __WAVEHEIGHT - 70), 1, 1, 0, image_blend, (BG_ALPHA * 0.46))
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12 + 0.4), 0, (10 - BG_ALPHA * 20 + __WAVEHEIGHT - 70), 1, 1, 0, image_blend, (BG_ALPHA * 0.56))
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12 + 0.8), 0, (10 - BG_ALPHA * 20 + __WAVEHEIGHT - 70), 1, 1, 0, image_blend, (BG_ALPHA * 0.7))
}




draw_set_font(scr_84_get_font("main"))
draw_set_halign(fa_center)
draw_set_color(COL_A)
draw_text_shadow(xx_mid, 10 * scale, config_text, 2 * scale, 2 * scale, 0)
draw_set_halign(fa_left)

for (var i = 0; i < options_count; i++) {
    draw_set_color((option == i ? COL_B : COL_A))

    if (options[i] == "language") {
        draw_text_shadow(xx_options, yy_options + yyoff_options * i, lang_choice_text, scale, scale, 0)
        var xx_off = string_width(lang_choice_text) * scale
        // draw_text_shadow(xx_options + xx_off, yy_options + yyoff_options * i, "< ", scale, scale, 0)
        // xx_off += string_width("< ") * scale

        if (option == i) {
            var link = get_lang_setting("link", "")
            if (link != "")
                draw_rectangle_color(xx_options + xx_off, yy_options + 14 * scale, xx_options + xx_off + string_width(get_lang_setting("name")) * scale, yy_options + 14 * scale + 1, c_blue, c_blue, c_blue, c_blue, false)
        }
        
        draw_text_shadow(xx_options + xx_off, yy_options + yyoff_options * i, get_lang_setting("name"), scale, scale, 0)
        
        xx_off += string_width(get_lang_setting("name")) * scale
        // draw_text_shadow(xx_options + xx_off, yy_options + yyoff_options * i, " >", scale, scale, 0)

        if (option == i) {
            var lang_desc = get_lang_setting("description", "")
            draw_set_halign(fa_center)
            draw_set_color(SUBTYPE ? c_aqua : c_gray)
            draw_text_shadow(xx_mid, yy_options + yyoff_options * options_count, lang_desc, scale, scale, 0)
            draw_set_color(COL_A)
            draw_set_halign(fa_left)
        }
    } else

    if (options[i] == "special_mode") {
        draw_text_shadow(xx_options, yy_options + yyoff_options * i, spec_mode_text, scale, scale, 0)
        draw_text_shadow(xx_options + string_width(spec_mode_text) * scale, yy_options + yyoff_options * i, (global.special_mode ? yes_text : no_text), scale, scale, 0)
        if (option == i) {
            draw_set_halign(fa_center)
            draw_set_color(SUBTYPE ? c_aqua : c_gray)
            draw_text_shadow(xx_mid, yy_options + yyoff_options * options_count, (global.special_mode ? spec_mode_desc_enabled : spec_mode_desc_disabled), scale, scale, 0)
            draw_set_halign(fa_left)
        }
    } else
    
    if (options[i] == "enable_translated_songs_switch") {
        draw_text_shadow(xx_options, yy_options + yyoff_options * i, tr_songs_text, scale, scale, 0)
        draw_text_shadow(xx_options + string_width(tr_songs_text) * scale, yy_options + yyoff_options * i, (global.translated_songs ? yes_text : no_text), scale, scale, 0)
    }
}

draw_set_halign(fa_center)
draw_set_color((option == options_count ? COL_B : COL_A))
draw_text_shadow(xx_mid, yy_return, return_text, scale, scale, 0)
draw_set_halign(fa_left)

if (option < options_count) {
    draw_sprite_ext(spr_heartsmall, 0, xx_options - xxoff_heart, (yy_options + 4 * scale + option * yyoff_options), scale, scale, 0, COL_A, 1)
} else {
    draw_sprite_ext(spr_heartsmall, 0, (xx_mid - string_width(return_text) / 2) - xxoff_heart, yy_return + 4 * scale, scale, scale, 0, COL_A, 1)
}



