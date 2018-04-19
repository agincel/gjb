/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_circle(x - 1, y - 1, 12, false);

if (instance_exists(obj_player)) {
	
	var playerDir = point_direction(x, y, obj_player.x, obj_player.y);
	
	draw_set_color(c_purple);
	draw_ellipse(x - 1 + lengthdir_x(8, playerDir) - 4,
				 y - 1 + lengthdir_y(8, playerDir) - (eyeHeight),
				 x - 1 + lengthdir_x(8, playerDir) + 4,
				 y - 1 + lengthdir_y(8, playerDir) + (eyeHeight),
				 false);
}