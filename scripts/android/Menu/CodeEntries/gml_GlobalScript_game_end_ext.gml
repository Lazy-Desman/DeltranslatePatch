function game_end_ext()
{
    if (os_type == os_android)
    {
        audio_stop_all();
        
        if (variable_global_exists("bgm") && global.bgm != -4)
            global.bgm = -4;
        
        room_goto(0);
        game_end();
    }
    else
    {
        game_end();
    }
}
