if (os_type == os_android)
{
    if (type == 0)
    {
        timer++;
        var smokeamount = 0;
        
        if (i_ex(obj_mainchara))
        {
            var rw = room_width;
            var off = 400;
            
            if (room == room_dw_snow_zone)
            {
                rw = 7600;
                off = 3000;
            }
            
            smokeamount = (obj_mainchara.x - off) / rw;
            
            if (smokeamount < 0)
                smokeamount = 0;
            else if (smokeamount > 1)
                smokeamount = 1;
        }
        
        depth = 5000;
        
        if (smokeamount > 0.01)
        {
            var t = timer;
            draw_sprite_tiled_ext(spr_bg_fountain1, 0, t * 1.6, t * 1.8, 2, 2, c_dkgray, smokeamount);
            draw_sprite_tiled_ext(spr_bg_fountain1, 0, t * 1.1, t, 2, 2, c_black, smokeamount);
            draw_sprite_tiled_ext(spr_bg_fountain1, 0, t * 0.5, t * 0.6666667, 2, 2, c_black, smokeamount);
        }
    }
    
    if (type == 1 || type == 2)
    {
        if (init == 0)
        {
            init = 1;
            overlay = scr_marker(-10, -10, spr_whitepx_10);
            overlay.image_xscale = (room_width * 0.1) + 2;
            overlay.image_yscale = (room_height * 0.1) + 2;
            overlay.image_blend = merge_color(c_black, c_navy, 0.5);
            overlay.image_alpha = 0.6;
            overlay.depth = 1000;
            
            if (room == room_town_shelter)
            {
                var hscale = (room_height * 0.1) + 2;
                var left_cover = scr_marker(-10, -10, spr_whitepx_10);
                
                with (left_cover)
                {
                    image_blend = c_black;
                    image_yscale = hscale;
                    depth = 1100;
                }
                
                var right_cover = scr_marker(room_width, -10, spr_whitepx_10);
                
                with (right_cover)
                {
                    image_blend = c_black;
                    image_yscale = hscale;
                    depth = 1100;
                }
            }
        }
        
        depth = 400000;
        var ball_l = 153;
        var ball_r = 182;
        var ball_y = 150;
        
        if (type == 1)
        {
            draw_set_color(c_black);
            ossafe_fill_rectangle(153, 142, 182, 189, false);
        }
        else
        {
            ball_l = 125;
            ball_r = 200;
            ball_y = 1120;
        }
        
        if (++timer >= 2)
        {
            timer = 0;
            var bx = ball_l + random(ball_r - ball_l);
            var ball = scr_marker(bx, ball_y, spr_ball);
            ball.image_blend = c_black;
            scr_doom(ball, 60);
            var randomscale = 0.3 + random(0.5);
            scr_lerpvar_instance(ball, "image_xscale", 0, randomscale, 10, -1, "out");
            scr_lerpvar_instance(ball, "image_yscale", 0, randomscale, 10, -1, "out");
            scr_lerpvar_instance(ball, "image_alpha", 8, 0, 60);
            ball.image_xscale = 0;
            ball.image_yscale = 0;
            ball.depth = (type == 2) ? 5000 : 300000;
            ball.gravity = -0.2;
            ball.friction = 0.1;
            ball.hspeed = random(6) - 3;
        }
    }
}
else
{
    if (type == 0)
    {
        timer++;
        var smokeamount = 0;
        
        if (i_ex(obj_mainchara))
        {
            var _room_width = room_width;
            var _offset = 400;
            
            if (room == room_dw_snow_zone)
            {
                _room_width = 7600;
                _offset = 3000;
            }
            
            smokeamount = clamp((obj_mainchara.x - _offset) / _room_width, 0, 1);
        }
        
        depth = 5000;
        draw_sprite_tiled_ext(spr_bg_fountain1, 0, timer * 1.6, timer * 1.8, 2, 2, c_dkgray, smokeamount);
        draw_sprite_tiled_ext(spr_bg_fountain1, 0, timer * 1.1, timer, 2, 2, c_black, smokeamount);
        draw_sprite_tiled_ext(spr_bg_fountain1, 0, timer / 2, timer / 1.5, 2, 2, c_black, smokeamount);
    }

    if (type == 1 || type == 2)
    {
        if (init == 0)
        {
            init = 1;
            overlay = scr_marker(-10, -10, spr_whitepx_10);
            overlay.image_xscale = (room_width / 10) + 2;
            overlay.image_yscale = (room_height / 10) + 2;
            overlay.image_blend = merge_color(c_black, c_navy, 0.5);
            overlay.image_alpha = 0.6;
            overlay.depth = 1000;
            
            if (room == room_town_shelter)
            {
                var left_cover = scr_marker(-10, -10, spr_whitepx_10);
                
                with (left_cover)
                {
                    image_blend = c_black;
                    image_yscale = (room_height / 10) + 2;
                    depth = 1100;
                }
                
                var right_cover = scr_marker(room_width, -10, spr_whitepx_10);
                
                with (right_cover)
                {
                    image_blend = c_black;
                    image_yscale = (room_height / 10) + 2;
                    depth = 1100;
                }
            }
        }
        
        depth = 400000;
        var ballregionl = 153;
        var ballregionr = 182;
        var bally = 150;
        
        if (type == 1)
        {
            draw_set_color(c_black);
            ossafe_fill_rectangle(153, 142, 182, 189, false);
        }
        
        if (type == 2)
        {
            ballregionl = 125;
            ballregionr = 200;
            bally = 1120;
        }
        
        timer++;
        
        if (timer >= 2)
        {
            timer = 0;
            var ball = scr_marker(random_range(ballregionl, ballregionr), bally, spr_ball);
            ball.image_blend = c_black;
            scr_doom(ball, 60);
            var randomscale = 0.3 + random(0.5);
            scr_lerpvar_instance(ball, "image_xscale", 0, randomscale, 10, -1, "out");
            scr_lerpvar_instance(ball, "image_yscale", 0, randomscale, 10, -1, "out");
            scr_lerpvar_instance(ball, "image_alpha", 8, 0, 60);
            ball.image_xscale = 0;
            ball.image_yscale = 0;
            ball.depth = 300000;
            
            if (type == 2)
                ball.depth = 5000;
            
            ball.gravity = -0.2;
            ball.friction = 0.1;
            ball.hspeed = random_range(-3, 3);
        }
    }
}