/// @description Insert description here
// You can write your code in this editor

draw_self();

if (aiming) {
	var cY = y - sprite_get_height(sprite_index) / 2;
	var dir = point_direction(x, cY, x + xAxis, cY + yAxis);	
	draw_line(x, cY, x + lengthdir_x(range, dir), cY + lengthdir_y(range, dir));
}