/// @description Insert description here
// You can write your code in this editor

if (alarm[0] <= 0 && draw_alpha < 1) {
	draw_alpha -= 0.02;
	if (draw_alpha <= 0) {
		instance_destroy();
	}
} else {
	if (draw_alpha < 1) {
		draw_alpha += 0.02;
	}
}

if (shake > 0) {
	shake -= 0.02;
}