function add_sprite(argument0, argument1) //gml_Script_add_sprite
{
    if (argument1 == undefined)
        argument1 = 1
    var spr_name = argument0
    var orig_sprite = asset_get_index(spr_name)
    var frame_num = 0
    var filename = working_directory + "../lang/" + global.lang + "/chapter3/sprites/" + spr_name + ".png"
    if file_exists(filename)
    {
        if (orig_sprite != -1)
            frame_num = sprite_get_number(orig_sprite)
        if (frame_num == -1 || frame_num == 0)
            frame_num = argument1

        var sprites_settings = get_chapter_lang_setting("sprites_settings", -1)
        var sprite_settings = undefined
        if (sprites_settings != -1) {
            sprite_settings = variable_struct_get(sprites_settings, spr_name)
        }

        if (sprite_settings != undefined) {
            fr_num = variable_struct_get(sprite_settings, "frame_num")
            if (fr_num != undefined)
                frame_num = int64(fr_num)
        }

        var sprite = sprite_add(filename, frame_num, false, false, 0, 0)
        xoffset = 0
        yoffset = 0
        spr_speed = 1
        spr_speed_type = 1
        if (orig_sprite != -1) {
            xoffset = sprite_get_xoffset(orig_sprite)
            yoffset = sprite_get_yoffset(orig_sprite)
            if (xoffset == floor((sprite_get_width(orig_sprite) / 2)))
                xoffset = floor((sprite_get_width(sprite) / 2))
            if (yoffset == floor((sprite_get_height(orig_sprite) / 2)))
                yoffset = floor((sprite_get_height(sprite) / 2))
            spr_speed = sprite_get_speed(orig_sprite)
            spr_speed_type = sprite_get_speed_type(orig_sprite)
            sprite_set_bbox_mode(sprite, sprite_get_bbox_mode(orig_sprite))
            sprite_set_bbox(sprite, sprite_get_bbox_left(orig_sprite), sprite_get_bbox_top(orig_sprite), sprite_get_bbox_right(orig_sprite), sprite_get_bbox_bottom(orig_sprite))
        }

        if (sprite_settings != undefined) {
            xoff = variable_struct_get(sprite_settings, "xoffset")
            if (xoff != undefined)
                xoffset = int64(xoff)
            yoff = variable_struct_get(sprite_settings, "yoffset")
            if (yoff != undefined)
                yoffset = int64(yoff)
            spd = variable_struct_get(sprite_settings, "spr_speed")
            if (spd != undefined)
                spr_speed = int64(spd)
        }
        sprite_set_speed(sprite, spr_speed, spr_speed_type)
        sprite_set_offset(sprite, xoffset, yoffset)

        array_push(global.loaded_sprites, sprite)

        var sp_filename = working_directory + "../lang/" + global.lang + "/chapter3/sprites/sp_" + spr_name + ".png"
        if file_exists(sp_filename) {
            if (sprites_settings != -1) {
                sprite_settings = variable_struct_get(sprites_settings, "sp_" + spr_name)
            }
            if (sprite_settings != undefined) {
                fr_num = variable_struct_get(sprite_settings, "frame_num")
                if (fr_num != undefined)
                    frame_num = int64(fr_num)
            }
            sp_sprite = sprite_add(sp_filename, frame_num, false, false, 0, 0)
            if (orig_sprite != -1) {
                xoffset = sprite_get_xoffset(orig_sprite)
                yoffset = sprite_get_yoffset(orig_sprite)
                if (xoffset == floor((sprite_get_width(orig_sprite) / 2)))
                    xoffset = floor((sprite_get_width(sp_sprite) / 2))
                if (yoffset == floor((sprite_get_height(orig_sprite) / 2)))
                    yoffset = floor((sprite_get_height(sp_sprite) / 2))

                sprite_set_bbox_mode(sp_sprite, sprite_get_bbox_mode(orig_sprite))
                sprite_set_bbox(sp_sprite, sprite_get_bbox_left(orig_sprite), sprite_get_bbox_top(orig_sprite), sprite_get_bbox_right(orig_sprite), sprite_get_bbox_bottom(orig_sprite))
            }
            if (sprite_settings != undefined) {
                xoff = variable_struct_get(sprite_settings, "xoffset")
                if (xoff != undefined)
                    xoffset = int64(xoff)
                yoff = variable_struct_get(sprite_settings, "yoffset")
                if (yoff != undefined)
                    yoffset = int64(yoff)
                spd = variable_struct_get(sprite_settings, "spr_speed")
                if (spd != undefined)
                    spr_speed = int64(spd)
            }
            sprite_set_speed(sp_sprite, spr_speed, spr_speed_type)
            sprite_set_offset(sp_sprite, xoffset, yoffset)
            ds_map_add(global.chemg_sprite_map, ("sp_" + spr_name), sp_sprite)
        }
    }
    else
        sprite = orig_sprite

    ds_map_add(global.chemg_sprite_map, spr_name, sprite)
    return sprite;
}

