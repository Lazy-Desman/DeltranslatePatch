if global.translator_mode
{
    if keyboard_check_released(ord("U"))
        global.translator_mode = 0
    if speed_mode
        room_speed = 120
    if keyboard_check_released(ord("K"))
    {
        speed_mode = (!speed_mode)
        room_speed = 30
    }
    if (keyboard_check_released(ord("S")) && (!instance_exists(obj_savemenu)))
        instance_create(0, 0, obj_savemenu)
    if keyboard_check_released(ord("L"))
        scr_load()
    if keyboard_check_released(ord("Q"))
        scr_change_language()
    if keyboard_check_released(ord("R"))
    {
        scr_lang_load()
        // global.lang_loaded = "en"
        // scr_init_localization()
    }
    if keyboard_check_released(ord("N"))
        room_goto_next()
    if keyboard_check_released(ord("P"))
        room_goto_previous()

    if keyboard_check_released(ord("H")) {
        for (var i = 0; i < 4; i++) {
            if (array_length(global.char) > i) {
                scr_heal(i, 1000)
            }
        }
    }
}
else if keyboard_check_released(ord("U"))
{
    if get_lang_setting("translator_mode", 0)
        global.translator_mode = true
}
