/// @description Insert description here
// You can write your code in this editor

if (wasAiming) {
	
	var newRadius = radiusDraw;
	with (instance_create_layer(x, y, layer, obj_projection_circle_fade)) {
		radiusDraw = newRadius;
	}
	
}