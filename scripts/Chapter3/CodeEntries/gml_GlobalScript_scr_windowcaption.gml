function scr_windowcaption(argument0) //gml_Script_scr_windowcaption
{
    if (global.tempflag[10] != 1 && global.chapter == 1)
        window_set_caption(argument0)
    else
        window_set_caption(stringsetloc("DELTARUNE Chapter ", "scr_windowcaption_0_0") + string(global.chapter))
}

