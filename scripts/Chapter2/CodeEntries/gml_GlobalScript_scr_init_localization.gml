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
        var sprites_list = ["bg_alphysalley", "bg_building_cattyhouse", "bg_building_diner", "bg_building_flowershop", "bg_building_hospital", "bg_building_icee_sign", "bg_building_library", "bg_building_police", "bg_building_school", "bg_building_store", "bg_building_townhall_layer2", "bg_dw_bakery", "bg_dw_castle_cafe_in", "bg_dw_castle_music_shop", "bg_dw_dojo_help", "bg_dw_music_ext", "bg_hospital_room2_ch2", "bg_library", "bg_lw_ice_e_pizza", "bg_lw_sans_conbini", "bg_policebarricade", "bg_torielclass_ch2", "IMAGE_LOGO", "IMAGE_LOGO_CENTER", "IMAGE_LOGO_CENTER_CHAPTERNUMBER", "IMAGE_LOGO_CENTER_HEART", "IMAGE_LOGO_CENTER_SEPARATE", "spr_acrade_draw", "spr_acrade_fightagain", "spr_acrade_giveup", "spr_acrade_retire", "spr_arcade_fight", "spr_arcade_round1", "spr_arcade_time", "spr_arcade_youlose", "spr_battlemsg", "spr_blockler_b", "spr_bnamekris", "spr_bnamenoelle", "spr_bnameralsei", "spr_bnamesusie", "spr_bnamethrash", "spr_btact", "spr_btdefend", "spr_btfight", "spr_btitem", "spr_btspare", "spr_bttech", "spr_castle_cafe", "spr_castle_dojo", "spr_castle_restaurant", "spr_castle_shop", "spr_castle_shop_new", "spr_ch2_cityscreen", "spr_ch2_keyboard_tile_text", "spr_checkers_milk", "spr_chirashi_bullet", "spr_city_mice_in", "spr_city_mice_out", "spr_city_mice_sign_01", "spr_city_mice_sign_02", "spr_city_mice_sign_03", "spr_cutscene_06_highfive", "spr_cutscene_27_tender_cancelled", "spr_cutscene_27_tender_goodbye", "spr_darkmenudesc", "spr_dmenu_captions", "spr_dw_city_info", "spr_dw_door_lancer", "spr_dw_mansion_room_susie_book_vacuum", "spr_face_queen", "spr_face_rurus_piratehat", "spr_flowershop_sign", "spr_gameoverbg", "spr_gameoverbg_neo", "spr_gigaqueen_intro_fight", "spr_gigaqueen_intro_round1", "spr_gigaqueen_intro_round2", "spr_gigaqueen_intro_round3", "spr_hero_hp", "spr_hpname", "spr_lw_conbini_open", "spr_mansion_cafe_entrance", "spr_mansion_floor_sign", "spr_mansion_switch_light", "spr_maus_intext", "spr_mice3_progressBar", "spr_npc_catti_mom_no1", "spr_pipissign", "spr_pressfront_b", "spr_queen_hp", "spr_queen_poster", "spr_queenmansion_bg_middle", "spr_queenscreen", "spr_queenscreen_large", "spr_quitmessage", "spr_rouxls_bubble_hey", "spr_sneo_playback", "spr_spare_z", "spr_susie_wan_sign", "spr_tiredmark", "spr_tm_letters", "spr_tplogo", "spr_trafficswitch_symbol", "spr_welcome_sign", "spr_werewire_zzt_text", "spr_cutscene_13_berdly_statue", "spr_cutscene_26_berdly_statue", "spr_cutscene_26_plugboy", "spr_dw_mansion_toilet", "spr_headkris", "spr_headnoelle", "spr_headralsei", "spr_headsusie", "spr_npc_plugboy", "spr_npc_plugboy_bandana", "spr_npc_plugboy_girl", "spr_npc_plugboy_hat", "spr_npc_plugboy_shock", "spr_npc_plugboy_static", "spr_npc_plugboy_static_outline", "spr_npc_plugboy_wig", "spr_plugboy_cower", "spr_plugboy_shock", "spr_plugboy_spare"];
        var fonts_list = [["fnt_main", 12], ["fnt_mainbig", 24], ["fnt_tinynoelle", 7], ["fnt_dotumche", 12], ["fnt_comicsans", 10], ["fnt_small", 6]];
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
        
        global.chapter_lang_settings = scr_load_json(working_directory + "../lang/" + global.lang + "/chapter2/chapter_settings.json");
        global.font_map = ds_map_create();
        global.lang_missing_map = ds_map_create();
        global.chemg_sprite_map = ds_map_create();
        global.chemg_sound_map = ds_map_create();
        font_add_enable_aa(false);
        
        for (var i = 0; i < array_length(fonts_list); i++)
            add_font(fonts_list[i][0], fonts_list[i][1]);
        
        for (var i = 0; i < array_length(sprites_list); i++)
            add_sprite(sprites_list[i]);
        
        var sndm = global.chemg_sound_map;
        sound_symbols = get_chapter_lang_setting("button_sounds_symbols", ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?"]);
        
        set_chapter_lang_setting("button_sounds_symbols", sound_symbols);
        var sounds_list = ["AUDIO_INTRONOISE", "snd_boxing_fight", "snd_boxing_fight_bc", "snd_boxing_round1", "snd_boxing_round1_bc", "snd_boxing_round2", "snd_boxing_round2_bc", "snd_boxing_round3", "snd_boxing_round3_bc", "snd_tm_quiz_a", "snd_tm_quiz_b", "snd_tm_quiz_c", "snd_tm_quiz_d"];
        global.songs_list = ["ch2_credits.ogg", "spamton_battle.ogg", "spamton_meeting.ogg", "spamton_neo_mix_ex_wip.ogg"];
        
        for (var i = 0; i < array_length(sound_symbols); i++)
            add_sound("snd_speak_and_spell_" + sound_symbols[i], 1);
        
        for (var i = 0; i < array_length(sounds_list); i++)
            add_sound(sounds_list[i]);
        
        global.lang_map = ds_map_create();
        scr_lang_load();
        scr_ascii_input_names();
    }
}
