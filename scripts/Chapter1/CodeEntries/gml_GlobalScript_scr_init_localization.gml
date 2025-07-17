function scr_init_localization()
{
    if (!variable_global_exists("lang"))
    {
        ini_open("true_config.ini");
        
        if (ini_key_exists("LANG", "LANG_DT"))
            global.lang = ini_read_string("LANG", "LANG_DT", "en");
        else
            global.lang = os_get_language();
        
        ini_close();
        flag = 0;
        
        for (var i = 0; i < array_length(global.langs_names); i++)
        {
            if (global.langs_names[i] == global.lang)
            {
                flag = 1;
                break;
            }
        }
        
        if (!flag)
            global.lang = "en";
        
        if (!variable_struct_exists(global.langs_settings, global.lang))
            global.lang = global.langs_names[0];
    }
    
    if (!variable_global_exists("lang_loaded"))
    {
        global.lang_loaded = "";
        global.loaded_sprites = [];
        global.loaded_sounds = [];
        global.loaded_fonts = [];
    }
    
    if (global.lang_loaded != global.lang)
    {
        var sprites_list = ["bg_alphysalley", "bg_building_cattyhouse", "bg_building_diner", "bg_building_flowershop", "bg_building_hospital", "bg_building_icee_sign", "bg_building_library", "bg_building_police", "bg_building_school", "bg_building_store", "bg_building_townhall", "bg_building_townhall_layer2", "bg_hospital_room2", "bg_library", "bg_policebarricade", "bg_rurus_shop", "bg_seam_shopfront", "bg_torielclass", "IMAGE_LOGO", "IMAGE_LOGO_CENTER", "IMAGE_LOGO_CENTER_HEART", "spr_battlemsg", "spr_blockler_b", "spr_blockler_o", "spr_bnamekris", "spr_bnameralsei", "spr_bnamesusie", "spr_btact", "spr_btdefend", "spr_btfight", "spr_btitem", "spr_btspare", "spr_bttech", "spr_castle_shop", "spr_chartarget", "spr_checkers_milk", "spr_darkmenudesc", "spr_dmenu_captions", "spr_fieldmuslogo", "spr_headkris", "spr_headralsei", "spr_headsusie", "spr_hpname", "spr_kingr_asleep", "spr_pressfront_b", "spr_quitmessage", "spr_thrashbody_b", "spr_thrashfoot_b", "spr_thrashlogo", "spr_thrashstats", "spr_tiredmark", "spr_tplogo", "sp_IMAGE_LOGO", "sp_IMAGE_LOGO_CENTER", "sp_IMAGE_LOGO_CENTER_HEART", "sp_spr_blockler_b", "sp_spr_blockler_o"];
        var fonts_list = [["fnt_main", 12], ["fnt_mainbig", 24], ["fnt_tinynoelle", 7], ["fnt_dotumche", 12], ["fnt_comicsans", 10], ["fnt_small", 6], ["fnt_tinynoelle", 7]];
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
        
        global.chapter_lang_settings = scr_load_json(working_directory + "../lang/" + global.lang + "/chapter1/chapter_settings.json");
        global.font_map = ds_map_create();
        global.lang_missing_map = ds_map_create();
        global.chemg_sprite_map = ds_map_create();
        global.chemg_sound_map = ds_map_create();
        font_add_enable_aa(false);
        
        for (var i = 0; i < array_length(fonts_list); i++)
            add_font(fonts_list[i][0], fonts_list[i][1]);
        
        for (var i = 0; i < array_length(sprites_list); i++)
            add_sprite(sprites_list[i]);
        
        for (var i = 0; i < string_length(get_chapter_lang_setting("boob", "boob")); i++)
            add_sprite("spr_blockler_" + string_char_at(get_chapter_lang_setting("boob", "boob"), i + 1), 4);
        
        var sndm = global.chemg_sound_map;
        var sounds_list = ["snd_joker_anything", "snd_joker_chaos", "snd_joker_metamorphosis", "snd_joker_neochaos", "snd_joker_laugh0", "snd_joker_laugh1", "snd_joker_ha0", "snd_joker_ha1", "snd_joker_oh", "snd_joker_byebye"];
        global.songs_list = ["dontforget.ogg", "snd_joker_anything", "snd_joker_chaos", "snd_joker_metamorphosis", "snd_joker_neochaos", "snd_joker_laugh0", "snd_joker_laugh1", "snd_joker_ha0", "snd_joker_ha1", "snd_joker_oh", "snd_joker_byebye"];
        
        for (var i = 0; i < array_length(sounds_list); i++)
            add_sound(sounds_list[i]);
        
        global.lang_map = ds_map_create();
        scr_lang_load();
        scr_ascii_input_names();
    }
}
