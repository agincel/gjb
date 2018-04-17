/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

myRail = instance_nearest(x, y, obj_rail);
if (myRail == noone) {
	show_debug_message("no rail for crane, destroying");
	instance_destroy();
}

movementSpeed = 1.5;