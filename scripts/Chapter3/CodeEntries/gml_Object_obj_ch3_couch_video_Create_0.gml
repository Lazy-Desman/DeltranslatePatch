var video_caption_times = get_chapter_lang_setting("video_caption_times", [[0.02, 0.13], [0.22, 0.27], [0.28, 0.32], [0.34, 0.39], [0.44, 0.51], [0.52, 0.57], [0.58, 0.62], [0.63, 0.67], [0.68, 0.73]]);
_video_enabled = false;
_vid_surface = -4;
_chroma_surface = -4;
var offset = scr_is_switch_os() ? 0.015 : 0;
text_list = [new scr_video_caption(stringsetloc("It's now time for our feature presentation", "obj_ch3_couch_video_slash_Create_0_gml_4_0"), video_caption_times[0][0] + offset, video_caption_times[0][1] + offset), new scr_video_caption(stringsetloc("Coming straight from your house", "obj_ch3_couch_video_slash_Create_0_gml_6_0"), video_caption_times[1][0] + offset, video_caption_times[1][1] + offset), new scr_video_caption(stringsetloc("Coming straight from YOUR house", "obj_ch3_couch_video_slash_Create_0_gml_7_0"), video_caption_times[2][0] + offset, video_caption_times[2][1] + offset), new scr_video_caption(stringsetloc("He's the One", "obj_ch3_couch_video_slash_Create_0_gml_8_0"), video_caption_times[3][0] + offset, video_caption_times[3][1] + offset), new scr_video_caption(stringsetloc("He's GROOVY and NEVER glooby!", "obj_ch3_couch_video_slash_Create_0_gml_9_0"), video_caption_times[4][0] + offset, video_caption_times[4][1] + offset), new scr_video_caption(stringsetloc("You can't get this from an EGG!", "obj_ch3_couch_video_slash_Create_0_gml_10_0"), video_caption_times[5][0] + offset, video_caption_times[5][1] + offset), new scr_video_caption(stringsetloc("The sensation of your screen", "obj_ch3_couch_video_slash_Create_0_gml_11_0"), video_caption_times[6][0] + offset, video_caption_times[6][1] + offset), new scr_video_caption(stringsetloc("The show that makes you scream", "obj_ch3_couch_video_slash_Create_0_gml_12_0"), video_caption_times[7][0] + offset, video_caption_times[7][1] + offset), new scr_video_caption(stringsetloc("Say it with him, folks!", "obj_ch3_couch_video_slash_Create_0_gml_13_0"), video_caption_times[8][0] + offset, video_caption_times[8][1] + offset)];
text_index = 0;
house_index = 2;
var file_name = "tennaIntroF1_compressed_28";
var lwc_file_name = string_lower(file_name); // console runners are case-sensitive
if (scr_file_exists(get_lang_folder_path() + "chapter3/vid/" + file_name + ".mp4"))
    video_open(get_lang_folder_path() + "chapter3/vid/" + file_name + ".mp4");
else if (scr_file_exists(get_lang_folder_path() + "chapter3/vid/" + lwc_file_name + ".mp4"))
    video_open(get_lang_folder_path() + "chapter3/vid/" + lwc_file_name + ".mp4");
else 
    video_open("vid/" + file_name + ".mp4");

video_enable_loop(false);
video_set_volume(global.flag[17]);
var orig_path = "vid/" + file_name + ".mp4";

if (os_type == os_android)
    orig_path = global.savepath + "chapter3_windows/vid/" + file_name + ".mp4";

var lang_path = get_lang_folder_path() + "chapter3/vid/" + file_name + ".mp4";
var path = orig_path;

if (scr_file_exists(lang_path) && global.translated_songs)
    path = lang_path;

if (!global.is_console)
    video_set_volume(clamp(0.3 * global.flag[17], 0, 0.3));

videochromasampler = -4;
var _format = video_get_format();

if (_format == 1)
    videochromasampler = shader_get_sampler_index(shd_video_yuv, "v_chroma");

clean_up = function()
{
    if (os_type == os_ps4 || os_type == os_ps5)
    {
        var _status = video_get_status();
        
        if (_status != 0)
            video_close();
    }
    else
    {
        video_close();
    }
    
    if (surface_exists(_vid_surface))
        surface_free(_vid_surface);
    
    if (surface_exists(_chroma_surface))
        surface_free(_chroma_surface);
};

if (scr_is_switch_os())
    target_duration = 1224;

video_position = 0;