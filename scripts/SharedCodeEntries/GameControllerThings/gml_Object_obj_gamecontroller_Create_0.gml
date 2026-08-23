if (instance_number(obj_gamecontroller) > 1)
{
    instance_destroy();
    exit;
}

global.lang_folder = working_directory + "../lang/"

global.lang = "en"
global.orig_en = false

global.is_console = scr_is_switch_os() || os_type == os_ps4 || os_type == os_ps5;
scr_file_exists_init(global.lang_folder, undefined);
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

enable_loading = function()
{
    _load_enabled = true;
};

init_global_vars();
global.translator_mode = 0;
speed_mode = 0;
global.special_mode = 0
global.translated_songs = 1
if (!global.is_console)
{
	ossafe_ini_open("true_config.ini")
	global.special_mode = ini_read_real("LANG", "special_mode", global.special_mode)
	global.translated_songs = ini_read_real("LANG", "translated_songs", global.translated_songs)
	ossafe_ini_close()
}
else
{
	ld_load_state = 0
}
global.lang_sprites = ds_map_create();
global.lang_sounds = ds_map_create();
global.lang_fonts = ds_map_create();
global.lang_settings = {};

if (scr_file_exists(global.lang_folder + "settings.json"))
{
    var settings = scr_load_json(global.lang_folder + "settings.json");
    var lang_code = variable_struct_get(settings, "lang_code");
    
    if (is_undefined(lang_code))
        lang_code = "en";
    
    global.lang = lang_code;
    global.lang_settings = settings;
}
else
{
    global.lang_settings = json_parse("{\"name\": \"English\"}");
}

if (get_lang_setting("translator_mode", 0))
{
    global.used_strings = ds_map_create();
    global.changed_strings = ds_map_create();
    global.lang_to_orig = ds_map_create();
    global.orig_to_lang = ds_map_create();
    global.used_room_strings = ds_map_create();
    
    new_translations_filename = "new_translations_ch" + string(global.chapter) + ".json";
    
    if (scr_file_exists(new_translations_filename)) {
        global.new_translations = scr_84_load_map_json(new_translations_filename);
    }
    else {
        global.new_translations = ds_map_create();
    }
}

add_new_translation = function(arg0, arg1)
{
    ds_map_set(global.orig_to_lang, ds_map_find_value(global.lang_to_orig, arg0), arg1);
    ds_map_set(global.lang_to_orig, arg1, ds_map_find_value(global.lang_to_orig, arg0));
    var size = ds_map_size(global.used_room_strings);
    var key = ds_map_find_first(global.used_room_strings);
    
    for (var i = 0; i < size; i++)
    {
        if (ds_map_find_value(global.used_room_strings, key) == arg0)
        {
            ds_map_set(global.changed_strings, arg0, arg1);
            ds_map_set(global.new_translations, key, arg1);
            ds_map_set(global.lang_map, key, arg1);
            
            var new_translations_file = file_text_open_write(new_translations_filename);
            file_text_write_string(new_translations_file, json_encode(global.new_translations));
            file_text_close(new_translations_file);
            
            break;
        }
        
        key = ds_map_find_next(global.used_room_strings, key);
    }
};

file_find_close();
scr_init_localization();
update_on_room_end = false;

if (scr_file_exists(working_directory + "lang/lang_en.json")) {
    orig_filename = working_directory + "lang/lang_en.json"
    global.orig_map = scr_84_load_map_json(orig_filename)
}

if (os_type == os_android)
    instance_create(0, 0, obj_mobilecontrols);