/// @description Insert description here
// You can write your code in this editor

var magnitude = 12;

var new_randX = x + irandom_range(-magnitude, magnitude) - 1;
var new_randY = y + irandom_range(-magnitude, magnitude) - 1;

var newLayer = layer_get_id("UpperEffect");

with (instance_create_layer(x - 1, y - 1, newLayer, obj_bolt_line)) {
	x = other.last_randX;
	y = other.last_randY;
    
	draw_x = new_randX;
	draw_y = new_randY;
	
	size = 1;
	life = 120;
}

last_randX = new_randX;
last_randY = new_randY;

alarm[0] = 15;