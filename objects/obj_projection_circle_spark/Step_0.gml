/// @description Insert description here
// You can write your code in this editor
var magnitude = 6;

var new_randX = x + irandom_range(-magnitude, magnitude) - 1;
var new_randY = y + irandom_range(-magnitude, magnitude) - 1;

var newLayer = layer_get_id("Effect");
/*
if (last_layer == -1)
	newLayer = layer_get_id("UpperEffect");
*/

if (instance_exists(originator)) {
	step += 2;
	
	x = originator.x
		+ lengthdir_x(originator.radiusDraw, step);
	y = originator.y
		+ lengthdir_y(originator.radiusDraw, step);
	
	if (instance_exists(obj_player)) {
		var playerId = obj_player.id;
		if (instance_exists(playerId) && originator == playerId) {
			y -= sprite_get_height(obj_player.sprite_index) / 2;
		}
	}
		
	last_playerX = originator.x;
	last_playerY = originator.y;

	visible = (originator.aiming);
	
	if (visible) {
		with (instance_create_layer(x - 1, y - 1, newLayer, obj_bolt_line)) {
		    x = other.last_randX;
		    y = other.last_randY;
    
		    draw_x = new_randX;
		    draw_y = new_randY;
    
		    depth = other.last_layer;
	
			origin_id = other.id;
		}
	}

} else {

	with (instance_create_layer(x - 1, y - 1, newLayer, obj_bolt_line)) {
	    x = other.last_randX;
	    y = other.last_randY;
    
	    draw_x = other.last_playerX;
	    draw_y = other.last_playerY;
    
	    depth = other.last_layer;
	
		origin_id = other.id;
	}
	
	instance_destroy();
}

last_layer *= -1;

last_randX = new_randX;
last_randY = new_randY;