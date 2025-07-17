scr_board_battlehealth();
depth = 100010;
kris = 1184;

with (obj_caterpillarchara)
{
    if (name == "ralsei")
        other.ralsei = id;
    
    if (name == "susie")
        other.susie = id;
}

plpo = obj_ch3_gameshow.playerpodiums;
tenna = 157;
console = obj_ch3_gameshow.gameconsole;
couch = obj_ch3_gameshow.couch;
wires = obj_ch3_gameshow.wires;
con = 0;
timer = 0;
encounterflag = 0;
kris.ignoredepth = 1;
susie.ignoredepth = 1;
ralsei.ignoredepth = 1;
remmove = [];
battlesprite = 0;
khealth = 0;
rhealth = 0;
shealth = 0;
hitcount = 0;
battletime = 0;
turns = 1;
lettergrade = "Z";
rem1 = global.hp[1];
rem2 = global.hp[2];
rem3 = global.hp[3];
rcon = 0;
rtimer = 0;
reachedend_draw_triangle_siner = 0;
snd_play_delay(245, 3, 1, 1.1);
snd_play_delay(245, 10, 1, 1.2);
global.flag[1011]++;
specialend = 0;
battleseconds = 0;
battleminutes = 0;
tpgained = 0;
updatehealth = 0;
lerptime = 15;
downdist = 128;

_zlet = stringsetloc("Z", "obj_round_evaluation_slash_Draw_0_gml_41_0");
_clet = stringsetloc("C", "obj_round_evaluation_slash_Draw_0_gml_42_0");
_blet = stringsetloc("B", "obj_round_evaluation_slash_Draw_0_gml_43_0");
_alet = stringsetloc("A", "obj_round_evaluation_slash_Draw_0_gml_44_0");
_slet = stringsetloc("S", "obj_round_evaluation_slash_Draw_0_gml_45_0");
_tlet = stringsetloc("T", "obj_round_evaluation_slash_Draw_0_gml_46_0");
_flet = stringsetloc("F", "obj_round_evaluation_slash_Draw_0_gml_47_0");

function get_letter_rank(arg0)
{
    switch (arg0) {
        case "A": return _alet;
        case "B": return _blet;
        case "C": return _clet;
        case "S": return _slet;
        case "T": return _tlet;
        case "Z": return _zlet;
        case "F": return _flet;
        default: return arg0;
    }
}