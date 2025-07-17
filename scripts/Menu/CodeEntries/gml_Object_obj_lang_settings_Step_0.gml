if (keyboard_check_released(ord("R"))) {
    room_restart()
}

if (down_p()) {
    option = (option + 1) % (options_count + 1)
    audio_play_sound(snd_menumove, 50, 0)
}

if (up_p()) {
    option = (option + options_count) % (options_count + 1)
    audio_play_sound(snd_menumove, 50, 0)
}

if (option == 0) {
    if (right_p() || left_p()) {
        change_language(right_p() - left_p())

        config_text = scr_get_lang_string("LANGUAGE CONFIG", "obj_lang_settings_1_0")
        return_text = scr_get_lang_string("Return", "obj_lang_settings_2_0")
        yes_text = scr_get_lang_string("Yes", "obj_lang_settings_3_0")
        no_text = scr_get_lang_string("No", "obj_lang_settings_4_0")
        lang_choice_text = scr_get_lang_string("Language", "obj_lang_settings_5_0") + ": "
        spec_mode_text = scr_get_lang_string("Special Mode", "obj_lang_settings_6_0") + ": "
        tr_songs_text = scr_get_lang_string("Translated Songs", "obj_lang_settings_7_0") + ": "
        spec_mode_desc_disabled = scr_get_lang_string("Special Mode disabled\ndescription (leave space\nif no need)", "obj_lang_settings_8_0")
        spec_mode_desc_enabled = scr_get_lang_string("Special Mode enabled\ndescription (leave space\nif no need)", "obj_lang_settings_9_0")
        
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
        
        yy_spec_mode_desc = yy_options + yyoff_options * options_count

        audio_play_sound(snd_menumove, 50, 0)
    }
}

if (spec_mode_switch && option == 1) {
    if (left_p() || right_p() || button1_p()) {
        ossafe_ini_open("true_config.ini")
        global.special_mode = !global.special_mode
        ini_write_string("LANG", "special_mode", global.special_mode)
        ossafe_ini_close()
        ossafe_savedata_save()

        audio_play_sound(snd_menumove, 50, 0)
    }
}

if (translated_songs_switch && option == spec_mode_switch + 1) {
    if (left_p() || right_p() || button1_p()) {
        ossafe_ini_open("true_config.ini")
        global.translated_songs = !global.translated_songs
        ini_write_string("LANG", "translated_songs", global.translated_songs)
        ossafe_ini_close()
        ossafe_savedata_save()

        audio_play_sound(snd_menumove, 50, 0)
    }
}

if (option == options_count && button1_p()) {
    audio_play_sound(snd_menumove, 50, 0)
    room_restart()
}