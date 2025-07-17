timer += 1;

if (timer == 1)
{
    song0 = snd_init("dontforget.ogg");
    song1 = mus_play(song0);
}

if (timer == timings[0])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_13_0"); // When the

if (timer == timings[1])
{
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_19_0"); // light is running low
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_21_0"); // DELTARUNE
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_22_0"); // Chapter 1
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_23_0"); // <localization fetch error>
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_24_0"); // by Toby Fox
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_25_0"); // <localization fetch error>
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_26_0"); // <localization fetch error>
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer == timings[2])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_33_0"); // And the shadows start to grow

if (timer == timings[3])
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_38_0"); // Main Artist, Animator, & Cleanup
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_39_0"); // (BG, Overworld, Battle)
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_40_0"); // (Sepia and Menu Art, Borders)
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_41_0"); // <localization fetch error>
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_42_0"); // Temmie Chang
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_43_0"); // <localization fetch error>
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer == timings[4])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_54_0"); // And the places that you know

if (timer == timings[5])
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_59_0"); // Lancer, Rudinn, Hathy
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_60_0"); // Clover, King, Jevil
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_61_0"); // Original Character Designs
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_62_0"); // <localization fetch error>
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_63_0"); // <localization fetch error>
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_64_0"); // Kanotynes
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer == timings[6])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_70_0"); // Seem like fantasy

if (timer == timings[7])
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_95_0"); // Japanese Localization
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_96_0"); // 8-4, Ltd.
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_97_0"); // <localization fetch error>
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_98_0"); // Translator
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_99_0"); // Keiko Fukuichi
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_100_0"); // <localization fetch error>
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer >= timings[8] && timer <= timings[9])
{
    creditalpha -= 0.025;
    textalpha -= 0.025;
}

if (timer == timings[10])
{
    textalpha = 1;
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_89_0"); // There's a
}

if (timer == timings[11])
{
    creditalpha = 1;
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_101_0"); // <localization fetch error>
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_102_0"); // <localization fetch error>
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_103_0"); // <localization fetch error>
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_104_0"); // <localization fetch error>
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_105_0"); // <localization fetch error>
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_106_0"); // <localization fetch error>
    line[6] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_107_0"); // "Fred Wood";
    line[7] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_108_0"); // "Henri Beeres (Enjl)";

    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
    
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_109_0"); // Light inside your soul
}

if (timer == timings[12])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_113_0"); // That's still shining in the cold

if (timer == timings[13])
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_119_0"); // Don't Forget (Vocal Excerpt)
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_120_0"); // Piano Arranged & Vocals Performed by
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_121_0"); // Laura Shigihara
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_122_0"); // <localization fetch error>
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_123_0"); // <localization fetch error>
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_124_0"); // <localization fetch error>
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer == timings[14])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_131_0"); // With the truth

if (timer == timings[15])
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_152_0"); // Special Thanks
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_153_0"); // Chess (Support)
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_154_0"); // <localization fetch error>
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_155_0"); // <localization fetch error>
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_156_0"); // <localization fetch error>
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_157_0"); // <localization fetch error>
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer == timings[16])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_147_0"); // The promise in our hearts

if (timer == timings[17])
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_160_0"); // <localization fetch error>
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_161_0"); // <localization fetch error>
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_162_0"); // <localization fetch error>
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_163_0"); // <localization fetch error>
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_164_0"); // <localization fetch error>
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_165_0"); // <localization fetch error>
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer >= timings[18] && timer <= timings[19])
{
    creditalpha -= 0.02;
    textalpha -= 0.02;
}

if (timer == timings[20])
{
    textalpha = 1;
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_174_0"); // Don't forget
}

if (timer == timings[21])
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_180_0"); // I'm with you in the dark

if (timer >= timings[22])
{
    if (timer <= timings[23] && creditalpha < 1)
        creditalpha += 0.01;
    
    if (timer >= timings[23] && creditalpha > 0)
        creditalpha -= 0.01;
    
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_187_0"); // To be continued
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_188_0"); // in Chapter 2
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_189_0"); // <localization fetch error>
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_190_0"); // <localization fetch error>
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_191_0"); // <localization fetch error>
    line[5] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_192_0"); // <localization fetch error>
    textalpha -= 0.01;
    
    for (var i = 0; i < 8; i++)
    {
        linecolor[i] = c_white;
        
        if (string_char_at(line[i], 1) == "~")
        {
            line[i] = string_copy(line[i], 2, string_length(line[i]) - 1);
            linecolor[i] = c_ltgray;
        }
    }
}

if (timer == timings[24])
    snd_free(song0);

if (timer == timings[25])
    room_goto(room_chapter_continue);
