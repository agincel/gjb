/// @description Insert description here
// You can write your code in this editor

if (surface_exists(application_surface)) {
	var tempSurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
	surface_copy(tempSurface, 0, 0, application_surface);

	if (!surface_exists(distortionSurface)) {
	    distortionSurface = surface_create(camera_get_view_width(view_camera[0]),
										   camera_get_view_height(view_camera[0]));
		show_debug_message(surface_get_width(distortionSurface));
	    surface_set_target(distortionSurface);
	        draw_clear_alpha(c_white, 0);
	        repeat (distortionValue) {
				
				if (irandom(7) != 0) {
					var rect_x = 32 * irandom(15);
					var rect_y = 18 * irandom(15);
					
					var surface_x = 64 * irandom(15);
					var surface_y = 36 * irandom(15);
				
					draw_set_color(c_black);
		            draw_rectangle(rect_x, rect_y,
								   rect_x + 32, rect_y + 18,
								   false);
										  
					gpu_set_blendmode_ext(bm_one, bm_inv_src_color);
					
					draw_surface_part_ext(tempSurface,
		                                  surface_x, surface_y, 64, 36,
										  rect_x + irandom_range(-2, 2),
										  rect_y + irandom_range(-2, 2),
		                                  1/2, 1/2, c_red, 1);
					
					draw_surface_part_ext(tempSurface,
		                                  surface_x, surface_y, 64, 36,
										  rect_x + irandom_range(-2, 2),
										  rect_y + irandom_range(-2, 2),
		                                  1/2, 1/2, c_lime, 1);
										  
					draw_surface_part_ext(tempSurface,
		                                  surface_x, surface_y, 64, 36,
										  rect_x + irandom_range(-2, 2),
										  rect_y + irandom_range(-2, 2),
		                                  1/2, 1/2, c_blue, 1);
										  
					gpu_set_blendmode(bm_normal);
										  
					
				} else {
					draw_set_color(c_black);
					var rect_x = 32 * irandom(15);
					var rect_y = 18 * irandom(15);
					draw_rectangle(rect_x, rect_y,
								   rect_x + 32, rect_y + 18,
								   false);
					gpu_set_blendmode_ext(bm_one, bm_inv_src_color);
					
					draw_set_color(c_red);
					draw_rectangle(rect_x + irandom_range(-2, 2), rect_y + irandom_range(-2, 2),
								   rect_x + 32 + irandom_range(-2, 2), rect_y + 18 + irandom_range(-2, 2),
								   false);
								   
					draw_set_color(c_blue);
					draw_rectangle(rect_x + irandom_range(-2, 2), rect_y + irandom_range(-2, 2),
								   rect_x + 32 + irandom_range(-2, 2), rect_y + 18 + irandom_range(-2, 2),
								   false);
								   
					draw_set_color(c_lime);
					draw_rectangle(rect_x + irandom_range(-2, 2), rect_y + irandom_range(-2, 2),
								   rect_x + 32 + irandom_range(-2, 2), rect_y + 18 + irandom_range(-2, 2),
								   false);
								   
					gpu_set_blendmode(bm_normal);
									
				}
	        }
	    surface_reset_target();
	    draw_surface(distortionSurface, camera_get_view_x(view_camera[0]),
										camera_get_view_y(view_camera[0]));
	} else {
	    draw_surface(distortionSurface, camera_get_view_x(view_camera[0]),
										camera_get_view_y(view_camera[0]));
	}
    
	//show_debug_message("view x: " + string(camera_get_view_x(view_camera[0])) + " view y: " + string(camera_get_view_y(view_camera[0])));
	surface_free(tempSurface);
} else {
	show_debug_message("AAAAAAAAAAAAAA");
}