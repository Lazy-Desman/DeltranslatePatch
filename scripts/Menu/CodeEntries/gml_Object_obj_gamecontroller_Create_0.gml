if (instance_number(obj_gamecontroller) > 1)
{
    instance_destroy();
    exit;
}

is_connecting_controller = 3;
gamepad_active = 0;
gamepad_id = 0;
gamepad_shoulderlb_reassign = 0;
gamepad_type = "";

global.is_console = scr_is_switch_os() || os_type == os_ps4 || os_type == os_ps5;

if (!variable_global_exists("gamepad_type"))
    global.gamepad_type = "N/A";

if (variable_global_exists("lang_map"))
    return;
ossafe_ini_open("true_config.ini")
global.special_mode = ini_read_real("LANG", "special_mode", 0)
global.translated_songs = ini_read_real("LANG", "translated_songs", 1)
ossafe_ini_close()
global.lang_sprites = ds_map_create()
global.lang_sounds = ds_map_create()
global.font_map = ds_map_create()
global.langs_names = []
global.langs_settings = ds_map_create()
var i = 0
for (var filename = file_find_first(((working_directory + "lang/") + "*"), 16); filename != ""; filename = file_find_next())
{
    if (file_exists((((working_directory + "lang/") + filename) + "/settings.json")) && file_exists((((working_directory + "lang/") + filename) + "/strings.json")))
    {
        global.langs_names[i] = filename
        i++
        ds_map_set(global.langs_settings, filename, scr_load_json((((working_directory + "lang/") + filename) + "/settings.json")))
    }
}
if (i == 0) {
    global.langs_names = ["en"]
    ds_map_add(global.langs_settings, "en", json_decode("{\"name\": \"English\"}"))
}
file_find_close()
scr_init_localization()