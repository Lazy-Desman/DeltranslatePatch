var button_sound_symbols = get_chapter_lang_setting("button_sounds_symbols", ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9","!","?"])
if (init == 0)
{
    for (i = 0; i < array_length(button_sound_symbols); i++) {
        if (myString == button_sound_symbols[i]) {
            textImage = i
            break
        }
    }
    init = 1
}
var checkPress = 0
if (i_ex(obj_mainchara) && pressable && global.interact == 0)
{
    if place_meeting(x, y, obj_mainchara)
        checkPress = 1
}
if checkPress
{
    if (pressed == 0)
    {
        pressedBuffer = 2
        pressed = 1
        with (obj_ch2_keyboardpuzzle_speaker)
            image_timer = 7
        if (myString == button_sound_symbols[0] && irandom(99) == 0)
            snd_play(snd_txtsans)
        else if (myString == "!")
            snd_play(snd_speak_and_spell_Exclamation)
        else
            snd_play(scr_84_get_sound("snd_speak_and_spell_" + myString))
        obj_ch2_keyboardpuzzle_controller.addString = myString
        obj_ch2_keyboardpuzzle_controller.lastPressedTile = id
        with (obj_ch2_keyboardpuzzle_controller)
            event_user(0)
    }
}
else if (pressable && global.interact == 0)
{
    if (pressedBuffer <= 0)
        pressed = 0
}
pressedBuffer--
if (bouncecon > 0)
{
    if (bouncecon == 1)
    {
        drawY = 0
        bouncetimer = 0
        bouncecon = 2
    }
    if (bouncecon == 2)
    {
        pressed = 0
        drawY = -30
        bouncecon = 3
    }
    if (bouncecon == 3)
    {
        drawY = lerp(drawY, 0, 0.25)
        bouncetimer++
        if (bouncetimer >= 15)
        {
            bouncetimer = 0
            bouncecon = 0
            drawY = 0
        }
    }
}
