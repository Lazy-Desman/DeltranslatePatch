option = 0

scale = 1
xx_options = 25 * scale
xxoff_heart = 15 * scale
yy_options = 50 * scale
yyoff_options = 25 * scale
xx_mid = 160 * scale

yy_return = (205 + 12) * scale

update_strings = function() {
    config_text = stringsetloc("LANGUAGE CONFIG", "obj_lang_settings_1_0")
    return_text = stringsetloc("Return", "obj_lang_settings_2_0")
    yes_text = stringsetloc("Yes", "obj_lang_settings_3_0")
    no_text = stringsetloc("No", "obj_lang_settings_4_0")
    lang_choice_text = stringsetloc("Language", "obj_lang_settings_5_0") + ": "
    spec_mode_text = stringsetloc("Special Mode", "obj_lang_settings_6_0") + ": "
    tr_songs_text = stringsetloc("Translated Voices", "obj_lang_settings_7_0") + ": "
    spec_mode_desc_disabled = stringsetloc("Special Mode disabled\ndescription (leave space\nif no need)", "obj_lang_settings_8_0")
    spec_mode_desc_enabled = stringsetloc("Special Mode enabled\ndescription (leave space\nif no need)", "obj_lang_settings_9_0")

    options = ["language"]

    spec_mode_switch = false
    translated_songs_switch = false

    if (get_lang_setting("special_mode")) {
        array_push(options, "special_mode")
        spec_mode_switch = true
    }

    if (get_lang_setting("enable_translated_songs_switch")) {
        array_push(options, "enable_translated_songs_switch")
        translated_songs_switch = true
    }

    options_count = array_length(options)
}



SUBTYPE = 0
DOORDRAWN = 1;
CH = string(global.chapter);
if (CH == "1")
    DOORDRAWN = 0;
if ossafe_file_exists("filech" + CH + "_3")
    SUBTYPE = 1
if ossafe_file_exists("filech" + CH + "_4")
    SUBTYPE = 1
if ossafe_file_exists("filech" + CH + "_5")
    SUBTYPE = 1
BGMADE = 0
BG_ALPHA = 0.5
BG_SINER = DEVICE_MENU.BG_SINER
OB_DEPTH = DEVICE_MENU.OB_DEPTH
obacktimer = DEVICE_MENU.obacktimer
OBM = DEVICE_MENU.OBM
BGSINER = DEVICE_MENU.BGSINER
BGMAGNITUDE = DEVICE_MENU.BGMAGNITUDE
COL_A = DEVICE_MENU.COL_A
COL_B = DEVICE_MENU.COL_B
COL_PLUS = DEVICE_MENU.COL_PLUS
BGMADE = 1
BG_ALPHA = DEVICE_MENU.BG_ALPHA
ANIM_SINER = DEVICE_MENU.ANIM_SINER
ANIM_SINER_B = DEVICE_MENU.ANIM_SINER_B
TRUE_ANIM_SINER = DEVICE_MENU.TRUE_ANIM_SINER
if (SUBTYPE == 0) {
    COL_A = DEVICE_MENU.COL_A
    COL_B = DEVICE_MENU.COL_B
    COL_PLUS = DEVICE_MENU.COL_PLUS
    BGMADE = 0
}

update_strings()

instance_deactivate_object(DEVICE_MENU)