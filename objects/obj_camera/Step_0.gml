/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player)) {
	camera_set_view_pos(my_camera,
						480 * floor(obj_player.x / 480),
						256 * floor(obj_player.y / 256));
	if (gamepad_button_check_pressed(0, gp_start)) {
		inMenu = !inMenu;
	}
} else if (instance_exists(obj_possessible)) {
	//check to see if an object is possessed
	var possessed = noone;
	with (obj_possessible) {
		if (isPossessed) {
			possessed = id;	
		}
	}
	
	if (possessed != noone) {
			camera_set_view_pos(my_camera,
						480 * floor(possessed.x / 480),
						256 * floor(possessed.y / 256));
	}
}

if (aberration > 0) {
	aberration -= 0.02;
}

if (chromatic_shake > 0) {
	chromatic_shake -= 0.04;
}

if (!surface_exists(minimap_surface)) {
	minimap_surface = surface_create(384, 216);
}

if (instance_exists(obj_player)) {
	var player_quadrant_i = floor(obj_player.x / 480);
	var player_quadrant_j = floor(obj_player.y / 256);

	if (!visited[player_quadrant_i, player_quadrant_j]) {
		visited[player_quadrant_i, player_quadrant_j] = true;
	}
}