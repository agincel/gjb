/// @description Insert description here
// You can write your code in this editor


if (ID == 0) {
	//debug give me possess
	with (obj_game_manager) {
		canProject = true;
	}
} else if (ID == 1) {
	with (instance_create_layer(0, 0, layer_get_id("CameraLayer"), obj_credit)) {
		bigText = "kai theobald-coates";
		smallText = "music and sound by";
	}
}