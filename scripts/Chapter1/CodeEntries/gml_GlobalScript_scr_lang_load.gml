function scr_lang_load() //gml_Script_scr_lang_load
{
    name = "strings.json"
    var lang_dir = working_directory + "../lang/" + global.lang + "/chapter1/"
    var orig_filename = lang_dir + name

    if (global.lang == "en" && !file_exists(orig_filename)) {
        orig_filename = working_directory + "lang/lang_en.json"
    }
    var orig_map = scr_84_load_map_json(orig_filename)
    ds_map_destroy(global.lang_map)
    global.lang_map = orig_map
}