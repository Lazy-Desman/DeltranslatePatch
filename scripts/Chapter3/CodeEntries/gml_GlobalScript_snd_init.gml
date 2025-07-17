function snd_init(argument0) //gml_Script_snd_init
{
    var dir = "mus/"

    if (global.launcher)
        dir = working_directory + "../mus/";

    initsongvar = dir + argument0

    var flag = true
    for (var i = 0; i < array_length(global.songs_list); i++) {
        if (global.songs_list[i] == argument0 || global.songs_list[i] + ".ogg" == argument0) {
            flag = false
            break
        }
    }
    if (global.translated_songs || flag) {
        var lang_path = working_directory + "../lang/" + global.lang + "/chapter3/sounds/"
        if file_exists(lang_path + argument0) {
            initsongvar = lang_path + argument0
        }
        if (global.special_mode && file_exists(lang_path + "sp_" + argument0)) {
            initsongvar = lang_path + "sp_" + argument0
        }
    }

    _mystream = audio_create_stream(initsongvar)
    _astream = instance_create(0, 0, obj_astream)
    _astream.mystream = _mystream
    _astream.songname = argument0
    return _mystream;
}

function sound_init(arg0)
{
    snd_init(arg0);
}
