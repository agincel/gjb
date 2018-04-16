/// @description Insert description here
// You can write your code in this editor


for (var i = 0; i < spd; i++) {
	var collisionWall = instance_place(x + lengthdir_x(1, dir), y + lengthdir_y(1, dir), obj_wall);
	var collisionPoint = instance_place(x + lengthdir_x(1, dir), y + lengthdir_y(1, dir), obj_possessible);	
	
	if (!collisionWall && !(collisionPoint && collisionPoint != startPoint)) {
		x += lengthdir_x(1, dir);
		y += lengthdir_y(1, dir);
	} else if (collisionWall) {
		//gonna hit a wall, destroy self and put a player there
		show_debug_message(collisionWall);
		var p = instance_create_layer(x, y, layer, obj_player);
		p.yVelocity = p.jumpStrength;
		instance_destroy();
		dst_current = 0;
		break;
	} else if (collisionPoint && collisionPoint != startPoint) {
		//possess point
		collisionPoint.isPossessed = true;
		instance_destroy();
		dst_current = 0;
		break;
	}
	dst_current += 1;
}

if (dst_current > dst) { //we went farther than we were supposed to, just create a player back where we started
	if (startPoint != noone) {
		startPoint.isPossessed = true;
		instance_destroy();
	} else {
		instance_create_layer(startX, startY, layer, obj_player);
		instance_destroy();	
	}
}