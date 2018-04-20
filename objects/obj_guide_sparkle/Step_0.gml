/// @description Insert description here
// You can write your code in this editor
life += 1;

if (life % 3 == 0) {
	var s = instance_create_layer(x + irandom_range(-12, 12), y - irandom_range(-12, 12),
							  layer, obj_sparkle_mini);
	s.image_blend = color;
}