if (myString == " ")
{
    if (i_ex(obj_ch2_noellepuzzle_screen))
        with (obj_ch2_noellepuzzle_screen)
        {
            if (forcefield_id == other.forcefield_id)
                instance_destroy(self);
        }
}

var button_sound_symbols = get_chapter_lang_setting("button_sounds_symbols", ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?"]);

if (init == 0)
{
    for (i = 0; i < array_length(button_sound_symbols); i++)
    {
        if (myString == button_sound_symbols[i])
        {
            textImage = i;
            break;
        }
    }
    
    init = 1;
}

var checkPress = 0;

if (i_ex(obj_actor) && !pressed && pressable && global.interact == 0)
{
    if (place_meeting(x, y, obj_actor))
        checkPress = 1;
}

if (checkPress)
{
    if (pressed == 0)
    {
        pressedBuffer = 2;
        pressed = 1;
        
        if (i_ex(obj_ch2_noellepuzzle_screen))
            with (obj_ch2_noellepuzzle_screen)
                image_timer = 7;
        
        
        if (myString != " ")
        {
            var _snd = snd_play(scr_84_get_sound("snd_speak_and_spell_" + myString));
            var _volume = (buttonIndex == 7) ? 1 : max(1 - (buttonIndex / 4), 0);
            audio_sound_gain(_snd, _volume, 0);
        }
        
        alarm[0] = 15;
        controller.finalString += myString;
        controller.buttonx = x;
        down = true;
        
        if (i_ex(obj_ch2_noellepuzzle_screen))
        {
            with (obj_ch2_noellepuzzle_screen)
            {
                if (forcefield_id == other.forcefield_id && myString != other.myString)
                {
                    snd_play(snd_wing);
                    myString = other.myString;
                }
            }
        }
    }
}
else if (pressable && global.interact == 0)
{
    if (pressedBuffer <= 0)
        pressed = 0;
}
