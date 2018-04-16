/// @description Insert description here
// You can write your code in this editor


if (instance_exists(obj_game_manager)) {
	if (obj_game_manager.lastCheckpoint != id) {
		obj_game_manager.lastCheckpoint = id;
		timer = 60;
	}
}