function scr_lang_load() //gml_Script_scr_lang_load
{
    name = "strings.json"
    var lang_dir = working_directory + "../lang/" + global.lang + "/chapter3/"
    var orig_filename = lang_dir + name

    var orig_map = scr_84_load_map_json(orig_filename)
    ds_map_destroy(global.lang_map)
    global.lang_map = orig_map
}