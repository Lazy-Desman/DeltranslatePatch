mycolor = c_white;
global.interact = 1;
con = 0;
timer = 0;
ibuff = 0;
dholdbuff = 0;
uholdbuff = 0;
alphabet = get_chapter_lang_setting("input_game_name_chars", "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!.-")
alphanumericarray = []
for (var i = 0; i < string_length(alphabet); i++) {
    alphanumericarray[i] = string_char_at(alphabet, i + 1)
}

maxletter = array_length(alphanumericarray) - 1;
letter[0] = 0;
letter[1] = 0;

if (global.lang == "ja")
    letter[1] = scr_ja_alphanumericarray_check("ソ");

letter[2] = 0;
init = 0;
tutprog = 1;
strbut1 = scr_get_input_name(4);
strbut2 = scr_get_input_name(5);
strdown = scr_get_input_name(0);
strup = scr_get_input_name(2);
tennatalktimer = 0;
presscount = 0;
selected = 0;
tenna = 0;
susie = 0;
ralsei = 0;
kris = 0;
ralentrytimer = 0;
ralreset = 30;
susentrytimer = 0;
susreset = 45;
susdone = 0;
raldone = 0;
badwordcon = 0;
badwordtimer = 0;
overalltimer = 0;
susmemsprite = 0;
ralmemsprite = 0;
krismemsprite = 0;
controller_active = global.is_console || obj_gamecontroller.gamepad_active;
controls_init = false;
