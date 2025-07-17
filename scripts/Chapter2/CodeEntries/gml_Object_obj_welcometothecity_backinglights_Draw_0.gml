if instance_exists(obj_mainchara)
    checkX = obj_mainchara.x + 20
timer += 2
c_rainbow = make_color_hsv((timer % 255), 255, 255)
curColor = merge_color(merge_color(c_white, c_rainbow, 0.5), c_black, 0.2)
draw_set_color(curColor)
if (createAndStay == 0)
{
    for (i = 0; i < array_length(welcome_sign_x1); i++)
        draw_rectangle((start_x + welcome_sign_x1[i] * 2 - 1), 110, (start_x + welcome_sign_x2[i] * 2 + 1), 220, false)
}
if (createAndStay == 1)
{
    for (i = 0; i < array_length(welcome_sign_x1); i++)
    {
        if (checkX >= (start_x + welcome_sign_x1[i] * 2 - 1))
            newcount = i + 1
    }
    if (count < newcount)
        count = newcount
    for (i = 0; i < array_length(welcome_sign_x1); i++)
    {
        if (count >= (i + 1))
            draw_rectangle((start_x + welcome_sign_x1[i] * 2 - 1), 110, (start_x + welcome_sign_x2[i] * 2 + 1), 220, false)
    }
    if (count == array_length(welcome_sign_x1))
    {
        if (global.plot < 67)
            global.plot = 67
    }
}
draw_set_color(c_white)
