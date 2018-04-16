/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_black);
draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
gpu_set_blendmode(bm_add);
gpu_set_blendmode_ext(bm_one, bm_inv_src_color);

draw_surface_ext(application_surface,
					(-1 * (aberration * 2)) * random_range(-chromatic_shake, chromatic_shake),
					0, 1, 1, 0, c_red, 0.1);
draw_surface_ext(application_surface,
					0, (-1 * (aberration * 2)) * random_range(-chromatic_shake, chromatic_shake),
					1, 1, 0, c_lime, 0.1);
draw_surface_ext(application_surface,
					(1 * (aberration * 2)) * random_range(-chromatic_shake, chromatic_shake),
					0, 1, 1, 0, c_blue, 0.1);
					
gpu_set_blendmode(bm_normal);