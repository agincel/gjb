/// @description Insert description here
// You can write your code in this editor

draw_set_circle_precision(64);
gpu_set_blendmode_ext(bm_inv_dest_color, bm_zero);
draw_set_color(c_white);
draw_set_alpha(1);
draw_circle(x, y, radiusDraw, false);
	
draw_set_color(c_black);
gpu_set_blendmode(bm_add);
draw_circle(x, y, radiusDraw, false);
gpu_set_blendmode(bm_normal);