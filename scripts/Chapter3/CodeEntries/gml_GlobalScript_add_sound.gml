function add_sound(argument0, argument1) //gml_Script_add_sound
{
    sound_name = argument0
    orig_sound = asset_get_index(sound_name)
    path = working_directory + "../lang/" + global.lang + "/chapter3/sounds/"
    if argument1
        path = working_directory + "../lang/" + global.lang + "/chapter3/sounds/button_sounds/"
    filename = path + sound_name + ".ogg"
    filename_sp = path + "sp_" + sound_name + ".ogg"
    if (!file_exists(filename))
        filename = path + sound_name + ".wav"
    if (!file_exists(filename_sp))
        filename_sp = path + "sp_" + sound_name + ".wav"
    if file_exists(filename)
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
        if (file_exists(initsongvar)) {
            mystream = audio_create_stream(initsongvar)
            array_push(global.loaded_sounds, mystream)
        }
    }
    else
        mystream = orig_sound


    if file_exists(filename_sp)
    {
        mystream_sp = audio_create_stream(filename_sp)
        array_push(global.loaded_sounds, mystream_sp)
        ds_map_add(global.chemg_sound_map, "sp_" + sound_name, mystream_sp)
    }

    ds_map_add(global.chemg_sound_map, sound_name, mystream)
    return mystream;
}

