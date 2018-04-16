/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_camera)) {
	if (surface_exists(p_surface)) {
		surface_set_target(p_surface);
		
			//Clear surface
			draw_set_alpha(0);
			draw_clear(c_black);
			draw_set_alpha(1);
			
			//Draw particles to it
			part_system_drawit(p_system);
			
		surface_reset_target();
		
		draw_surface(p_surface,
						camera_get_view_x(obj_camera.my_camera),
						camera_get_view_y(obj_camera.my_camera));
	}
}