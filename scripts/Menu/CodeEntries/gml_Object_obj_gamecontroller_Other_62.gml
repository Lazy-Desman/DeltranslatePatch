if (os_type != os_windows && os_type != os_android && os_type != os_macosx && os_type != os_linux) {
    exit;
}

var base_dir = (os_type == os_android) ? global.savepath : ("\\\\?\\" + program_directory);

if (ds_map_find_value(async_load, "id") == lang_changes_call)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        var lang_change;

        try
        {
            lang_change = json_parse(ds_map_find_value(async_load, "result"));
        }
        catch (err)
        {
            show_message("Loaded broken JSON file changes.json");
            exit;
        }


        lang_changes = lang_change;
        var versions = variable_struct_get_names(lang_change);
        array_sort(versions, function(a, b) {
            return is_version_greater(string_to_version(b), string_to_version(a)) - is_version_greater(string_to_version(a), string_to_version(b));
        })
        var lang_change_desc = "";
        var cur_version = cur_translation_version;
        var last_version = last_translation_version;
        var should_external_update = false;
        var files_mp = {};
        var datas_mp = {};

        for (var i = 0; i < array_length(versions); i++)
        {
            var str = versions[i];

            if (!is_valid_version(str))
                continue;

            var ver = string_to_version(str);

            if (is_version_greater(ver, cur_version))
            {
                var name = variable_struct_get(variable_struct_get(lang_change, str), "name");
                var desc = variable_struct_get(variable_struct_get(lang_change, str), "description");
                var valid = variable_struct_get(variable_struct_get(lang_change, str), "valid");
                if (valid != undefined) {
                    var flag = false
                    if (!is_array(valid)) {
                        valid = [valid]
                    }
                    for (var j = 0; j < array_length(valid); j++) {
                        if (valid[j] == dtv) {
                            flag = true
                            break
                        }
                    }
                    if (!flag) {
                        continue;
                    }
                }
                lang_change_desc += string("{0}{1}:\n{2}\n", str, is_undefined(name) ? "" : string(" ({0})", name), is_undefined(desc) ? "" : desc);
                var files_list = variable_struct_get(variable_struct_get(lang_change, str), "files");
                var datas_list = variable_struct_get(variable_struct_get(lang_change, str), "datas");

                var external_update = variable_struct_get(variable_struct_get(lang_change, str), "external_update");
                if (!is_undefined(external_update) && external_update) {
                    should_external_update = true
                }
                
                if (!is_undefined(files_list))
                {
                    for (var ii = 0; ii < array_length(files_list); ii++)
                        variable_struct_set(files_mp, files_list[ii]);
                }
                
                if (!is_undefined(datas_list))
                {
                    for (var ii = 0; ii < array_length(datas_list); ii++) {
                        variable_struct_set(datas_mp, datas_list[ii]);
                        variable_struct_set(datas_loading, datas_list[ii], 0);
                    }
                }
            }

            if (is_version_greater(ver, last_version))
            {
                last_version[0] = ver[0];
                last_version[1] = ver[1];
                last_version[2] = ver[2];
            }
        }

        translation_version_description = lang_change_desc;
        last_translation_version = last_version;
        translation_version_changes_files = variable_struct_get_names(files_mp);
        translation_version_changes_datas = variable_struct_get_names(datas_mp);
        translation_external_update = should_external_update
    }
}

//TODO: make data updating work with macos and linux
if (os_type != os_windows && os_type != os_android) {
    exit;
}

var filenames = variable_struct_get_names(files_in_upload);
var datanames = variable_struct_get_names(datas_in_upload);

for (var ind = 0; ind < array_length(filenames); ind++)
{
    if (ds_map_find_value(async_load, "id") == variable_struct_get(files_in_upload, filenames[ind]))
    {
        if (ds_map_find_value(async_load, "status") == 0)
        {
            var file_buffer = buffer_load(base_dir + "tmp/" + filenames[ind]);

            if (buffer_get_size(file_buffer) == 0)
            {
                loading_error = "408";
                loading_new_translation_files = false;
            }

            if (loading_error == "")
            {
                array_push(loaded_files, filenames[ind]);

                if (array_length(loaded_files) == array_length(filenames) && array_length(loaded_datas) == array_length(datanames)) {
                    if (settings_loaded) {
                        copy_files_from_tmp();
                        if (array_length(datanames) == 0)
                            update_changes_file()
                        update_language();
                        scr_init_localization()
                        if (array_length(datanames) == 0) {
                            clear_tmp();
                        }
                    } else {
                        settings_loaded = true;
                        loaded_files = ["settings.json"]
                        copy_files_from_tmp();
                        update_language();
                        files_url = get_lang_setting("files_url", "")
                        loading_new_translation_files = true
                        load_datas();
                        load_files();
                    }
                }
            } else {
                clear_tmp();
            }
        }
        else if (ds_map_find_value(async_load, "status") < 0)
        {
            loading_error = string(ds_map_find_value(async_load, "http_status"));
            loading_new_translation_files = false;
            clear_tmp();
        }
    }
}

for (var ind = 0; ind < array_length(datanames); ind++)
{
    if (ds_map_find_value(async_load, "id") == variable_struct_get(datas_in_upload, datanames[ind]))
    {
        if (ds_map_find_value(async_load, "status") == 0)
        {
            var path = ""
            var path_to = "data.win"
            if (datanames[ind] > 0) {
                path = "chapter" + string(datanames[ind])
                if (os_type == os_android)
                    path_to = "packs/chapter" + string(datanames[ind]) + "_windows.pack"
                else
                    path_to = "chapter" + string(datanames[ind]) + "_windows/data.win"
            }

            var file_buffer = buffer_load(base_dir + "tmp/" + path + "/data.win")
            var orig_size = 0;
            
            if (file_exists(base_dir + path_to))
            {
                var orig_file = file_bin_open(base_dir + path_to, 0);
                orig_size = file_bin_size(orig_file);
                file_bin_close(orig_file);
            }
            
            if (orig_size > 0 && (buffer_get_size(file_buffer) / orig_size) < 0.95)
            {
                loading_error = "408";
                loading_new_translation_files = false;
            }

            if (loading_error == "")
            {
                array_push(loaded_datas, datanames[ind]);
                variable_struct_set(datas_loading, datanames[ind], 100);

                if (array_length(loaded_files) == array_length(filenames) && array_length(loaded_datas) == array_length(datanames)) {
                    copy_files_from_tmp();
                    update_changes_file()
                    clear_tmp();
                }
            } else {
                clear_tmp();
            }
        }
        else if (ds_map_find_value(async_load, "status") < 0)
        {
            loading_error = string(ds_map_find_value(async_load, "http_status"));
            loading_new_translation_files = false;
            clear_tmp();
        } else if (ds_map_find_value(async_load, "status") > 0)
        {
            var content_len = ds_map_find_value(async_load, "contentLength");
            
            if (!is_undefined(content_len) && content_len > 0)
                variable_struct_set(datas_loading, datanames[ind], floor((ds_map_find_value(async_load, "sizeDownloaded") / content_len) * 100));
        }
    }
}
