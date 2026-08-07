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

var back_pressed = button2_p()

if (option < options_count) {
    if (options[option] == "language") {
        if (button1_p()) {
            var link = get_lang_setting("link", "")
            if (link != "") {
                audio_play_sound(snd_menumove, 50, 0)
                url_open(link)
            }
        }
    } else

    if (options[option] == "special_mode") {
        if (left_p() || right_p() || button1_p()) {
            ossafe_ini_open("true_config.ini")
            global.special_mode = !global.special_mode
            ini_write_string("LANG", "special_mode", global.special_mode)
            ossafe_ini_close()
            ossafe_savedata_save()

            audio_play_sound(snd_menumove, 50, 0)
        }
    } else

    if (options[option] == "enable_translated_songs_switch") {
        if (left_p() || right_p() || button1_p()) {
            ossafe_ini_open("true_config.ini")
            global.translated_songs = !global.translated_songs
            ini_write_string("LANG", "translated_songs", global.translated_songs)
            ossafe_ini_close()
            ossafe_savedata_save()

            audio_play_sound(snd_menumove, 50, 0)
        }
    }
} //else

if ((option == options_count && button1_p()) || back_pressed) {
    if (back_pressed) {
        audio_play_sound(snd_swing, 50, 0)
    } else {
        audio_play_sound(snd_menumove, 50, 0)
    }
    room_restart()
}