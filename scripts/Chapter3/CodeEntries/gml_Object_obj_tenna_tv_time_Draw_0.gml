if (!is_active)
    exit;

if (!intro_mode)
    scr_dbox();

lights_anim += lights_anim_speed;
var spr_lights = scr_84_get_sprite("spr_dw_tv_time_lights")
draw_sprite_ext(spr_lights, lights_anim, x_pos, y_pos, 1 * room_scale, 1 * room_scale, 0, c_white, 1);
draw_set_color(c_black);

var w = sprite_get_width(spr_lights) * room_scale
var h = sprite_get_height(spr_lights) * room_scale - 4
var xx = x_pos - sprite_get_xoffset(spr_lights)
var yy = y_pos - sprite_get_yoffset(spr_lights)

var light_xs = get_chapter_lang_setting("its_tv_time_lights_xs", [0, 165, 210, 310])
light_xs[4] = w

var d = light_xs[max(0, floor(4 - lights_max))]
ossafe_fill_rectangle(xx + d, yy, xx + w, yy + h);

// if (lights_max >= 3) {
//     var d = 
//     ossafe_fill_rectangle(xx + 100, yy, xx + w, yy + h);
//     // ossafe_fill_rectangle(x_pos + (165 * room_scale), y_pos, x_pos + (210 * room_scale), y_pos + (130 * room_scale));
// } else

// if (lights_max >= 2) {
//     ossafe_fill_rectangle(xx + 200, yy, xx + w, yy + h);
//     // ossafe_fill_rectangle(x_pos + (210 * room_scale), y_pos, x_pos + (310 * room_scale), y_pos + (130 * room_scale));
// } else

// if (lights_max >= 1) {
//     ossafe_fill_rectangle(xx + 300, yy, xx + w, yy + h);
//     // ossafe_fill_rectangle(x_pos + (310 * room_scale), y_pos, x_pos + (500 * room_scale), y_pos + (130 * room_scale));
// }

for (var i = 0; i < tv_max; i++)
{
    tv_text[i][1].x = scr_movetowards(tv_text[i][1].x, 1 * room_scale, 0.4 * tv_pitch);
    tv_text[i][1].y = scr_movetowards(tv_text[i][1].y, 1 * room_scale, 0.4 * tv_pitch);
    draw_sprite_ext(tv_text[i][0], 0, tv_text[i][2].x, tv_text[i][2].y, tv_text[i][1].x, tv_text[i][1].y, 0, c_white, 1);
}
