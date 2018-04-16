/// @description Insert description here
// You can write your code in this editor


if (isPossessed) {
	xAxis = gamepad_axis_value(0, gp_axislh);
	yAxis = gamepad_axis_value(0, gp_axislv);

	aiming = gamepad_button_check(0, gp_shoulderrb) && canAim;
	pressedJump = gamepad_button_check_pressed(0, gp_face1) && canJump;

	if (!aiming && wasAiming) {
		//released aiming
		var soul = instance_create_depth(x, y + sprite_get_height(spr_soul_temp) / 2, 0, obj_soul);
		soul.dir = point_direction(0, 0, xAxis, yAxis);
		soul.dst = range;
		soul.startPoint = id;
		isPossessed = false;
	}
	
	if (pressedJump && canJump) {
		isPossessed = false;
		var p = instance_create_depth(x, y, 0, obj_player);
		p.yVelocity = p.jumpStrength;
	}

	wasAiming = aiming;

} else {
	aiming = false;
	wasAiming = false;
}