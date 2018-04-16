/// @description Insert description here
// You can write your code in this editor

var pointColor = c_dkgray;
if (instance_exists(obj_game_manager)) {
	if (obj_game_manager.lastCheckpoint == id) {
		pointColor = c_lime;
	} 
}

draw_sprite_ext(spr_save_front, 0, x, y - 20 - 4 * dsin(step),
				1 + (60 - timer)/20 * 0.25, 1 + (60 - timer)/20 * 0.25,
				image_angle, c_lime, 1 - (20 / timer));

draw_sprite_ext(spr_save_back, image_index, x, y - 20 - 4 * dsin(step),
				image_xscale, image_yscale,
				image_angle, pointColor, 1);
				
draw_sprite_ext(spr_save_front, 0, x, y - 20 - 4 * dsin(step),
				image_xscale, image_yscale,
				image_angle, c_white, 1);
				
draw_self();