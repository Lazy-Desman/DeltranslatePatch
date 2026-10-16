if (!global.is_console && !(window_get_fullscreen() && borders_added()))
    exit;

if (!_video_enabled)
    exit;

var _video_data = video_draw();
var _video_status = _video_data[0];
var ww = window_get_width();
var wh = window_get_height();
draw_set_alpha(1);
draw_set_color(c_black);
ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
draw_set_color(c_white);

if (_video_status == 0)
{
    texture_set_interpolation(true);
    _vid_surface = _video_data[1];

    if (surface_exists(_vid_surface))
    {
        var _vw = surface_get_width(_vid_surface);
        var _vh = surface_get_height(_vid_surface);
        var _scale = min(ww / _vw, wh / _vh);
        var _dw = floor(_vw * _scale);
        var _dh = floor(_vh * _scale);
        var _dx = floor((ww - _dw) / 2);
        var _dy = floor((wh - _dh) / 2);

        switch (video_get_format())
        {
            case 0:
                draw_surface_stretched(_vid_surface, _dx, _dy, _dw, _dh);
                break;

            case 1:
                _chroma_surface = _video_data[2];

                if (surface_exists(_chroma_surface))
                {
                    shader_replace_simple_set_hook(63);
                    var _tex_id = surface_get_texture(_vid_surface);
                    var _chroma_tex_id = surface_get_texture(_chroma_surface);
                    texture_set_stage(videochromasampler, _chroma_tex_id);
                    gpu_set_texfilter(false);
                    draw_primitive_begin_texture(pr_trianglestrip, _tex_id);
                    draw_vertex_texture(_dx, _dy, 0, 0);
                    draw_vertex_texture(_dx + _dw, _dy, 1, 0);
                    draw_vertex_texture(_dx, _dy + _dh, 0, 1);
                    draw_vertex_texture(_dx + _dw, _dy + _dh, 1, 1);
                    draw_primitive_end();
                    gpu_set_texfilter(true);
                    shader_replace_simple_reset_hook();
                }

                break;
        }
    }

    texture_set_interpolation(false);
}

draw_set_color(c_black);
draw_set_alpha(_overlay_alpha);
ossafe_fill_rectangle(0, 0, ww - 1, wh - 1);
draw_set_alpha(1);
draw_set_color(c_white);
