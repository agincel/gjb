/// @description Insert description here
// You can write your code in this editor

if (!touched) {
	touched = true;
	with (instance_create_layer(x - 1, y - 1, layer_get_id("UpperEffect"), obj_projection_circle_fade)) {
		radiusDraw = 480 * 2;
	}
	alarm[1] = 120;
	
	switch (type) {
	
		case 0:
			obj_game_manager.maxJumps++;
			break;
			
		case 1:
			obj_game_manager.canProject = true;
			break;
			
		case 2:
			if (action_script != -1) {
				script_execute(action_script);
			}
			break;
	
	}
}