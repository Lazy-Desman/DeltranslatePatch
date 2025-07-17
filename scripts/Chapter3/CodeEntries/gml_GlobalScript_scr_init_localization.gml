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
        var sprites_list = ["spr_funnytext_amazing_01", "spr_gameshow_screen_theend_bonus", "spr_susie_wan_sign", "spr_funnytext_know_tv", "spr_tvlandfont", "IMAGE_LOGO_CENTER_HEART", "spr_acrade_draw", "spr_tenna_pose_podium", "spr_tenna_nose_blossom_bloom", "spr_board_tvtimelogo", "spr_board_healthbar", "spr_dw_ranking_door_z", "spr_arcade_time", "spr_quitmessage", "spr_sneo_playback", "spr_funnytext_bonus_round", "spr_castle_dojo", "spr_dw_tv_prizes", "spr_board_b3stairdoor_big", "spr_quiz_answer_cursor", "spr_dw_ranking_door_a", "bg_building_icee_sign", "spr_funnytext_tv_time", "spr_dw_interstitial_poster_next", "spr_funnytext_tears", "spr_btact_fail1", "spr_gameshow_screen_chef_logo", "spr_tenna_pose_headraised_zoom_greenscreen", "bg_dw_b3bs_interstitial", "bg_building_cattyhouse", "spr_tenna_pose_headlowered", "spr_dw_green_room_bar_back", "spr_lancer_susie_highfive", "spr_darkmenudesc", "spr_tenna_desperate", "spr_chef_screen_logo", "IMAGE_LOGO", "spr_dw_tv_mysertySign_killed", "bg_dw_tvland_backstage_tiles_old", "spr_board_b2_lancerhint", "spr_btitem", "spr_funnytext_game_over", "bg_dw_tvland_stage_tiles_old", "spr_funnytext_stars", "spr_gigaqueen_intro_round1", "spr_board_quiztile", "spr_hopeometer_hope", "spr_funnytext_resumes", "spr_dw_gameshow_screen_round_3_bonus_backup", "spr_dw_interstitial_doors_sign_outline", "spr_board_sleep", "spr_tenna_pose_headraised_nose", "spr_board_sphinx_base", "spr_fieldmuslogo", "spr_dw_tv_tvtimeSign_quizwipe", "spr_tenna_tie_adjust_c", "spr_tenna_tie_adjust_b", "spr_dw_susiezilla_bg_empty", "spr_ch2_keyboard_tile_text", "spr_dw_tv_prize_talkback", "spr_board_inventory_q", "spr_board_b3stairdoor", "spr_board_b3stairs", "spr_funnytext_special", "spr_funnytext_alligator", "spr_tiredmark", "spr_funnytext_grand_prize", "spr_quiz_results", "spr_funnytext_big", "spr_tenna_pose_headlowered_nose", "spr_dmenu_captions", "spr_funnytext_stop", "spr_headralsei", "spr_board_treasuremarker_lmarkonly", "spr_funnytext_relax", "spr_face_rurus_piratehat", "spr_tenna_snap_body", "spr_tm_letters", "spr_dw_tv_tvtimeSign_animated", "spr_board_treasuremarker", "spr_tv_counter_letters", "spr_tenna_tie_adjust_a", "spr_headkris", "spr_gameshow_halloffame_right", "bg_torielclass", "spr_susiezilla_background", "spr_tenna_grasp_chef2", "spr_zapper_caption2", "spr_board_yogurtemergency", "bg_building_townhall_layer2", "spr_headnoelle", "spr_rouxls_biplane_flag", "spr_dw_interstitial_doors_sign", "bg_building_school", "spr_btact", "spr_tenna_grasp_anim", "spr_tenna_point_droop", "bg_building_townhall", "spr_dw_door_lancer", "spr_dw_screen_word", "spr_gameshow_halloffame_left", "spr_funnytext_fun_o_meter", "spr_dw_tv_time_02", "spr_dw_gameshow_screen_bonus_confirmed", "spr_dw_tv_mysterySign", "spr_acrade_fightagain", "spr_gigaqueen_intro_fight", "spr_tenna_snap_body_f2", "spr_funnytext_over_small", "spr_dw_tv_time_03", "spr_funnytext_brother", "bg_building_flowershop", "spr_dw_tv_time_intro", "spr_tplogo", "spr_susie_chef_doubleres", "spr_bnamekris", "spr_board_freeroamTrigger", "spr_dw_tv_time_01", "spr_tenna_kick", "spr_chirashi_bullet", "spr_flowershop_sign", "IMAGE_LOGO_CENTER_SEPARATE", "spr_board_game_title", "spr_btspade_success2", "spr_btfight", "spr_marquee_debug", "bg_library", "spr_dw_green_room_door_changing", "spr_funnytext_hall_of_fame", "bg_torielclass_ch2", "spr_smashreveal3", "spr_zapper_caption3", "spr_tenna_pose_headraised_zoom", "spr_bttech", "spr_btspade_success", "spr_funnytext_coffee", "spr_funnytext_city_feet", "spr_board_b3tvtower", "spr_tenna_hooray_alt", "spr_rhythmgame_bg_spotlights", "spr_dw_interstitial_doors", "spr_gameshow_screen_halloffame", "spr_dw_tv_time_04", "spr_elevator_floornum", "spr_btact_red", "spr_arcade_fight", "spr_tenna_nose_blossom", "spr_tenna_pose_headraised", "spr_shop_space_ui", "spr_battlemsg", "spr_tenna_whisper_blush", "spr_chartarget", "spr_queen_hp", "spr_gameshow_screen_theend_bonus_bonus", "spr_dw_ch3_b3bs_stealthzone", "spr_gameshow_screen_round_1_end", "spr_dw_tv_mysterySign_half", "bg_dw_castle_music_shop", "spr_bnamenoelle", "spr_tenna_hooray_chef", "spr_tenna_hooray", "spr_tenna_laugh_pose_alt", "spr_funnytext_physical_challenges", "spr_funnytext_board", "spr_btrouxls", "spr_ch3_wheel_center", "spr_board_game_title_tvtime", "spr_dw_teevie_tv_shows_tenna3", "spr_dw_tv_tvtimeSign_half", "spr_dw_ch3_latenitesign", "bg_building_diner", "bg_dw_music_ext", "spr_funnytext_flames", "spr_quiz_thisbutton", "spr_btheart", "spr_dw_green_room_poster_left", "bg_building_store", "spr_funnytext_lovers", "spr_tenna_grasp_chef", "spr_funnytext_challenge", "spr_arcade_round1", "bg_dw_bakery", "spr_screen_the_end", "spr_hpname", "spr_spare_z", "spr_dw_interstitial_poster_green", "spr_tenna_grasp_zoom", "spr_gigaqueen_intro_round3", "spr_btrouxls_select1", "spr_funnytext_round", "spr_dw_ranking_door_b", "spr_tenna_t_pose", "spr_tenna_whisper_chef", "spr_funnytext_over", "spr_funnytext_gentle", "spr_susiezilla_hudguy_tim", "spr_gameshow_screen_theend_round_1", "spr_tenna_point_at_screen", "spr_tenna_hooray_armsup", "bg_dw_music_ext_original", "spr_dw_poster_band", "spr_tenna_pose_podium_evil", "spr_acrade_retire", "spr_btact_ex", "spr_dw_tv_prize_car", "spr_dw_ranking_door_c", "spr_tenna_point_at_screen_c", "spr_tenna_grasp_b", "spr_btrouxls_select2", "spr_gigaqueen_intro_round2", "spr_btact_fail2", "spr_board_q", "spr_funnytext_quizzes", "spr_tenna_whisper", "spr_hero_hp", "spr_tenna_grasp_c", "spr_funnytext_game", "spr_tenna_point_at_screen_b", "spr_funnytext_win", "spr_funnytext_rounds", "spr_quiz_ralsei_plush", "spr_btdefend", "spr_dw_tv_prize_gum", "spr_tenna_laugh_pose", "spr_funnytext_susiezilla", "IMAGE_LOGO_CENTER", "spr_tenna_twirl", "spr_funnytext_win_big", "spr_bnamethrash", "bg_policebarricade", "spr_headsusie", "spr_board_tile_quiz", "spr_tenna_armsup_annoyed", "spr_tenna_jumpscare", "spr_tenna_t_pose_uncleaned", "spr_castle_shop", "spr_tenna_laugh_pose_segmented_body", "spr_rhythmgame_bg", "spr_arcade_youlose", "spr_recovery_platform_glow", "spr_bnamesusie", "spr_dw_screen_technical_difficulties", "spr_tenna_grasp_d", "bg_lw_ice_e_pizza", "spr_btspare", "bg_lw_sans_conbini", "spr_castle_shop_new", "spr_dw_tv_funometer_base", "spr_dw_tv_funometer_hopeText", "saloon_Train_NoneMove", "IMAGE_LOGO_CENTER_CHAPTERNUMBER", "spr_face_queen", "spr_tenna_laugh_pose_teeth", "spr_gameshow_screen_logo", "spr_tenna_fall_start", "spr_dw_tv_time_intro_loop", "spr_ch3_gameshow_round", "spr_tenna_grasp_zoom_static", "bg_building_library", "spr_checkers_milk", "spr_dw_green_room_poster", "spr_tenna_sad", "spr_acrade_giveup", "spr_gameoverbg_neo", "spr_tenna_attack_mouth_open", "spr_shadowman_caption2", "spr_funnytext_word", "spr_tenna_frightened", "spr_tenna_grasp", "spr_shootout_train_new", "spr_dw_green_room_bar_front", "spr_chefs_catch", "spr_dw_teevie_rhythm_bg", "bg_building_icee", "spr_dw_tv_tvtimeSign_off", "spr_funnytext_names", "spr_gameshow_screen_theend", "spr_funnytext_rock_concert", "spr_funnytext_tan", "spr_funnytext_lovely", "spr_dw_ranking_t_explain", "spr_funnytext_free", "spr_maus_intext", "spr_lw_conbini_open", "spr_ch3_GSA01G_tvtimescreenshot", "spr_dw_teevie_tv_shows", "spr_quiz_images", "spr_board_yogurtemergency_text", "spr_funnytext_fun_loop", "spr_chefs_food", "spr_dw_tv_funometer_hope", "spr_funnytext_physical_challenge", "spr_funnytext_round_1", "spr_funnytext_green_room", "spr_gameshow_screen_logo_white", "spr_chef_tutorial_03", "spr_tenna_attack", "spr_funnytext_toriel", "spr_funnytext_breaking_news", "spr_pressfront_b", "spr_dw_tv_time_funnytext", "spr_tenna_attack_clapvfx", "spr_funnytext_dark_fountain", "spr_tenna_snap", "spr_dw_tv_time_sample", "spr_dw_tv_mysterySign_gray", "spr_bnameralsei", "spr_dw_tv_funometer_base_1x", "spr_dw_poster_chef", "spr_dw_tv_tvtimeSign_off_gray", "spr_funnytext_prizes", "spr_tenna_hooray_armsup_teeth", "spr_btheart_success1", "spr_werewire_zzt_text", "spr_castle_cafe", "bg_alphysalley", "spr_funnytext_star", "spr_gameshow_screen_theend_bonus_start", "spr_castle_restaurant", "spr_susiezilla_hudguy_hp", "spr_susiezilla_singlescreen_hpbar", "bg_building_hospital", "spr_dw_tv_funometer_base_2x", "spr_dw_gameshow_screen_news", "spr_gameoverbg", "spr_tenna_grasp_anim_b", "spr_zapper_volume_text", "spr_tvlandfont", "spr_dw_tv_tvtimeSign", "spr_tenna_pose", "bg_building_police", "bg_dw_dojo_help", "spr_btspade", "spr_gameshow_pushingbuddies", "spr_dw_tv_cancelled", "spr_btheart_success2", "spr_dw_gameshow_screen_round_3_bonus", "spr_dw_inbetween_room_door", "spr_ch2_gimmick_bombtext_0", "bg_dw_castle_cafe_in", "spr_shootout_train", "spr_funnytext_love", "spr_tenna_laugh", "spr_gameshow_screen_chef_food", "spr_dw_tv_time_lights", "spr_board_shop", "spr_dw_tv_word_poster", "spr_board_lancercactus_help", "spr_ch3_chef_specialguestText", "spr_dw_ch3_b3bs_officesign_strip2", "spr_npc_bibliox_up", "obj_susiezilla_statue", "spr_gameshow_screen_city", 
        "spr_susiezilla_ralsei_tower",
        "spr_tenna_point_up_b",
        "spr_tenna_point_top",
        "spr_tenna_point_up_twofingers",
        "spr_tenna_point_up",
        "spr_krisu_dark_cool"];
        var fonts_list = [["fnt_main", 12], ["fnt_mainbig", 24], ["fnt_tinynoelle", 7], ["fnt_dotumche", 12], ["fnt_comicsans", 10], ["fnt_small", 6], ["fnt_8bit", 12], ["fnt_8bit_mixed", 12], ["fnt_main_mono", 12]];
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
        
        global.chapter_lang_settings = scr_load_json(working_directory + "../lang/" + global.lang + "/chapter3/chapter_settings.json");
        global.font_map = ds_map_create();
        global.lang_missing_map = ds_map_create();
        global.chemg_sprite_map = ds_map_create();
        global.chemg_sound_map = ds_map_create();
        font_add_enable_aa(false);
        
        for (var i = 0; i < array_length(fonts_list); i++)
            add_font(fonts_list[i][0], fonts_list[i][1]);
        
        if (ds_map_find_value(global.font_map, "fnt_main_mono") == -1)
            ds_map_set(global.font_map, "fnt_main_mono", ds_map_find_value(global.font_map, "fnt_main"));
        
        if (ds_map_find_value(global.font_map, "fnt_8bit_mixed") == -1)
            ds_map_set(global.font_map, "fnt_8bit_mixed", ds_map_find_value(global.font_map, "fnt_8bit"));
        
        for (var i = 0; i < array_length(sprites_list); i++)
            add_sprite(sprites_list[i]);
        
        var additional_funny_words = get_chapter_lang_setting("additional_funny_words", []);
        
        for (var i = 0; i < array_length(additional_funny_words); i++)
            add_sprite(additional_funny_words[i]);
        
        var sndm = global.chemg_sound_map;
        sound_symbols = get_chapter_lang_setting("button_sounds_symbols", ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?"]);
        set_chapter_lang_setting("button_sounds_symbols", sound_symbols);
        global.tvlandfont = font_add_sprite_ext(scr_84_get_sprite("spr_tvlandfont"), get_chapter_lang_setting("tvlangfont_string", "ABCDEFGHIJKLMNOPQRSTUVWXYZ.?!:…abcdefghijklmnopqrstuvwxyz1234567890"), 0, 1);
        var sounds_list = ["AUDIO_INTRONOISE", "ch2_credits", "snd_joker_laugh0", "snd_its_tv_time", "snd_smashreveal"];
        global.songs_list = ["AUDIO_INTRONOISE", "ch2_credits", "snd_joker_laugh0", "snd_its_tv_time", "snd_smashreveal"];
        
        for (var i = 0; i < array_length(sound_symbols); i++)
            add_sound("snd_speak_and_spell_" + sound_symbols[i], 1);
        
        for (var i = 0; i < array_length(sounds_list); i++)
            add_sound(sounds_list[i]);
        
        var additional_funny_sounds = get_chapter_lang_setting("additional_funny_sounds", []);
        
        for (var i = 0; i < array_length(additional_funny_sounds); i++)
            add_sound(additional_funny_sounds[i]);
        
        global.lang_map = ds_map_create();
        scr_lang_load();
        scr_ascii_input_names();
    }
}
