/// @description Insert description here
// You can write your code in this editor

if (aiming && isPossessed) {
	var dir = point_direction(x, y, x + xAxis, y + yAxis);	
	draw_line(x, y, x + lengthdir_x(range, dir), y + lengthdir_y(range, dir));
}

if (isPossessed) {
	image_blend = c_blue;	
} else {
	image_blend = c_white;	
}