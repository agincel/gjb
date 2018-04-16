/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_game_manager)) {
	if (obj_game_manager.lastCheckpoint == id) {
		image_alpha = 1;	
	} else {
		image_alpha = 0.5;	
	}
} else {
	image_alpha = 0.25;
}

draw_self();