/// @description Insert description here
// You can write your code in this editor

if (timer > 0) {
	timer--;
	if (!(timer % 2)) {
		instance_create_layer(x + irandom_range(-12, 12), y - 20 - 4 * dsin(step) + irandom_range(-12, 12),
							  layer, obj_sparkle_mini);
	}
}

step = (step + 2) % 360;

crystal_subimg = (crystal_subimg + 0.25) % 6;