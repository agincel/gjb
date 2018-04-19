/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player)) {
	if ((480 * floor(obj_player.x / 480) == (480 * floor(x / 480)))
		&& (256 * floor(obj_player.y / 256) == (256 * floor(y / 256)))) {
		
		eyeHeight += (eyeHeightMax - eyeHeight) / 8;
		
	}
	else {
		eyeHeight += (0 - eyeHeight) / 8;
	}
}