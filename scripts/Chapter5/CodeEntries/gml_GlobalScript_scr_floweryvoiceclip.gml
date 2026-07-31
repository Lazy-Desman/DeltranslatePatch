function scr_floweryvoiceclip(arg0)
{
    if (!variable_global_exists("flowery_txtsnd")) {
        scr_floweryvoiceclip_init();
    }
    
    var flowerysnd = snd_nosound;
    var text_char = arg0;
    
    for (var i = 0; i < array_length(global.flowery_txtsnd); i++)
    {
        if (text_char != global.flowery_txtsnd[i][0])
            continue;
        
        if (text_char == "h")
        {
            var chance = random(1);
            flowerysnd = (chance >= 0.5) ? scr_84_get_sound("snd_flowery_voiceclip_get_a_chance_1") : scr_84_get_sound("snd_flowery_voiceclip_get_a_chance_2");
            break;
        }
        else
        {
            flowerysnd = global.flowery_txtsnd[i][1];
            break;
        }
    }
    
    return flowerysnd;
}

function scr_floweryvoiceclip_init()
{
    global.flowery_txtsnd = [];
    global.translated_songs_flowery = global.translated_songs;
    
    var _assets = [snd_flowery_voiceclip_flowery2, snd_flowery_voiceclip_sorrytokeepyouwaiting1, snd_flowery_voiceclip_heyguys, snd_flowery_voiceclip_hey, snd_flowery_voiceclip_thatsgreat, snd_flowery_voiceclip_wow, snd_flowery_voiceclip_yes, snd_flowery_voiceclip_nonono, snd_flowery_voiceclip_huh, snd_flowery_voiceclip_stingus, snd_flowery_voiceclip_sorrytokeepaladyinwaiting, snd_flowery_voiceclip_sorryaboutthatlittleguy, snd_flowery_voiceclip_thisguysyourbestfriend, snd_flowery_voiceclip_heytherelittleguy, snd_flowery_voiceclip_sorrytokeepyouladies, snd_flowery_voiceclip_sorryaboutthatguys, snd_flowery_voiceclip_itsmeflowery, snd_flowery_voiceclip_yourdadsmybestfriend, snd_flowery_voiceclip_heyguysithinkifoundaglue, snd_flowery_voiceclip_imsorryonceagainikeptaladyinwaiting, snd_flowery_voiceclip_glue, snd_flowery_voiceclip_hereicomesanfrandisc, snd_flowery_voiceclip_itsme, snd_flowery_voiceclip_hey_raly, snd_flowery_voiceclip_sorrytokeepyouwaiting2, snd_flowery_voiceclip_sorryabouttheguy, snd_flowery_voiceclip_flowers_blooms_in_your_heart, snd_flowery_voiceclip_no_way_its_your_children, snd_flowery_voiceclip_mysterious_wind, snd_flowery_voiceclip_my_king, snd_flowery_voiceclip_my_favorite_two, snd_flowery_voiceclip_im_falling, snd_flowery_voiceclip_hey_boys, snd_flowery_voiceclip_grown_like_a_turnip, snd_flowery_voiceclip_great_style, snd_flowery_voiceclip_your_dad, snd_flowery_voiceclip_the_diner, snd_flowery_voiceclip_the_boys, snd_flowery_voiceclip_calling_for_help, snd_flowery_voiceclip_try_my_flavor, snd_flowery_voiceclip_goodbye, snd_flowery_voiceclip_susie, snd_flowery_voiceclip_kris, snd_flowery_voiceclip_get_a_chance_1, snd_flowery_voiceclip_youre_a_hero, snd_flowery_voiceclip_forget_it, snd_flowery_voiceclip_my_human, snd_flowery_voiceclip_leaf_it_to_me, snd_flowery_voiceclip_say_that_again, snd_flowery_voiceclip_go_home, snd_flowery_voiceclip_smile_again, snd_flowery_voiceclip_thats_my_dreams, snd_flowery_voiceclip_dont_you_like_serving_humans, snd_flowery_voiceclip_im_only_trying_to_help_you, snd_flowery_voiceclip_all_according_to_all_according_to_plant, snd_flowery_voiceclip_mostlys, snd_flowery_voiceclip_its_so_human, snd_flowery_voiceclip_what_a_predictable_creature, snd_flowery_voiceclip_its_all_in_a_name, snd_flowery_voiceclip_give_to_you, snd_flowery_voiceclip_suckle_it_up];
    var alphabet_upper = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    var alphabet_lower = [];
    
    for (var i = 0; i < array_length(alphabet_upper); i++)
        alphabet_lower[array_length(alphabet_lower)] = string_lower(alphabet_upper[i]);
    
    var alphabet = alphabet_upper;
    
    for (var i = 0; i < array_length(alphabet_lower); i++)
        alphabet[array_length(alphabet)] = alphabet_lower[i];
    
    var alphabet_index = 0;
    
    for (var i = 0; i < array_length(_assets); i++)
    {
        var text_char = string(i);
        
        if (i > 9)
        {
            text_char = alphabet[alphabet_index];
            alphabet_index += 1;
        }
        
        var sound_asset = scr_84_get_sound(audio_get_name(_assets[i]));
        global.flowery_txtsnd[i][0] = text_char;
        global.flowery_txtsnd[i][1] = sound_asset;
    }

    var additional_voicelines = get_chapter_lang_setting("additional_voicelines", {});
    var letters = variable_struct_get_names(additional_voicelines)
    for (var i = 0; i < array_length(letters); i++)
    {
        var letter = letters[i];
        var voice = variable_struct_get(additional_voicelines, letter);
        var sound_asset = scr_84_get_sound(voice);
        global.flowery_txtsnd[i + array_length(_assets)][0] = letter;
        global.flowery_txtsnd[i + array_length(_assets)][1] = sound_asset;
    }
}

function scr_set_floweryvoicemode(arg0)
{
    if (global.typer != 88 && global.typer != 96 && global.typer != 86)
        exit;
    
    if (string_pos("\\V", arg0) != 0)
    {
        global.voiceclipmode = 0;
        
        if (global.flag[1391] == 1)
            global.voiceclipmode = 2;
        
        if (string_pos("\\v1", arg0) != 0)
            global.voiceclipmode = 1;
    }
    else if (string_pos("\\v1", arg0) != 0)
    {
        global.voiceclipmode = 1;
    }
    else
    {
        global.voiceclipmode = 2;
    }
}
