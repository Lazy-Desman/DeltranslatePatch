if (timer == 0)
{
    snd_free_all()
    song0 = snd_init("ch2_credits.ogg")
    song1 = mus_play(song0)
    line[0] = stringsetloc("DELTARUNE", "obj_credits_slash_Step_0_gml_21_0")
    line[1] = stringsetloc("Chapter 2", "obj_credits_slash_Step_0_gml_22_0")
    line[2] = stringsetloc(" ", "obj_credits_slash_Step_0_gml_23_0")
    line[3] = stringsetloc("by Toby Fox", "obj_credits_slash_Step_0_gml_24_0")
}
timer++
if (timer == 100)
{
    line[0] = stringsetloc("-Main Artist-", "obj_credits_2_slash_Step_0_gml_27_0")
    line[1] = stringsetloc("-Main Animator-", "obj_credits_2_slash_Step_0_gml_28_0")
    line[2] = stringsetloc("Temmie Chang", "obj_credits_2_slash_Step_0_gml_29_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_30_0")
    line[4] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_31_0")
    line[5] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_32_0")
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_33_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_34_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 201)
{
    line[0] = stringsetloc("-Main Team-", "obj_credits_2_slash_Step_0_gml_42_0")
    line[1] = stringsetloc("Sarah O'Donnell", "obj_credits_2_slash_Step_0_gml_43_0")
    line[2] = stringsetloc("Taxiderby", "obj_credits_2_slash_Step_0_gml_44_0")
    line[3] = stringsetloc("Fred Wood", "obj_credits_2_slash_Step_0_gml_45_0")
    line[4] = stringsetloc("Jean Canellas", "obj_credits_2_slash_Step_0_gml_46_0")
    line[5] = stringsetloc("Xan Wetherall", "obj_credits_2_slash_Step_0_gml_47_0")
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_48_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_49_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 302)
{
    creditalpha = 1
    line[0] = stringsetloc("-BG Concept Art-", "obj_credits_2_slash_Step_0_gml_68_0")
    line[1] = stringsetloc("(Cyber Field, City, Mansion)", "obj_credits_2_slash_Step_0_gml_69_0")
    line[2] = stringsetloc("Gigi DG", "obj_credits_2_slash_Step_0_gml_70_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_71_0")
    line[4] = stringsetloc("-Dark World Costume Design-", "obj_credits_2_slash_Step_0_gml_72_0")
    line[5] = stringsetloc("Gigi DG [Kris, Susie]", "obj_credits_2_slash_Step_0_gml_73_0")
    line[6] = stringsetloc("Tcheska Lynn B (chess) [Berdly]", "obj_credits_2_slash_Step_0_gml_74_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_75_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 403)
{
    line[0] = stringsetloc("-Guest Character Design-", "obj_credits_2_slash_Step_0_gml_88_0")
    line[1] = stringsetloc("(Lancer, Rudinn, Hathy)", "obj_credits_2_slash_Step_0_gml_89_0")
    line[2] = stringsetloc("(Clover, King, Jevil)", "obj_credits_2_slash_Step_0_gml_90_0")
    line[3] = stringsetloc("Kanotynes", "obj_credits_2_slash_Step_0_gml_91_0")
    line[4] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_92_0")
    line[5] = stringsetloc("-Singing This Song-", "obj_credits_2_slash_Step_0_gml_93_0")
    line[6] = stringsetloc("Laura Shigihara", "obj_credits_2_slash_Step_0_gml_94_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_95_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 503)
{
    textalpha = 1
    line[0] = stringsetloc("-Guest Character Design-", "obj_credits_2_slash_Step_0_gml_109_0")
    line[1] = stringsetloc("(Poppup, Ambyu-Lance, Hacker, etc.)", "obj_credits_2_slash_Step_0_gml_110_0")
    line[2] = stringsetloc("Samanthuel Gillson (splendidland)", "obj_credits_2_slash_Step_0_gml_111_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_112_0")
    line[4] = stringsetloc("-Guest Character Design-", "obj_credits_2_slash_Step_0_gml_113_0")
    line[5] = stringsetloc("(Sweet, Cap'n, K_K)", "obj_credits_2_slash_Step_0_gml_114_0")
    line[6] = stringsetloc("(Tasque Manager)", "obj_credits_2_slash_Step_0_gml_115_0")
    line[7] = stringsetloc("NELNAL", "obj_credits_2_slash_Step_0_gml_116_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 604)
{
    creditalpha = 1
    line[0] = stringsetloc("-Pixel Art Assistance-", "obj_credits_2_slash_Step_0_gml_131_0")
    line[1] = stringsetloc("Shawn (puppiesandanime)", "obj_credits_2_slash_Step_0_gml_132_0")
    line[2] = stringsetloc("Kenju", "obj_credits_2_slash_Step_0_gml_133_0")
    line[3] = stringsetloc("Tcheska Lynn B (chess)", "obj_credits_2_slash_Step_0_gml_134_0")
    line[4] = stringsetloc("Satoshi Maruyama", "obj_credits_2_slash_Step_0_gml_135_0")
    line[5] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_136_0")
    line[6] = stringsetloc("-Development Tools (Cool)-", "obj_credits_2_slash_Step_0_gml_137_0")
    line[7] = stringsetloc("Juju Adams", "obj_credits_2_slash_Step_0_gml_138_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 705)
{
    line[0] = stringsetloc("-Programming Assistance-", "obj_credits_2_slash_Step_0_gml_151_0")
    line[1] = stringsetloc("Sara Spalding", "obj_credits_2_slash_Step_0_gml_152_0")
    line[2] = stringsetloc("Lars Korendijk", "obj_credits_2_slash_Step_0_gml_153_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_154_0")
    line[4] = stringsetloc("-Cutscene Assistance-", "obj_credits_2_slash_Step_0_gml_155_0")
    line[5] = stringsetloc("Tcheska Lynn B (chess)", "obj_credits_2_slash_Step_0_gml_156_0")
    line[6] = stringsetloc("Chelsea Saunders (pixelatedcrown)", "obj_credits_2_slash_Step_0_gml_157_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_158_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 805)
{
    creditalpha = 1
    line[0] = stringsetloc("-Music Assistance-", "obj_credits_2_slash_Step_0_gml_171_0")
    line[1] = stringsetloc("Lena Raine", "obj_credits_2_slash_Step_0_gml_172_0")
    line[2] = stringsetloc("Marcy Nabors", "obj_credits_2_slash_Step_0_gml_173_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_174_0")
    line[4] = stringsetloc("-UT Character Design-", "obj_credits_2_slash_Step_0_gml_175_0")
    line[5] = stringsetloc("Betty Kwong (Temmie)", "obj_credits_2_slash_Step_0_gml_176_0")
    line[6] = stringsetloc("Magnolia Porter (Snowdrake, Monster Kid)", "obj_credits_2_slash_Step_0_gml_177_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_178_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 906)
{
    line[0] = stringsetloc("-Japanese Localization-", "obj_credits_2_slash_Step_0_gml_191_0")
    line[1] = stringsetloc("8-4 Ltd.", "obj_credits_2_slash_Step_0_gml_192_0")
    line[2] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_193_0")
    line[3] = stringsetloc("-Translator-", "obj_credits_2_slash_Step_0_gml_194_0")
    line[4] = stringsetloc("Keiko Fukuichi", "obj_credits_2_slash_Step_0_gml_195_0")
    line[5] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_196_0")
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_197_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_198_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 1007)
{
    line[0] = stringsetloc("-Localization Producers-", "obj_credits_2_slash_Step_0_gml_211_0")
    line[1] = stringsetloc("Graeme Howard", "obj_credits_2_slash_Step_0_gml_212_0")
    line[2] = stringsetloc("John Ricciardi", "obj_credits_2_slash_Step_0_gml_213_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_214_0")
    line[4] = stringsetloc("-Localization Support-", "obj_credits_2_slash_Step_0_gml_215_0")
    line[5] = stringsetloc("Tina Carter", "obj_credits_2_slash_Step_0_gml_216_0")
    line[6] = stringsetloc("Yutaka Ohbuchi", "obj_credits_2_slash_Step_0_gml_217_0")
    line[7] = stringsetloc("Sami Ragone", "obj_credits_2_slash_Step_0_gml_218_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 1108)
{
    line[0] = stringsetloc("-Platform Programming-", "obj_credits_2_slash_Step_0_gml_231_0")
    line[1] = stringsetloc("Sarah O'Donnell", "obj_credits_2_slash_Step_0_gml_232_0")
    line[2] = stringsetloc("Henri Beeres (Enjl)", "obj_credits_2_slash_Step_0_gml_233_0")
    line[3] = stringsetloc("-Programming Support-", "obj_credits_2_slash_Step_0_gml_234_0")
    line[4] = stringsetloc("Gregg Tavares", "obj_credits_2_slash_Step_0_gml_235_0")
    line[5] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_236_0")
    line[6] = stringsetloc("-Japanese Graphics-", "obj_credits_2_slash_Step_0_gml_237_0")
    line[7] = stringsetloc("256graph", "obj_credits_2_slash_Step_0_gml_238_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 1208)
{
    line[0] = stringsetloc("-QA-", "obj_credits_2_slash_Step_0_gml_251_0")
    line[1] = stringsetloc("DIGITAL HEARTS Co., Ltd.", "obj_credits_2_slash_Step_0_gml_252_0")
    line[2] = stringsetloc("Tomohiro Nakai [QA Project Manager]", "obj_credits_2_slash_Step_0_gml_253_0")
    line[3] = stringsetloc("Tomoyoshi Yamashita [QA Lead]", "obj_credits_2_slash_Step_0_gml_254_0")
    line[4] = stringsetloc("Ryohei Kishimoto [QA Assistant Lead]", "obj_credits_2_slash_Step_0_gml_255_0")
    line[5] = stringsetloc("Shinji Yasue [Sales Dept]", "obj_credits_2_slash_Step_0_gml_256_0")
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_257_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_258_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 1309)
{
    line[0] = stringsetloc("-Super Testers-", "obj_credits_2_slash_Step_0_gml_271_0")
    line[1] = stringsetloc("AlexMdle", "obj_credits_2_slash_Step_0_gml_272_0")
    line[2] = stringsetloc("PureQuestion", "obj_credits_2_slash_Step_0_gml_273_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_274_0")
    line[4] = stringsetloc("-Website-", "obj_credits_2_slash_Step_0_gml_275_0")
    line[5] = stringsetloc("Brian Coia", "obj_credits_2_slash_Step_0_gml_276_0")
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_277_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_278_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 1410)
{
    line[0] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_300_0")
    line[1] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_301_0")
    line[2] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_302_0")
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_303_0")
    line[4] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_304_0")
    line[5] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_305_0")
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_306_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_307_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
    drawtesters = true
}
if (timer == 1511)
{
    drawtesters = false
    line[0] = stringsetloc("-Special Thanks-", "obj_credits_2_slash_Step_0_gml_314_0")
    line[1] = stringsetloc("Hiroko Minamoto", "obj_credits_2_slash_Step_0_gml_315_0")
    line[2] = stringsetloc("Fontworks Inc.", "obj_credits_2_slash_Step_0_gml_316_0")
    line[3] = stringsetloc("Yutaka Sato (Happy Ruika)", "obj_credits_2_slash_Step_0_gml_317_0")
    line[4] = stringsetloc("All 8-4 & Fangamer Staff", "obj_credits_2_slash_Step_0_gml_318_0")
    line[5] = stringsetloc("Claire & Andrew", "obj_credits_2_slash_Step_0_gml_319_0")
    line[6] = stringsetloc("Brian Lee", "obj_credits_2_slash_Step_0_gml_320_0")
    line[7] = stringsetloc("YoYo Games", "obj_credits_2_slash_Step_0_gml_321_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
}
if (timer == 1611)
{
    creditalpha = 0
    line[0] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_339_0")
    line[1] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_340_0")
    line[2] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_341_0")
    line[3] = stringsetloc("To be continued", "obj_credits_slash_Step_0_gml_191_0")
    line[4] = stringsetloc(" ", "obj_credits_slash_Step_0_gml_192_0")
    line[5] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_344_0")
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_345_0")
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_346_0")
    for (var i = 0; i < 8; i++) {
        linecolor[i] = c_white
        if (string_char_at(line[i], 1) == "-") {
            linecolor[i] = menugray
        }
    }
    textalpha -= 0.01
}
if (timer > 1641 && timer < 1711)
{
    if (creditalpha != 1)
        creditalpha += 0.02
}
if (timer >= 1801)
{
    creditalpha -= 0.05
    if (creditalpha < -0.1)
    {
        room_goto(room_chapter_continue);
    }
}
if (timer > 1744 && timer < 1910)
    creditalpha += 0.02
if (timer > 1910)
{
    creditalpha -= 0.02;
    
    if (creditalpha <= -0.5)
    {
        global.chapter_return = -1;
        game_restart_true();
    }
}

