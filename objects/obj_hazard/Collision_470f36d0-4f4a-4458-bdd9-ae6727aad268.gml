/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_game_manager)) {
	var checkpoint = obj_game_manager.lastCheckpoint;
	if (checkpoint != noone) {
		other.x = checkpoint.x;
		other.y = checkpoint.y - 1; //todo, more detailed death stuff?
	} else {
		other.x = obj_game_manager.startX;
		other.y = obj_game_manager.startY;
	}
	other.xVelocity = 0;
	other.yVelocity = 0;
}