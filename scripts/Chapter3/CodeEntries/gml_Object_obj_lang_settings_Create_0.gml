
option = 0
options_count = 1

spec_mode_switch = false
translated_songs_switch = false

if (get_lang_setting("special_mode")) {
    options_count++
    spec_mode_switch = true
}

if (get_lang_setting("enable_translated_songs_switch")) {
    options_count++
    translated_songs_switch = true
}

scale = 1
xx_options = 25 * scale
xxoff_heart = 15 * scale
yy_options = 50 * scale
yyoff_options = 25 * scale

HEARTX = xx_options - xxoff_heart
HEARTY = yy_options + 4 * scale + option * yyoff_options
HEARTXCUR = HEARTX
HEARTYCUR = HEARTY

xx_center = (140 + 24) * scale

yy_return = (205 + 12) * scale
yy_spec_mode_desc = yy_options + yyoff_options * options_count

config_text = stringsetloc("LANGUAGE CONFIG", "obj_lang_settings_1_0")
return_text = stringsetloc("Return", "obj_lang_settings_2_0")
yes_text = stringsetloc("Yes", "obj_lang_settings_3_0")
no_text = stringsetloc("No", "obj_lang_settings_4_0")
lang_choice_text = stringsetloc("Language", "obj_lang_settings_5_0") + ": "
spec_mode_text = stringsetloc("Special Mode", "obj_lang_settings_6_0") + ": "
tr_songs_text = stringsetloc("Translated Voices", "obj_lang_settings_7_0") + ": "
spec_mode_desc_disabled = stringsetloc("Special Mode disabled\ndescription (leave space\nif no need)", "obj_lang_settings_8_0")
spec_mode_desc_enabled = stringsetloc("Special Mode enabled\ndescription (leave space\nif no need)", "obj_lang_settings_9_0")


// Говна из dEVICE_MENU для задников

TYPE = 1
SUBTYPE = 0
CH = string(global.chapter)
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
COL_A = DEVICE_MENU.COL_A
COL_B = DEVICE_MENU.COL_B
COL_PLUS = DEVICE_MENU.COL_PLUS
if (TYPE == 1) {
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
}



instance_deactivate_object(DEVICE_MENU)
