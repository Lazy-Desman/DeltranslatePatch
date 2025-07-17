function scr_load_json(arg0)
{
    var filename = arg0;
    
    if (file_exists(filename))
    {
        var file_buffer = buffer_load(filename);
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
