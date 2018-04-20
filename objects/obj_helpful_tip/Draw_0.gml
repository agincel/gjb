/// @description Insert description here
// You can write your code in this editor

var xx = camera_get_view_x(view_camera[0]) + 240;
var yy = camera_get_view_y(view_camera[0]);

draw_set_alpha(draw_alpha);
draw_set_color(c_black);
draw_rectangle(xx - 192, yy + 204, xx + 192, yy + 236, false);
gpu_set_blendmode(bm_add);
gpu_set_blendmode_ext(bm_one, bm_inv_src_color);

draw_set_color(c_red);
draw_rectangle(xx - 192 + random_range(-shake, shake),
			   yy + 204 + random_range(-shake, shake),
			   xx + 192 + random_range(-shake, shake),
			   yy + 236 + random_range(-shake, shake), true);
			   
draw_set_color(c_blue);
draw_rectangle(xx - 192 + random_range(-shake, shake),
			   yy + 204 + random_range(-shake, shake),
			   xx + 192 + random_range(-shake, shake),
			   yy + 236 + random_range(-shake, shake), true);
			   
draw_set_color(c_lime);
draw_rectangle(xx - 192 + random_range(-shake, shake),
			   yy + 204 + random_range(-shake, shake),
			   xx + 192 + random_range(-shake, shake),
			   yy + 236 + random_range(-shake, shake), true);
gpu_set_blendmode(bm_normal);
			   
draw_set_font(fnt_credits_small);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(xx, yy + 221, help_str);
					
draw_set_alpha(1);