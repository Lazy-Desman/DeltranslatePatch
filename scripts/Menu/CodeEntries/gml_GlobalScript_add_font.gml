function add_font(argument0, argument1) //gml_Script_add_font
{
    fnt_name = argument0
	fnt_name_alt = scr_letter_fix(fnt_name)
    fnt_size = argument1
    fonts_range = get_lang_setting("fonts_range", [32, 128])
    path = get_lang_folder_path() + "fonts/"
    filename_ttf = ((path + fnt_name) + ".ttf")
	filename_ttf_alt = ((path + fnt_name_alt) + ".ttf")
    filename_otf = ((path + fnt_name) + ".otf")
    filename_otf_alt = ((path + fnt_name_alt) + ".otf")
    font = asset_get_index(fnt_name)
    if scr_file_exists(filename_ttf_alt)
        font = font_add(filename_ttf_alt, fnt_size, font_get_bold(font), font_get_italic(font), fonts_range[0], fonts_range[1])
    else if scr_file_exists(filename_otf_alt)
        font = font_add(filename_otf_alt, fnt_size, font_get_bold(font), font_get_italic(font), fonts_range[0], fonts_range[1])
    else if ((asset_get_index(fnt_name_alt + "_" + global.lang)) != -1)
        font = asset_get_index(fnt_name_alt + "_" + global.lang) 
    else if scr_file_exists(filename_ttf)
        font = font_add(filename_ttf, fnt_size, font_get_bold(font), font_get_italic(font), fonts_range[0], fonts_range[1])
    else if scr_file_exists(filename_otf)
        font = font_add(filename_otf, fnt_size, font_get_bold(font), font_get_italic(font), fonts_range[0], fonts_range[1])
    else if ((asset_get_index(fnt_name + "_" + global.lang)) != -1)
        font = asset_get_index(fnt_name + "_" + global.lang) 
    ds_map_add(global.font_map, fnt_name, font)
}

