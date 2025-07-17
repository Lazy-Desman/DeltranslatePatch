function add_font(argument0, argument1) //gml_Script_add_font
{
    fnt_name = argument0
    fnt_size = argument1
    lang_settings = ds_map_find_value(global.langs_settings, global.lang)
    fonts_range = ds_map_find_value(lang_settings, "fonts_range")
    path = (((working_directory + "lang/") + global.lang) + "/fonts/")
    filename_ttf = ((path + fnt_name) + ".ttf")
    filename_otf = ((path + fnt_name) + ".otf")
    font = asset_get_index(fnt_name)
    if file_exists(filename_ttf)
        font = font_add(filename_ttf, fnt_size, font_get_bold(font), font_get_italic(font), ds_list_find_value(fonts_range, 0), ds_list_find_value(fonts_range, 1))
    else if file_exists(filename_otf)
        font = font_add(filename_otf, fnt_size, font_get_bold(font), font_get_italic(font), ds_list_find_value(fonts_range, 0), ds_list_find_value(fonts_range, 1))
    else if ((asset_get_index(fnt_name + "_" + global.lang)) != -1)
        font = asset_get_index(fnt_name + "_" + global.lang) 
    ds_map_add(global.font_map, fnt_name, font)
}

