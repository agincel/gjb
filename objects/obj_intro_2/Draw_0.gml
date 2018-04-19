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
	draw_sprite_ext(spr_tehpilot_portrait, 0,
					camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/4,
					camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2,
					1, 1, 0, c_white, drawAlpha2);
	draw_sprite_ext(spr_tehpilot_name, 0,
					camera_get_view_x(view_camera[0]) + 2.5 * camera_get_view_width(view_camera[0])/4,
					camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2,
					1, 1, 0, c_white, drawAlpha2);
} else {
	draw_sprite(spr_tehpilot_portrait, 0, room_width/4, room_height/2);
	draw_sprite(spr_tehpilot_name, 0, room_width/4 * 2.5, room_height/2);
}

draw_set_alpha(1);