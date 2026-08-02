function scr_load_json(arg0)
{
    var filename = arg0;
    
    if (scr_file_exists(filename))
    {
        var file_buffer = scr_buffer_load(filename);
        if (buffer_get_size(file_buffer) == 0) {
            show_message(string("'{0}' is empty.\nIt may happen due to bad file loading.\nPlease, reinstall mod via installer.", filename))
            show_error(string("'{0}' is empty.\nIt may happen due to bad file loading.\nPlease, reinstall mod via installer.", filename))
        }
        var json = buffer_read(file_buffer, buffer_string);
        buffer_delete(file_buffer);
        return json_parse(json);
    }
    else
    {
        show_debug_message("file: " + filename + "does not exist");
        return json_parse("{}");
    }
}
