/// @description Insert description here
// You can write your code in this editor

if (drawAlpha1 < 1) {
	drawAlpha1 -= 0.02;
}

if (drawAlpha2 < 1) {
	drawAlpha2 -= 0.02;
	if (drawAlpha2 <= 0) {
		instance_destroy();
	}
}