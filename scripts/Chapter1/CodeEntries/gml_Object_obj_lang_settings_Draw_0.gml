// Говна из ВУМШСУ_ЬУТГ

if (BGMADE == 1)
{
    ANIM_SINER += 1
    ANIM_SINER_B += 1
    BG_SINER += 1
    if (BG_ALPHA < 0.5)
        BG_ALPHA += (0.04 - BG_ALPHA / 14)
    if (BG_ALPHA > 0.5)
        BG_ALPHA = 0.5
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
draw_set_color(COL_B)
draw_text_shadow(xx_center, 10 * scale, config_text, 2)
draw_set_halign(fa_left)

draw_set_color((option == 0 ? COL_B : COL_A))
draw_text_shadow(xx_options, yy_options, lang_choice_text)
draw_text_shadow(xx_options + string_width(lang_choice_text) * scale, yy_options, "< " + get_lang_setting("name") + " >")
if (spec_mode_switch) {
    draw_set_color((option == 1 ? COL_B : COL_A))
    draw_text_shadow(xx_options, yy_options + yyoff_options, spec_mode_text)
    draw_text_shadow(xx_options + string_width(spec_mode_text) * scale, yy_options + yyoff_options, (global.special_mode ? yes_text : no_text))
}
if (translated_songs_switch) {
    draw_set_color((option == spec_mode_switch + 1 ? COL_B : COL_A))
    draw_text_shadow(xx_options, yy_options + spec_mode_switch * yyoff_options + yyoff_options, tr_songs_text)
    draw_text_shadow(xx_options + string_width(tr_songs_text) * scale, yy_options + spec_mode_switch * yyoff_options + yyoff_options, (global.translated_songs ? yes_text : no_text))
}

if (option == 1 && spec_mode_switch) {
    draw_set_halign(fa_center)
    draw_set_color(c_gray)
    draw_text_shadow(xx_center, yy_spec_mode_desc, (global.special_mode ? spec_mode_desc_enabled : spec_mode_desc_disabled))
    draw_set_halign(fa_left)
}

if (abs(HEARTX - HEARTXCUR) <= 2)
    HEARTXCUR = HEARTX
if (abs(HEARTY - HEARTYCUR) <= 2)
    HEARTYCUR = HEARTY
HEARTXCUR += ((HEARTX - HEARTXCUR) / 2)
HEARTYCUR += ((HEARTY - HEARTYCUR) / 2)

draw_set_halign(fa_center)
draw_set_color((option == options_count ? COL_B : COL_A))
draw_text_shadow(xx_center, yy_return, return_text)
draw_set_halign(fa_left)

draw_sprite_ext(spr_heartsmall, 0, HEARTXCUR, HEARTYCUR, scale, scale, 0, c_white, 1)



