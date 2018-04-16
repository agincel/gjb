/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var x_offset = 0;
var y_offset = 0;

draw_set_color(c_purple);
if (isShaking) {
	x_offset = irandom_range(-1 * shakeIntensity, shakeIntensity);
	y_offset = irandom_range(-1 * shakeIntensity, shakeIntensity);
}

draw_sprite(sprite_index, image_index, x + x_offset, y + y_offset);