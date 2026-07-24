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
        
        global.chapter_lang_settings = scr_load_json(get_lang_folder_path() + "chapter" + string(global.chapter) + "/chapter_settings.json");
        global.font_map = ds_map_create();
        global.lang_missing_map = ds_map_create();
        global.chemg_sprite_map = ds_map_create();
        global.chemg_sound_map = ds_map_create();
        font_add_enable_aa(false);
        
        for (var i = 0; i < array_length(global.fonts_list); i++)
            add_font(global.fonts_list[i][0], global.fonts_list[i][1]);
        
        if (is_undefined(ds_map_find_value(global.font_map, "fnt_main_mono")) || ds_map_find_value(global.font_map, "fnt_main_mono") == -1)
            ds_map_set(global.font_map, "fnt_main_mono", ds_map_find_value(global.font_map, "fnt_main"));
        
        if (is_undefined(ds_map_find_value(global.font_map, "fnt_mainbig_mono")) || ds_map_find_value(global.font_map, "fnt_mainbig_mono") == -1)
            ds_map_set(global.font_map, "fnt_mainbig_mono", ds_map_find_value(global.font_map, "fnt_mainbig"));
        
        if (is_undefined(ds_map_find_value(global.font_map, "fnt_8bit_mixed")) || ds_map_find_value(global.font_map, "fnt_8bit_mixed") == -1)
            ds_map_set(global.font_map, "fnt_8bit_mixed", ds_map_find_value(global.font_map, "fnt_8bit"));
        
        if (is_undefined(ds_map_find_value(global.font_map, "fnt_legend_alt")) || ds_map_find_value(global.font_map, "fnt_legend_alt") == -1)
            ds_map_set(global.font_map, "fnt_legend_alt", ds_map_find_value(global.font_map, "fnt_legend"));

        for (var i = 0; i < array_length(global.sprites_list); i++)
            add_sprite(global.sprites_list[i]);
        
        var sndm = global.chemg_sound_map;
        
        for (var i = 0; i < array_length(global.sounds_list); i++)
            add_sound(global.sounds_list[i]);
        
        var additional_voicelines = get_chapter_lang_setting("additional_voicelines", {});
        var letters = variable_struct_get_names(additional_voicelines)
        for (var i = 0; i < array_length(letters); i++)
        {
            var letter = letters[i];
            var voice = variable_struct_get(additional_voicelines, letter);
            add_sound(voice);
            global.songs_list[array_length(global.songs_list)] = voice;
        }
        
        global.lang_map = ds_map_create();
        scr_lang_load();
        scr_ascii_input_names();

        scr_floweryvoiceclip_init();
    }
}
