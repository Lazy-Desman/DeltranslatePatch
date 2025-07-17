var flag, i, spr_arr, snd_arr;
function scr_init_localization() //gml_Script_scr_init_localization
{
    if (!variable_global_exists("lang"))
    {
        ini_open("true_config.ini")
        if ini_key_exists("LANG", "LANG_DT")
            global.lang = ini_read_string("LANG", "LANG_DT", "en")
        else
            global.lang = os_get_language()
        ini_close()
        flag = 0
        for (i = 0; i < array_length(global.langs_names); i++)
        {
            if (global.langs_names[i] == global.lang)
            {
                flag = 1
                break
            }
        }
        if (!flag)
            global.lang = "en"
        if (!ds_map_exists(global.langs_settings, global.lang)) {
            global.lang = global.langs_names[0]
        }
    }
    if (!variable_global_exists("lang_loaded")) {
        global.lang_loaded = ""
        global.font_map = ds_map_create()
        global.lang_sprites = ds_map_create()
        global.lang_sounds = ds_map_create()
    }
    if (global.lang_loaded != global.lang)
    {
	    global.lang_loaded = global.lang
        ds_map_destroy(global.font_map)
        ds_map_destroy(global.lang_sprites)
        ds_map_destroy(global.lang_sounds)
        global.font_map = ds_map_create()
        global.lang_sprites = ds_map_create()
        global.lang_sounds = ds_map_create()
        var fonts_arr = [["fnt_main", 12], ["fnt_mainbig", 24]]
        font_add_enable_aa(false)
        for (i = 0; i < array_length(fonts_arr); i++)
            add_font(fonts_arr[i][0], fonts_arr[i][1])
        global.lang_map = ds_map_create()
        scr_lang_load()
    }
}

