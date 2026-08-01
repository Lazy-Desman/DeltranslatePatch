function scr_init_localization()
{
    if (!variable_global_exists("lang_loaded"))
    {
        global.lang_loaded = "";
        global.loaded_sprites = [];
        global.loaded_sounds = [];
        global.loaded_fonts = [];
    }
    
    if (global.lang_loaded != global.lang)
    {
        global.lang_loaded = global.lang;
        
        if (variable_global_exists("lang_map"))
        {
            for (var i = 0; i < array_length(global.loaded_sprites); i++)
                sprite_delete(global.loaded_sprites[i]);
            
            for (var i = 0; i < array_length(global.loaded_fonts); i++)
                font_delete(global.loaded_fonts[i]);
            
            for (var i = 0; i < array_length(global.loaded_sounds); i++)
                audio_destroy_stream(global.loaded_sounds[i]);
            
            ds_map_destroy(global.lang_map);
            ds_map_destroy(global.font_map);
            ds_map_destroy(global.chemg_sprite_map);
            ds_map_destroy(global.chemg_sound_map);
            global.chapter_lang_settings = {};
            global.loaded_sprites = [];
            global.loaded_sounds = [];
            global.loaded_fonts = [];
        }
        
        global.chapter_lang_settings = scr_load_json(get_lang_folder_path() + "chapter3/chapter_settings.json");
        global.font_map = ds_map_create();
        global.lang_missing_map = ds_map_create();
        global.chemg_sprite_map = ds_map_create();
        global.chemg_sound_map = ds_map_create();
        font_add_enable_aa(false);
        
        for (var i = 0; i < array_length(global.fonts_list); i++)
            add_font(global.fonts_list[i][0], global.fonts_list[i][1]);
        
        if (is_undefined(ds_map_find_value(global.font_map, "fnt_main_mono")) || ds_map_find_value(global.font_map, "fnt_main_mono") == -1)
            ds_map_set(global.font_map, "fnt_main_mono", ds_map_find_value(global.font_map, "fnt_main"));
        
        if (is_undefined(ds_map_find_value(global.font_map, "fnt_8bit_mixed")) || ds_map_find_value(global.font_map, "fnt_8bit_mixed") == -1)
            ds_map_set(global.font_map, "fnt_8bit_mixed", ds_map_find_value(global.font_map, "fnt_8bit"));
        
        for (var i = 0; i < array_length(global.sprites_list); i++)
            add_sprite(global.sprites_list[i]);
        
        var additional_funny_words = get_chapter_lang_setting("additional_funny_words", []);
        
        for (var i = 0; i < array_length(additional_funny_words); i++)
            add_sprite(additional_funny_words[i]);
        
        var sndm = global.chemg_sound_map;
        sound_symbols = get_chapter_lang_setting("button_sounds_symbols", ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?"]);
        set_chapter_lang_setting("button_sounds_symbols", sound_symbols);
        global.tvlandfont = font_add_sprite_ext(scr_84_get_sprite("spr_tvlandfont"), get_chapter_lang_setting("tvlangfont_string", "ABCDEFGHIJKLMNOPQRSTUVWXYZ.?!:…abcdefghijklmnopqrstuvwxyz1234567890"), 0, 1);
        
        for (var i = 0; i < array_length(sound_symbols); i++)
            add_sound("snd_speak_and_spell_" + scr_letter_fix(sound_symbols[i]), 1);
        
        for (var i = 0; i < array_length(global.sounds_list); i++)
            add_sound(global.sounds_list[i]);
        
        var additional_funny_sounds = get_chapter_lang_setting("additional_funny_sounds", []);
        
        for (var i = 0; i < array_length(additional_funny_sounds); i++)
            add_sound(additional_funny_sounds[i]);
        
        global.lang_map = ds_map_create();
        scr_lang_load();
        scr_ascii_input_names();
    }
}
