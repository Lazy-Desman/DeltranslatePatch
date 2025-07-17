scr_84_set_draw_font("main");

if (BGMADE == 1)
{
    ANIM_SINER += 1;
    ANIM_SINER_B += 1;
    BG_SINER += 1;
    
    if (BG_ALPHA < 0.5)
        BG_ALPHA += (0.04 - (BG_ALPHA / 14));
    
    if (BG_ALPHA > 0.5)
        BG_ALPHA = 0.5;
    
    __WAVEHEIGHT = 240;
    __WAVEWIDTH = 320;
    
    for (i = 0; i < (__WAVEHEIGHT - 50); i += 1)
    {
        __WAVEMINUS = BGMAGNITUDE * (i / __WAVEHEIGHT) * 1.3;
        
        if (__WAVEMINUS > BGMAGNITUDE)
            __WAVEMAG = 0;
        else
            __WAVEMAG = BGMAGNITUDE - __WAVEMINUS;
        
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, sin((i / 8) + (BG_SINER / 30)) * __WAVEMAG, (-10 + i) - (BG_ALPHA * 20), 1, 1, image_blend, BG_ALPHA * 0.8);
        draw_background_part_ext(IMAGE_MENU, 0, i, __WAVEWIDTH, 1, -sin((i / 8) + (BG_SINER / 30)) * __WAVEMAG, (-10 + i) - (BG_ALPHA * 20), 1, 1, image_blend, BG_ALPHA * 0.8);
    }
    
    T_SINER_ADD = (sin(ANIM_SINER_B / 10) * 0.6) - 0.25;
    
    if (T_SINER_ADD >= 0)
        TRUE_ANIM_SINER += T_SINER_ADD;
    
    draw_sprite_ext(IMAGE_MENU_ANIMATION, ANIM_SINER / 12, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.46);
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12) + 0.4, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.56);
    draw_sprite_ext(IMAGE_MENU_ANIMATION, (ANIM_SINER / 12) + 0.8, 0, ((10 - (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70, 1, 1, 0, image_blend, BG_ALPHA * 0.7);
}

for (i = 0; i < 3; i += 1)
{
    CONT_THIS = 0;
    PREV_MENU = MENU_NO;
    
    if (MENU_NO == 1)
        PREV_MENU = 0;
    
    if (MENU_NO == 4)
        PREV_MENU = 3;
    
    if (MENU_NO == 6)
        PREV_MENU = 5;
    
    if (MENU_NO == 7)
        PREV_MENU = 5;
    
    if (MENUCOORD[0] == i && MENU_NO == 1)
        CONT_THIS = 1;
    
    if (MENUCOORD[3] == i && MENU_NO == 4)
        CONT_THIS = 4;
    
    if (MENUCOORD[5] == i && MENU_NO == 6)
        CONT_THIS = 6;
    
    if (MENUCOORD[5] == i && MENU_NO == 7)
        CONT_THIS = 7;
    
    BOX_X1 = 55;
    BOX_Y1 = 55 + ((YL + YS) * i);
    BOX_X2 = 55 + XL;
    BOX_Y2 = 55 + ((YL + YS) * i) + YL - 1;
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(BOX_X1, BOX_Y1, BOX_X2, BOX_Y2, false);
    draw_set_alpha(1);
    draw_set_color(COL_A);
    
    if (MENUCOORD[PREV_MENU] == i)
        draw_set_color(COL_B);
    
    if (MENU_NO == 3 || MENU_NO == 4)
    {
        if (MENUCOORD[2] == i)
            draw_set_color(COL_PLUS);
    }
    
    if (MENU_NO == 7 && MENUCOORD[5] == i)
        draw_set_color(c_red);
    
    if (TYPE != 1)
    {
        var col = draw_get_color();
        var alf = draw_get_alpha();
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 1, BOX_Y1 - 1, XL + 2, 1, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 1, BOX_Y1 + YL, XL + 2, 1, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 1, BOX_Y1 - 1, 1, YL + 2, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 + XL, BOX_Y1 - 1, 1, YL + 2, 0, col, alf);
    }
    
    if (TYPE == 1)
    {
        var col = draw_get_color();
        var alf = draw_get_alpha();
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y1 - 2, (BOX_X2 - BOX_X1) + 4, 2, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y2, (BOX_X2 - BOX_X1) + 4, 2, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X1 - 2, BOX_Y1 - 2, 2, (BOX_Y2 - BOX_Y1) + 4, 0, col, alf);
        draw_sprite_ext(spr_pxwhite, 0, BOX_X2, BOX_Y1 - 2, 2, (BOX_Y2 - BOX_Y1) + 4, 0, col, alf);
    }
    
    if (CONT_THIS < 4)
    {
        scr_84_set_draw_font("main");
        draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 5, NAME[i]);
        draw_set_halign(fa_right);
        draw_text_shadow(BOX_X1 + 180, BOX_Y1 + 5, TIME_STRING[i]);
        draw_set_halign(fa_left);
    }
    
    if (CONT_THIS >= 1)
    {
        if (TYPE == 0)
        {
            if (MENU_NO == 1)
            {
                SELTEXT_C = " ";
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_116_0"); // CONTINUE
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_116_1"); // BACK
                
                if (FILE[MENUCOORD[0]] == 0)
                {
                    SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_117_0"); // BEGIN
                    SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_117_1"); // BACK
                }
            }
            
            if (MENU_NO == 4)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_119_0"); // OVERWRITE
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_119_1"); // DO NOT
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_119_2"); // IT WILL BE SUBSUMED.
            }
            
            if (MENU_NO == 6)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_120_0"); // YES
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_120_1"); // NO
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_120_2"); // TRULY ERASE IT?
            }
            
            if (MENU_NO == 7)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_121_0"); // ERASE
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_121_1"); // DO NOT
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_121_2"); // THEN IT WILL BE DESTROYED.
            }
        }
        else
        {
            if (MENU_NO == 1)
            {
                SELTEXT_C = " ";
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_128_0"); // Continue
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_128_1"); // Back
                
                if (FILE[MENUCOORD[0]] == 0)
                {
                    SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_129_0"); // Start
                    SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_129_1"); // Back
                }
            }
            
            if (MENU_NO == 4)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_131_0"); // Yes
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_131_1"); // No
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_131_2"); // Copy over this file?
            }
            
            if (MENU_NO == 6)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_132_0"); // Yes
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_132_1"); // No
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_132_2"); // Erase this file?
            }
            
            if (MENU_NO == 7)
            {
                SELTEXT_A = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_133_0"); // Yes!
                SELTEXT_B = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_133_1"); // No!
                SELTEXT_C = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_133_2"); // Really erase it?
            }
        }
        
        draw_set_color(COL_B);
        
        if (MENU_NO == 7)
            draw_set_color(c_red);
        
        draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 5, SELTEXT_C);
        draw_set_color(COL_A);
        
        if (MENUCOORD[MENU_NO] == 0)
        {
            draw_set_color(COL_B);
            HEARTX = 75;
            HEARTY = 81 + ((YL + YS) * MENUCOORD[PREV_MENU]);
        }
        
        draw_text_shadow(BOX_X1 + 35, BOX_Y1 + 22, SELTEXT_A);
        draw_set_color(COL_A);
        
        if (MENUCOORD[MENU_NO] == 1)
        {
            draw_set_color(COL_B);
            HEARTX = 165;
            HEARTY = 81 + ((YL + YS) * MENUCOORD[PREV_MENU]);
        }
        
        draw_text_shadow(BOX_X1 + 125, BOX_Y1 + 22, SELTEXT_B);
    }
    else
    {
        draw_text_shadow(BOX_X1 + 25, BOX_Y1 + 22, PLACE[i]);
    }
}

COPYTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_200_0", "COPY"); // <localization fetch error>
ERASETEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_201_0", "ERASE"); // <localization fetch error>
CHSELECTTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_202_0", "CHAPTER SELECT"); // <localization fetch error>
QUITTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_203_0", "QUIT"); // <localization fetch error>
CONFIGTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_204_0", "CONFIG"); // <localization fetch error>

if (TYPE == 1)
{
    COPYTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_200_1", "Copy"); // <localization fetch error>
    ERASETEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_201_1", "Erase"); // <localization fetch error>
    CHSELECTTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_202_1", "Chapter Select"); // <localization fetch error>
    QUITTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_203_1", "Quit"); // <localization fetch error>
    CONFIGTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_204_1", "Config"); // <localization fetch error>
}

var xx_center = 160;
var xx_config = xx_center - (string_width(CONFIGTEXT) / 2);
var xx_erase = xx_center - (string_width(ERASETEXT) / 2);
var xx_left_edge = min(xx_config, xx_erase) - 15 - 6;
var xx_copy = xx_left_edge - string_width(COPYTEXT);
var xx_right_edge = max(xx_config + string_width(CONFIGTEXT), xx_erase + string_width(ERASETEXT)) + 15 + 6;
var xx_select = xx_right_edge;
var xx_quit = xx_right_edge;

if (MENU_NO >= 0)
{
    if (MENU_NO == 0 || MENU_NO == 2 || MENU_NO == 3 || MENU_NO == 5)
    {
        if (MENUCOORD[MENU_NO] >= 0 && MENUCOORD[MENU_NO] <= 2)
        {
            HEARTX = 65;
            HEARTY = 72 + ((YL + YS) * MENUCOORD[MENU_NO]);
        }
        
        if (MENUCOORD[MENU_NO] == 3)
        {
            HEARTX = xx_copy - 15;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 4)
        {
            HEARTX = xx_erase - 15;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 5)
        {
            HEARTX = xx_select - 15;
            HEARTY = 195;
        }
        
        if (MENUCOORD[MENU_NO] == 6)
        {
            HEARTX = xx_config - 15;
            HEARTY = 215;
        }
        
        if (MENUCOORD[MENU_NO] == 7)
        {
            HEARTX = xx_quit - 15;
            HEARTY = 215;
        }
    }
    
    if (MENU_NO >= 2)
    {
        CANCELTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_189_0"); // CANCEL
        
        if (TYPE == 1)
            CANCELTEXT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_190_0"); // Cancel
        
        draw_set_color(COL_A);
        
        if (MENUCOORD[PREV_MENU] == 3)
            draw_set_color(COL_B);
        
        draw_text_shadow(80, 190, CANCELTEXT);
    }
    
    if (MENU_NO == 0 || MENU_NO == 1)
    {
        scr_84_set_draw_font("main");
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 3)
            draw_set_color(COL_B);
        
        draw_text_shadow(xx_copy, 190, COPYTEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 4)
            draw_set_color(COL_B);
        
        draw_text_shadow(xx_erase, 190, ERASETEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 5)
            draw_set_color(COL_B);
        
        draw_text_shadow(xx_select, 190, CHSELECTTEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 6)
            draw_set_color(COL_B);
        
        draw_text_shadow(xx_config, 210, CONFIGTEXT);
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 7)
            draw_set_color(COL_B);
        
        if (CANQUIT)
            draw_text_shadow(xx_quit, 210, QUITTEXT);
        
        draw_set_color(COL_A);
        
        if (MENUCOORD[0] == 6)
            draw_set_color(COL_B);
        
        draw_text_shadow(xx_config, 210, CONFIGTEXT);
    }
    
    scr_84_set_draw_font("main");
    
    if (TYPE == 1)
    {
        draw_set_alpha(0.4);
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_text_transformed(320, 230, scr_84_get_subst_string(scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_205_0", "DELTARUNE ~1 (C) Toby Fox 2018-2025 "), string(version_text)), 0.5, 0.5, 0); // <localization fetch error>
        draw_set_halign(fa_left);
    }
    else
    {
        draw_set_color(COL_A);
        draw_text_transformed(248, 230, version_text, 0.5, 0.5, 0);
        draw_set_color(c_white);
    }
    
    scr_84_set_draw_font("main");
    draw_set_alpha(1);
    
    if (MESSAGETIMER <= 0)
    {
        if (TYPE == 0)
        {
            if (MENU_NO == 0 || MENU_NO == 1)
                TEMPCOMMENT = " ";
            
            if (MENU_NO == 2)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_216_0"); // CHOOSE THE ONE TO COPY.
            
            if (MENU_NO == 3)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_217_0"); // CHOOSE THE TARGET FOR THE REFLECTION.
            
            if (MENU_NO == 4)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_218_0"); // IT WILL BE SUBSUMED.
            
            if (MENU_NO == 5 || MENU_NO == 6 || MENU_NO == 7)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_219_0"); // SELECT THE ONE TO ERASE.
        }
        
        if (TYPE == 1)
        {
            if (MENU_NO == 0 || MENU_NO == 1)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_223_0"); // Please select a file.
            
            if (MENU_NO == 2)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_224_0"); // Choose a file to copy.
            
            if (MENU_NO == 3)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_225_0"); // Choose a file to copy to.
            
            if (MENU_NO == 4)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_226_0"); // The file will be overwritten.
            
            if (MENU_NO == 5 || MENU_NO == 6 || MENU_NO == 7)
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_227_0"); // Choose a file to erase.
        }
    }
    
    draw_set_color(COL_B);
    draw_text_shadow(40, 30, TEMPCOMMENT);
    MESSAGETIMER -= 1;
}

if (abs(HEARTX - HEARTXCUR) <= 2)
    HEARTXCUR = HEARTX;

if (abs(HEARTY - HEARTYCUR) <= 2)
    HEARTYCUR = HEARTY;

HEARTXCUR += ((HEARTX - HEARTXCUR) / 2);
HEARTYCUR += ((HEARTY - HEARTYCUR) / 2);
draw_sprite(spr_heartsmall, 0, HEARTXCUR, HEARTYCUR);

if (TYPE == 1)
    draw_set_color(c_white);
else
    draw_set_color(COL_A);

scr_84_set_draw_font("main");
draw_text_shadow(__view_get(0, 0) + 8, __view_get(1, 0) + 4, scr_84_get_lang_string("DEVICE_MENU_slash_Draw_0_gml_206_0", "CHAPTER 1")); // <localization fetch error>
draw_set_color(c_white);
