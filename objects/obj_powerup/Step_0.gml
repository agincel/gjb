/// @description Insert description here
// You can write your code in this editor

if (!touched) {
	height_step = (height_step + 2) % 360;

	y = ystart + 4 * dsin(height_step);
}

if (alarm[1] < 15 && alarm[1] > 0) {
	touchFlash = !touchFlash;
	/*
	with (obj_player) {
		x += (other.x - x) / 10;
		y += ((other.y + 12) - y) / 10;
		y -= yVelocity;
		xAxis = 0;
		xDelta = 0;
		yAxis = 0;
	}
	*/
}