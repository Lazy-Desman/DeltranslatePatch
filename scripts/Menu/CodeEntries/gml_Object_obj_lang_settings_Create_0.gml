instance_deactivate_all(true)
instance_activate_object(obj_input)
instance_activate_object(obj_gamecontroller)

option = max(0, 0)
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

scale = 2
xx_options = 25 * scale
xxoff_heart = 15 * scale
yy_options = 50 * scale
yyoff_options = 25 * scale

yy_return = (205 + 12) * scale
yy_spec_mode_desc = yy_options + yyoff_options * options_count

config_text = scr_get_lang_string("LANGUAGE CONFIG", "obj_lang_settings_1_0")
return_text = scr_get_lang_string("Return", "obj_lang_settings_2_0")
yes_text = scr_get_lang_string("Yes", "obj_lang_settings_3_0")
no_text = scr_get_lang_string("No", "obj_lang_settings_4_0")
lang_choice_text = scr_get_lang_string("Language", "obj_lang_settings_5_0") + ": "
spec_mode_text = scr_get_lang_string("Special Mode", "obj_lang_settings_6_0") + ": "
tr_songs_text = scr_get_lang_string("Translated OSTs", "obj_lang_settings_7_0") + ": "
spec_mode_desc_disabled = scr_get_lang_string("Special Mode disabled\ndescription (leave space\nif no need)", "obj_lang_settings_8_0")
spec_mode_desc_enabled = scr_get_lang_string("Special Mode enabled\ndescription (leave space\nif no need)", "obj_lang_settings_9_0")