/// @description Insert description here
// You can write your code in this editor
var xx = camera_get_view_x(view_camera[0]) + 240;
var yy = camera_get_view_y(view_camera[0]);

if (fadingOut) {
	fade += 1;
	if (fade >= fadeTotal * 1.25) {
		//room_goto_next();	
		if (restart)
			game_restart();
		else
			room_goto_next();
	}
} else {
	fade -= 1;
	if (fade <= 0) {
		instance_destroy();	
	}
}


draw_sprite_ext(sprite_index, 0, xx, yy, 1, 1, 0, c_white, fade / fadeTotal);