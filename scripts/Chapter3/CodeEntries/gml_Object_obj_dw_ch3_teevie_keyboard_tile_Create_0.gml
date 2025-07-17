is_pressed = false;
char_string = "?";
char_sprite_index = 0;
char_y_offset = 0;
tile_index = 0;

init_button = function(arg0)
{
    char_string = arg0;
    var sound_symbols = get_chapter_lang_setting("button_sounds_symbols", ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9","!","?"]);
    char_sprite_index = 0;
    for (var i = 0; i < array_length(sound_symbols); i++) {
        if (sound_symbols[i] == char_string) {
            char_sprite_index = i;
            break;
        }
    }
};

press_button = function()
{
    is_pressed = true;
    char_y_offset = 4;
    tile_index = 1;
    snd_play(scr_84_get_sound("snd_speak_and_spell_" + char_string));
};

reset_button = function()
{
    is_pressed = false;
    char_y_offset = 0;
    tile_index = 0;
};
