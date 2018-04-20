/// @description Insert description here
// You can write your code in this editor

if (alarm[0] == -1 && drawAlpha < 1) {
	drawAlpha += 0.02;
	if (drawAlpha >= 1) {
		alarm[0] = 180;
	}
} else if (dir == -1) {
	drawAlpha -= 0.02;
	if (drawAlpha <= 0) {
		instance_destroy();
	}
}