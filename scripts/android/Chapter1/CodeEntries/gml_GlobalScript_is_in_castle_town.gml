var room_name = room_get_name(room);
return string_pos("room_dark", room_name) == 1
    || string_pos("room_castle", room_name) == 1
    || room_name == "room_legend"
    || room_name == "room_gameover";
