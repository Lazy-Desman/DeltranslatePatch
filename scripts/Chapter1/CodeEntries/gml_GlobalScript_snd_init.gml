function snd_init(arg0)
{
    var dir = "mus/";
    
    if (global.launcher)
        dir = working_directory + "../mus/";
    
    initsongvar = dir + arg0;
    var flag = true;
    
    for (var i = 0; i < array_length(global.songs_list); i++)
    {
        if (global.songs_list[i] == arg0 || (global.songs_list[i] + ".ogg") == arg0)
        {
            flag = false;
            break;
        }
    }
    
    if (global.translated_songs || flag)
    {
        var lang_path = working_directory + "../lang/" + global.lang + "/chapter1/sounds/";
        
        if (file_exists(lang_path + arg0))
            initsongvar = lang_path + arg0;
        
        if (global.special_mode && file_exists(lang_path + "sp_" + arg0))
            initsongvar = lang_path + "sp_" + arg0;
    }
    
    _mystream = audio_create_stream(initsongvar);
    _astream = instance_create(0, 0, obj_astream);
    _astream.mystream = _mystream;
    _astream.songname = arg0;
    return _mystream;
}
