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
} else if (ID == 2) {
	with (instance_nearest(x, y, obj_guide_sparkle)) {
		instance_destroy();	
	}
	
	with (instance_create_layer(0, 0, layer_get_id("UpperEffect"), obj_helpful_tip)) {
		help_str = "Shake (<- ->)";
	}
} else if (ID == 3) {
	with (instance_create_layer(0, 0, layer_get_id("UpperEffect"), obj_helpful_tip)) {
		help_str = "Your soul can project into walls for more mobility";
	}
} else if (ID == 4) {
	with (instance_create_layer(0, 0, layer_get_id("UpperEffect"), obj_helpful_tip)) {
		help_str = "You can project from object to object with [RT]";
	}	
} else if (ID == 5) {
	with (instance_create_layer(0, 0, layer_get_id("UpperEffect"), obj_helpful_tip)) {
		help_str = "You can jump out of an object with (A)";
	}	
} else if (ID == 6) {
	instance_create_layer(0, 0, layer_get_id("CameraLayer"), obj_fade);	
} else if (ID == 7) {
	var f = instance_create_layer(0, 0, layer_get_id("CameraLayer"), obj_fade);
	f.restart = true;
}