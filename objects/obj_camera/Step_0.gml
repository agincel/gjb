/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player)) {
	camera_set_view_pos(my_camera,
						480 * floor(obj_player.x / 480),
						256 * floor(obj_player.y / 256));
}

if (aberration > 0) {
	aberration -= 0.02;
}

if (chromatic_shake > 0) {
	chromatic_shake -= 0.04;
}