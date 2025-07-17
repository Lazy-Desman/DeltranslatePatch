
var video_caption_times = get_chapter_lang_setting("video_caption_times", [
    [0.02, 0.13],
    [0.22, 0.27],
    [0.28, 0.32],
    [0.34, 0.39],
    [0.44, 0.51],
    [0.52, 0.57],
    [0.58, 0.62],
    [0.63, 0.67],
    [0.68, 0.73]
])

var offset = scr_is_switch_os() ? 0.015 : 0;
text_list = [
    new scr_video_caption(stringsetloc("It's now time for our feature presentation", "obj_ch3_couch_video_slash_Create_0_gml_4_0"), video_caption_times[0][0] + offset, video_caption_times[0][1] + offset), 
    new scr_video_caption(stringsetloc("Coming straight from your house", "obj_ch3_couch_video_slash_Create_0_gml_6_0"), video_caption_times[1][0] + offset, video_caption_times[1][1] + offset), 
    new scr_video_caption(stringsetloc("Coming straight from YOUR house", "obj_ch3_couch_video_slash_Create_0_gml_7_0"), video_caption_times[2][0] + offset, video_caption_times[2][1] + offset), 
    new scr_video_caption(stringsetloc("He's the One", "obj_ch3_couch_video_slash_Create_0_gml_8_0"), video_caption_times[3][0] + offset, video_caption_times[3][1] + offset), 
    new scr_video_caption(stringsetloc("He's GROOVY and NEVER glooby!", "obj_ch3_couch_video_slash_Create_0_gml_9_0"), video_caption_times[4][0] + offset, video_caption_times[4][1] + offset), 
    new scr_video_caption(stringsetloc("You can't get this from an EGG!", "obj_ch3_couch_video_slash_Create_0_gml_10_0"), video_caption_times[5][0] + offset, video_caption_times[5][1] + offset), 
    new scr_video_caption(stringsetloc("The sensation of your screen", "obj_ch3_couch_video_slash_Create_0_gml_11_0"), video_caption_times[6][0] + offset, video_caption_times[6][1] + offset), 
    new scr_video_caption(stringsetloc("The show that makes you scream", "obj_ch3_couch_video_slash_Create_0_gml_12_0"), video_caption_times[7][0] + offset, video_caption_times[7][1] + offset), 
    new scr_video_caption(stringsetloc("Say it with him, folks!", "obj_ch3_couch_video_slash_Create_0_gml_13_0"), video_caption_times[8][0] + offset, video_caption_times[8][1] + offset)
];

var file_name = "tennaIntroF1_compressed_28";
var orig_path = "vid/" + file_name + ".mp4"
var lang_path = "../lang/" + global.lang + "/chapter3/vid/" + file_name + ".mp4"
var path = orig_path

if (file_exists(lang_path) && global.translated_songs)
    path = lang_path
    
text_index = 0;
house_index = 2;
video_open(path);
video_enable_loop(false);

if (!global.is_console)
    video_set_volume(0.3);

videochromasampler = -4;
var _format = video_get_format();

if (_format == 1)
    videochromasampler = shader_get_sampler_index(shd_video_yuv, "v_chroma");

target_duration = 0;

if (scr_is_switch_os())
    target_duration = 1224;

video_position = 0;