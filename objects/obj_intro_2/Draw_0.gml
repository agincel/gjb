/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_black);

if (room == rmTutorial) {
	draw_set_alpha(drawAlpha1);
	draw_rectangle(camera_get_view_x(view_camera[0]),
				   camera_get_view_y(view_camera[0]),
				   camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
				   camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),
				   false);
	draw_set_alpha(1);
} else {
	draw_set_alpha(drawAlpha1);
	draw_rectangle(0, 0, 480, 270, false);
	draw_set_alpha(1);
}

if (room == rmTutorial) {
	
	gpu_set_fog(true, c_black, 0, 0);
	for (var i = 0; i < 4; i++) {
		draw_sprite_ext(spr_tehpilot_portrait, 0,
						camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) * 0.35
							+ lengthdir_x(1, i * 90),
						camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 3 / 10
							+ lengthdir_y(1, i * 90),
						0.75, 0.75, 0, c_white, drawAlpha2);
	}
	gpu_set_fog(false, c_black, 0, 0);
	draw_sprite_ext(spr_tehpilot_portrait, 0,
						camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) * 0.35,
						camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 3 / 10,
						0.75, 0.75, 0, c_white, drawAlpha2);
						
	gpu_set_fog(true, c_black, 0, 0);
	for (var i = 0; i < 4; i++) {					
		draw_sprite_ext(spr_waveparadigm_logo, 0,
						camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) * 0.75
							+ lengthdir_x(1, i * 90),
						camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])*3/5
							+ lengthdir_y(1, i * 90),
						0.25, 0.25, 0, c_white, drawAlpha2);
	}
	gpu_set_fog(false, c_black, 0, 0);
	draw_sprite_ext(spr_waveparadigm_logo, 0,
				camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) * 0.75,
				camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])*3/5,
				0.25, 0.25, 0, c_white, drawAlpha2);
} else {
	draw_sprite_ext(spr_tehpilot_portrait, 0, room_width * 0.35, room_height * 3/10, 0.75, 0.75, 0, c_white, 1);
	draw_sprite_ext(spr_waveparadigm_logo, 0, room_width * 0.75, room_height * 3/5, 0.25, 0.25, 0, c_white, 1);
}

draw_set_alpha(1);