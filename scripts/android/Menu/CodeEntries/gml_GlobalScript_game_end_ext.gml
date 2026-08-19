function game_end_ext()
{
    if (os_type == os_android)
    {
        audio_stop_all();
        
        if (variable_global_exists("bgm") && global.bgm != -4)
            global.bgm = -4;
        
        room_goto(PLACE_CHAPTER_SELECT_2x);
        game_end();
    }
    else
    {
        game_end();
    }
}
