function add_sound(argument0, argument1) //gml_Script_add_sound
{
    sound_name = argument0
	sound_name_alt = scr_letter_fix(sound_name)
    orig_sound = asset_get_index(sound_name)
    var path = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sounds/"
    var shared_path = get_lang_folder_path() + "shared/sounds/"
    if argument1 {
        path = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sounds/button_sounds/"
        shared_path = get_lang_folder_path() + "shared/sounds/button_sounds/"
    }

	filename = path + sound_name_alt + ".ogg"
    if (!scr_file_exists(filename))
        filename = path + sound_name_alt + ".wav"
    if (!scr_file_exists(filename))
        filename = shared_path + sound_name_alt + ".ogg"
    if (!scr_file_exists(filename))
        filename = shared_path + sound_name_alt + ".wav"
    if (!scr_file_exists(filename))
        filename = path + sound_name + ".ogg"
    if (!scr_file_exists(filename))
        filename = path + sound_name + ".wav"
    if (!scr_file_exists(filename))
        filename = shared_path + sound_name + ".ogg"
    if (!scr_file_exists(filename))
        filename = shared_path + sound_name + ".wav"

    filename_sp = path + "sp_" + sound_name_alt + ".ogg"
    if (!scr_file_exists(filename_sp))
        filename_sp = path + "sp_" + sound_name_alt + ".wav"
    if (!scr_file_exists(filename_sp))
        filename_sp = shared_path + "sp_" + sound_name_alt + ".ogg"
    if (!scr_file_exists(filename_sp))
        filename_sp = shared_path + "sp_" + sound_name_alt + ".wav"
    if (!scr_file_exists(filename_sp))
        filename_sp = path + "sp_" + sound_name + ".ogg"
    if (!scr_file_exists(filename_sp))
        filename_sp = path + "sp_" + sound_name + ".wav"
    if (!scr_file_exists(filename_sp))
        filename_sp = shared_path + "sp_" + sound_name + ".ogg"
    if (!scr_file_exists(filename_sp))
        filename_sp = shared_path + "sp_" + sound_name + ".wav"

    mystream = -1
    if scr_file_exists(filename)
    {
        mystream = audio_create_stream(filename)
        array_push(global.loaded_sounds, mystream)
    }
    else if (orig_sound == -1)
    {
        var dir = "mus/"
        if global.launcher
            dir = working_directory + "../mus/"
        initsongvar = dir + argument0 + ".ogg"
        if (scr_file_exists(initsongvar)) {
            mystream = audio_create_stream(initsongvar)
            array_push(global.loaded_sounds, mystream)
        }
    }
    else
        mystream = orig_sound


    if scr_file_exists(filename_sp)
    {
        mystream_sp = audio_create_stream(filename_sp)
        array_push(global.loaded_sounds, mystream_sp)
        ds_map_add(global.chemg_sound_map, "sp_" + sound_name, mystream_sp)
    }

    ds_map_add(global.chemg_sound_map, sound_name, mystream)
    return mystream;
}

