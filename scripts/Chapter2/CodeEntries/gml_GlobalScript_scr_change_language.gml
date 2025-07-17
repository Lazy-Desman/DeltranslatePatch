function scr_change_language(argument0) //gml_Script_scr_change_language
{
    if (is_undefined(argument0))
        argument0 = 1
    var target_lang_ind = 0
    for (i = 0; i < array_length(global.langs_names); i++) {
        if (global.langs_names[i] == global.lang) {
            target_lang_ind = i
            break
        }
    }
    var target_lang = global.langs_names[(target_lang_ind + argument0 + array_length(global.langs_names)) % array_length(global.langs_names)]
    global.lang = target_lang

    ossafe_ini_open("true_config.ini")
    ini_write_string("LANG", "LANG_DT", global.lang)
    ossafe_ini_close()
    ossafe_savedata_save()
    scr_init_localization()

    scr_windowcaption(window_get_caption())
}

