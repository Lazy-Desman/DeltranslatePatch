if (os_type == os_android)
    global.savepath = init_external_dir();
else
    global.savepath = game_save_id;

if (instance_number(obj_gamecontroller) > 1)
{
    instance_destroy();
    exit;
}

if (os_type == os_android)
{
    if (!instance_exists(obj_mobilecontrols))
        instance_create(0, 0, obj_mobilecontrols);
    global.lang_folder = global.savepath + "lang/";
    if (!directory_exists(global.lang_folder) && file_exists(global.savepath + "lang.zip"))
        zip_unzip(global.savepath + "lang.zip", global.savepath);
}
else
    global.lang_folder = working_directory + "lang/";

global.lang = "en";
global.orig_en = false;
global.is_console = scr_is_switch_os() || os_type == os_ps4 || os_type == os_ps5;
var launch_data = scr_init_launch_parameters();
global.launcher = launch_data.is_launcher;
is_connecting_controller = 3;
gamepad_active = 0;
gamepad_id = 0;
gamepad_shoulderlb_reassign = 0;
gamepad_type = "";
_load_enabled = false;

if (!variable_global_exists("gamepad_type"))
    global.gamepad_type = "N/A";

if (variable_global_exists("lang_map"))
    exit;

ossafe_ini_open("true_config.ini");
global.special_mode = ini_read_real("LANG", "special_mode", 0);
global.translated_songs = ini_read_real("LANG", "translated_songs", 1);
ossafe_ini_close();
global.lang_sprites = ds_map_create();
global.lang_sounds = ds_map_create();
global.font_map = ds_map_create();
global.langs_names = [];
global.lang_settings = {};
global.languages_list = [];
global.lang = "en";
lang_changes_call = -1;
lang_changes = {};
cur_translation_version = [0, 0, 0];
last_translation_version = [0, 0, 0];
translation_version_changes_files = [];
translation_version_changes_datas = [];
datas_loading = {};
translation_version_description = "";
translation_external_update = false;

is_valid_version = function(arg0)
{
    if (is_undefined(arg0))
        arg0 = "";
    
    var major_pos = string_pos_ext(".", arg0, 1);
    var minor_pos = string_pos_ext(".", arg0, major_pos + 1);
    return major_pos != 0 && minor_pos != 0;
};

string_to_version = function(arg0)
{
    if (is_undefined(arg0))
        arg0 = "0.0.0";
    
    var ver;
    
    try
    {
        ver = [0, 0, 0];
        var major_pos = string_pos_ext(".", arg0, 1);
        var minor_pos = string_pos_ext(".", arg0, major_pos + 1);
        ver[0] = real(string_copy(arg0, 1, major_pos));
        ver[1] = real(string_copy(arg0, major_pos + 1, minor_pos - major_pos));
        ver[2] = real(string_copy(arg0, minor_pos + 1, string_length(arg0) - minor_pos));
    }
    catch (err)
    {
        return [-1, -1, -1];
    }
    
    return ver;
};

version_to_string = function(arg0)
{
    if (is_undefined(arg0))
        arg0 = [0, 0, 0];
    
    return string(arg0[0]) + "." + string(arg0[1]) + "." + string(arg0[2]);
};

is_version_greater = function(arg0, arg1)
{
    if (is_undefined(arg0))
        arg0 = [0, 0, 0];
    
    if (is_undefined(arg1))
        arg1 = [0, 0, 0];
    
    return arg0[0] > arg1[0] || (arg0[0] == arg1[0] && arg0[1] > arg1[1]) || (arg0[0] == arg1[0] && arg0[1] == arg1[1] && arg0[2] > arg1[2]);
};

update_lang_version = function(arg0)
{
    var version = string_to_version("0.0.0");
    var changes_file = get_lang_folder_path() + "changes.json";
    
    if (file_exists(changes_file))
    {
        var changes = scr_load_json(changes_file);
        var versions = variable_struct_get_names(changes);
        
        for (var i = 0; i < array_length(versions); i++)
        {
            var ver = string_to_version(versions[i]);
            
            if (is_version_greater(ver, version))
                version = ver;
        }
    }
    
    cur_translation_version = version;
    last_translation_version = version;
};

update_language = function()
{
    if (file_exists(get_lang_folder_path() + "settings.json"))
    {
        var settings = scr_load_json(get_lang_folder_path() + "settings.json");
        var lang_code = variable_struct_get(settings, "lang_code");
        
        if (is_undefined(lang_code))
            lang_code = "en";
        
        global.lang = lang_code;
        global.lang_settings = settings;
        update_lang_version();
    }
    else
    {
        global.lang_settings = json_parse("{\"name\": \"English\"}");
    }
};

update_language();
files_url = get_lang_setting("files_url", "");
scr_init_localization();
_alpha = 0;
loading_new_translation_files = false;

if (os_type != os_windows && os_type != os_android)
    exit;

if (files_url != "")
    lang_changes_call = http_get(files_url + "changes.json");

desc_folded = true;
panel_visible = true;
files_in_upload = {};
datas_in_upload = {};
loaded_files = [];
loaded_datas = [];
loading_error = "";
settings_loaded = false;

load_settings = function()
{
    var base_dir = (os_type == os_windows) ? ("\\\\?\\" + program_directory) : global.savepath;
    files_in_upload = {};
    loaded_files = [];
    loading_error = "";
    
    if (!variable_struct_exists(files_in_upload, "settings.json"))
        variable_struct_set(files_in_upload, "settings.json", http_get_file(get_lang_setting("files_url", "") + "settings.json", base_dir + "tmp/settings.json"));
    
    if (!variable_struct_exists(files_in_upload, "changes.json"))
        variable_struct_set(files_in_upload, "changes.json", http_get_file(get_lang_setting("files_url", "") + "changes.json", base_dir + "tmp/changes.json"));
};

load_files = function()
{
    var base_dir = (os_type == os_windows) ? ("\\\\?\\" + program_directory) : global.savepath;
    files_in_upload = {};
    loaded_files = [];
    loading_error = "";
    var files = translation_version_changes_files;
    
    for (var i = 0; i < array_length(files); i++)
    {
        var file = string_replace_all(files[i], "..", "");
        variable_struct_set(files_in_upload, file, http_get_file(get_lang_setting("files_url", "") + files[i], base_dir + "tmp/" + file));
    }
};

load_datas = function()
{
    var base_dir = (os_type == os_windows) ? ("\\\\?\\" + program_directory) : global.savepath;
    datas_in_upload = {};
    loaded_datas = [];
    loading_error = "";
    var datas = translation_version_changes_datas;
    var datas_url = get_lang_setting("datas_url", files_url);
    
    if (is_array(datas_url))
        datas_url = string_copy(datas_url[0], 1, string_last_pos("/", datas_url[0]));
    
    for (var i = 0; i < array_length(datas); i++)
    {
        var file = datas_url + "data_ch" + string(datas[i]) + ".win";
        var path = "";
        
        if (datas[i] > 0)
            path = "chapter" + string(datas[i]);
        
        variable_struct_set(datas_in_upload, datas[i], http_get_file(file, base_dir + "tmp/" + path + "/data.win"));
    }
};

copy_files_from_tmp = function()
{
    var base_dir = (os_type == os_windows) ? ("\\\\?\\" + program_directory) : global.savepath;
    
    for (var i = 0; i < array_length(loaded_files); i++)
        file_copy(base_dir + "tmp/" + loaded_files[i], base_dir + "lang/" + loaded_files[i]);
    
    for (var i = 0; i < array_length(loaded_datas); i++)
    {
        var path_from = "data.win";
        var path_to = "data.win";
        
        if (loaded_datas[i] > 0)
        {
            path_from = "chapter" + string(loaded_datas[i]) + "/data.win";
            
            if (os_type == os_android)
                path_to = "packs/chapter" + string(loaded_datas[i]) + "_windows.pack";
            else
                path_to = "chapter" + string(loaded_datas[i]) + "_windows/data.win";
        }
        
        file_copy(base_dir + "tmp/" + path_from, base_dir + path_to);
    }
    
    loading_new_translation_files = false;
};

update_changes_file = function()
{
    var base_dir = (os_type == os_windows) ? ("\\\\?\\" + program_directory) : global.savepath;
    file_copy(base_dir + "tmp/changes.json", base_dir + "lang/changes.json");
};

clear_tmp = function()
{
    var base_dir = (os_type == os_windows) ? ("\\\\?\\" + program_directory) : global.savepath;
    directory_destroy(base_dir + "tmp");
};
