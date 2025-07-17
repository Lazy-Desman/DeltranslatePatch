function scr_gameshowname()
{
    var alphabet = get_chapter_lang_setting("input_game_name_chars", "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!.-")
    var alphanumericarray = []
    for (var i = 0; i < string_length(alphabet); i++) {
        alphanumericarray[i] = string_char_at(alphabet, i + 1)
    }

    
    var ___mystring = alphanumericarray[global.flag[1012]] + alphanumericarray[global.flag[1013]] + alphanumericarray[global.flag[1014]];
    return ___mystring;
}
