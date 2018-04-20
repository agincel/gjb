/// @description Insert description here
// You can write your code in this editor

if (state == 0) {
	if (playerDeath) {
		if (instance_exists(obj_game_manager)) {
			
			var respawnedPlayer = instance_create_layer(0, 0, layer_get_id("PlayerLayer"), obj_player);
			
			var checkpoint = obj_game_manager.lastCheckpoint;
			if (checkpoint != noone) {
				respawnedPlayer.x = checkpoint.x;
				respawnedPlayer.y = checkpoint.y - 1; //todo, more detailed death stuff?
			} else {
				respawnedPlayer.x = obj_game_manager.startX;
				respawnedPlayer.y = obj_game_manager.startY;
			}
			respawnedPlayer.xVelocity = 0;
			respawnedPlayer.yVelocity = 0;
		}
	} else if (room == rmIntro1) {
		room_goto_next();
	}
	alarm[2] = 30 + (90 * (room == rmIntro1));
	state += 1;
} else {
	instance_destroy();
}