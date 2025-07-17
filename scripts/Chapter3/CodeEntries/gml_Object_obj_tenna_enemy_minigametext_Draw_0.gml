draw_set_font(scr_84_get_font("mainbig"));
var stringlength = string_length(mystring);
var xx = (camerax() + 320) - string_width(mystring);
var yy = cameray() + 180;

repeat (timerspeed)
{
    if (timer == 0)
    {
        scale = 0;
        scr_lerpvar("scale", 0, 2, 40, -2, "out");
        scale = 2;
        scr_lerpvar("hspace", 0, 32, 45, -2, "out");
    }
    
    if (timer == 26)
        scr_lerpvar("yyy", 0, -300 - (stringlength * 18), 26, 1, "in");
    
    if (timer >= 30)
    {
        with (obj_tenna_enemy)
            stopshoot = 0;
    }
    
    if (timer >= 100)
        instance_destroy();
    
    timer++;
    
    if (scr_debug())
    {
        if (keyboard_check(vk_space))
        {
            timer = 0;
            con = 0;
            yyy = 0;
        }
    }
    
    var xx_off = 0
    for (var i = 1; i < stringlength; i++)
    {
        var mychar = string_char_at(mystring, i);
        var myyyy = min(0, yyy + (i * 20));
        draw_set_color(c_black);
        draw_text_transformed(xx + xx_off + 4, yy + 4 + myyyy, mychar, scale, scale, 0);
        draw_set_color(c_white);
        draw_text_transformed_outline(xx + xx_off, yy + myyyy, mychar, scale, scale, 8388608);
        xx_off += string_width(mychar) * 2
    }
}
