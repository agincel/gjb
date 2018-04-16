/// @description Insert description here
// You can write your code in this editor

if (visible) {
	var rad = irandom(4) + 2;
	
	draw_set_color(c_purple);
	draw_circle(x, y, rad, false);
	
	draw_set_color(c_white);
	draw_circle(x, y, rad * 0.5, false);
}