function add_sprite(argument0, argument1) //gml_Script_add_sprite
{
    if (argument1 == undefined)
        argument1 = 1
    var spr_name = argument0
	var spr_name_alt = scr_letter_fix(spr_name)
    var orig_sprite = asset_get_index(spr_name)
    var filename = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sprites/" + spr_name_alt + ".png"
    if (!scr_file_exists(filename)) {
        filename = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sprites/" + spr_name + ".png"
    }
    if (!scr_file_exists(filename)) {
        filename = get_lang_folder_path() + "shared/sprites/" + spr_name_alt + ".png"
    }
    if (!scr_file_exists(filename)) {
        filename = get_lang_folder_path() + "shared/sprites/" + spr_name + ".png"
    }
    if scr_file_exists(filename)
    {
        var sprite = _create_sprite(filename, orig_sprite, spr_name, argument1)
        array_push(global.loaded_sprites, sprite)

        var sp_filename = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sprites/sp_" + spr_name_alt + ".png"
        if (!scr_file_exists(sp_filename)) {
            sp_filename = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sprites/sp_" + spr_name + ".png"
        }
        if (!scr_file_exists(sp_filename)) {
            sp_filename = get_lang_folder_path() + "shared/sprites/sp_" + spr_name_alt + ".png"
        }
        if (!scr_file_exists(sp_filename)) {
            sp_filename = get_lang_folder_path() + "shared/sprites/sp_" + spr_name + ".png"
        }
        if scr_file_exists(sp_filename) {
            var sp_sprite = _create_sprite(sp_filename, orig_sprite, "sp_" + spr_name, argument1)
            ds_map_add(global.chemg_sprite_map, "sp_" + spr_name, sp_sprite)
        }

        var spm_filename = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sprites/spm_" + spr_name_alt + ".png"
        if (!scr_file_exists(spm_filename)) {
            spm_filename = get_lang_folder_path() + "chapter" + string(global.chapter) + "/sprites/spm_" + spr_name + ".png"
        }
        if (!scr_file_exists(spm_filename)) {
            spm_filename = get_lang_folder_path() + "shared/sprites/spm_" + spr_name_alt + ".png"
        }
        if (!scr_file_exists(spm_filename)) {
            spm_filename = get_lang_folder_path() + "shared/sprites/spm_" + spr_name + ".png"
        }
        if scr_file_exists(spm_filename) {
            var spm_sprite = _create_sprite(spm_filename, orig_sprite, "spm_" + spr_name, argument1)
            ds_map_add(global.chemg_sprite_map, "spm_" + spr_name, spm_sprite)
        }
    }
    else
        sprite = orig_sprite

    ds_map_add(global.chemg_sprite_map, spr_name, sprite)
    return sprite;
}

function _create_sprite(argument0, argument1, argument2, argument3) //gml_Script__create_sprite 
{
    var filename = argument0
    var orig_sprite = argument1
    var spr_name = argument2
    var frame_num = 0
    if (orig_sprite != -1)
        frame_num = sprite_get_number(orig_sprite)
    if (frame_num == -1 || frame_num == 0)
        frame_num = argument3

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

    return sprite
}