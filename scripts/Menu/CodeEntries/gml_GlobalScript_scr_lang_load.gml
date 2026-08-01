function scr_lang_load() //gml_Script_scr_lang_load
{
    name = "strings.json"
    var lang_dir = get_lang_folder_path()
    var orig_filename = lang_dir + name

    var json = "{}"
    if (scr_file_exists(orig_filename)) {
        var file_buffer = buffer_load(orig_filename);
        json = buffer_read(file_buffer, buffer_string);
        buffer_delete(file_buffer);
    }
    var orig_map = json_decode(json);

    ds_map_destroy(global.lang_map)
    global.lang_map = orig_map
}