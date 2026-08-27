var room_name = room_get_name(room);
return string_pos("room_castle", room_name) == 1
    || string_pos("room_dw_castle", room_name) == 1
    || string_pos("room_dw_ralsei_castle", room_name) == 1
    || room_name == "room_legend"
    || room_name == "room_gameover"
    || room_name == "room_shop1"
    || room_name == "room_legend_neo"
    || room_name == "room_cc_lancer";
