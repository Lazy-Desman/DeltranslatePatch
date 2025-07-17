function scr_nameentrybadcheck()
{
    var nextletter = false;
    var lang = 0;
    
    if (global.lang == "ja")
        lang = 1;
    
    if (lang == 0)
    {
        var alphabet = get_chapter_lang_setting("input_game_name_chars", "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!.-")
        var word = string_char_at(alphabet, letter[0] + 1) + string_char_at(alphabet, letter[1] + 1) + string_char_at(alphabet, letter[2] + 1)
        var schemas = get_chapter_lang_setting("forbidden_words_schemas", [
            "FUC", "FUK", "FUQ", "FUX", 
            "SEX", "CUM", "COC", "COK", "COQ",
            "FCK", "FCK", "FCX", "**G"
        ])

        for (var i = 0; i < array_length(schemas); i++) {
            var flag = true
            for (var j = 1; j <= 3; j++) {
                if (string_char_at(schemas[i], j) == "*")
                    continue;
                if (string_char_at(word, j) == string_char_at(schemas[i], j))
                    continue;
                flag = false;
                break;
            }
            if (flag) {
                nextletter = true;
                break;
            }
        }
    }
    else if (letter[2] == scr_ja_alphanumericarray_check("コ") || letter[2] == scr_ja_alphanumericarray_check("ゲ") || letter[2] == scr_ja_alphanumericarray_check("バ") || letter[2] == scr_ja_alphanumericarray_check("ボ") || letter[2] == scr_ja_alphanumericarray_check("ポ"))
    {
        nextletter = true;
    }
    
    return nextletter;
}
