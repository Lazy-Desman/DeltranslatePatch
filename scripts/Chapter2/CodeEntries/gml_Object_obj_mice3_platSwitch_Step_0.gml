if (place_meeting(x, y, obj_mainchara) || place_meeting(x, y, obj_marker) || place_meeting(x, y, obj_actor) || place_meeting(x, y, obj_trigger_area) || (instance_exists(obj_noelle_scared) && place_meeting(x, y, obj_noelle_scared) && obj_noelle_scared.jumpy == 0))
{
    if (toggle == 0)
    {
        if instance_exists(obj_controller_city_mice3)
            obj_controller_city_mice3.micescore += 1
        for (i = 0; i < string_length(stringsetloc("ILOVEMOUSE", "obj_controller_city_mice3_slash_Draw_0_gml_18_0")); i++)
        {
            if (obj_controller_city_mice3.micescore == (i + 1)) {
                snd_play(scr_84_get_sound("snd_speak_and_spell_" + (string_char_at(stringsetloc("ILOVEMOUSE", "obj_controller_city_mice3_slash_Draw_0_gml_18_0"), (i + 1)))))
            }
        }
    }
    toggle = 1
}
image_index = toggle
