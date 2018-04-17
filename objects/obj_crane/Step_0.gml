/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (isPossessed && !aiming) {
	var xAxis = axisLH() * movementSpeed;
	
	for (var i = 0; i < abs(xAxis); i+=0.5) {
		if (xAxis < 0) {
			if (x - sprite_get_width(sprite_index) / 2 - 0.5 > myRail.bbox_left) {
				x -= 0.5;	
			}
		} else if (xAxis > 0) {
			if (x + sprite_get_width(sprite_index) / 2 + 0.5 < myRail.bbox_right) {
				x += 0.5;	
			}
		}
	}
} 