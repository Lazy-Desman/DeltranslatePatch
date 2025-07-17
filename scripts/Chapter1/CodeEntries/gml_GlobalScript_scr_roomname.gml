function scr_roomname(argument0) //gml_Script_scr_roomname
{
    roomname = " "
    if (argument0 == 0)
        roomname = "---"
    if (argument0 == 2)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_3_0") // Kris's Room
    if (argument0 == 35)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_4_0") // ??????
    if (argument0 == 40)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_5_0") // Eye Puzzle
    if (argument0 == 45)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_6_0") // Castle Town
    if (argument0 == 49)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_7_0") // Field - Great Door
    if (argument0 == 59)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_8_0") // Field - Seam's Shop
    if (argument0 == 68)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_9_0") // Field - Great Board
    if (argument0 == 71)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_10_0") // Field - Great Board 2
    if (argument0 == 73)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_11_0") // Forest - Entrance
    if (argument0 == 82)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_12_0") // Forest - Bake Sale
    if (argument0 == 90)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_13_0") // Forest - Before Maze
    if (argument0 == 96)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_14_0") // Forest - After Maze
    if (argument0 == 97)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_15_0") // Forest - Thrashing Room
    if (argument0 == 107)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_16_0") // Card Castle - Prison
    if (argument0 == 114)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_17_0") // Card Castle - 1F
    if (argument0 == 123)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_18_0") // Card Castle - 5F
    if (argument0 == 126)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_19_0") // Card Castle - Throne
    if (argument0 == 111)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_20_0") // Card Castle - ???
    if (argument0 == 56)
        roomname = scr_84_get_lang_string("scr_roomname_slash_scr_roomname_gml_21_0")
    return roomname;
}

