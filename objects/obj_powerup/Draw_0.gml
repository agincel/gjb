/// @description Insert description here
// You can write your code in this editor

if (!touched || alarm[1] == -1) {
	draw_set_color(c_black);
	draw_rectangle(480 * floor(x / 480), 256 * floor(y / 256),
				   480 * ceil(x / 480), 256 * ceil(y / 256), false);
	draw_self();
} else if (!touchFlash) {
	draw_self();
}