gamepad_set_axis_deadzone(0, 0.15);

xAxis = gamepad_axis_value(0, gp_axislh);
yAxis = gamepad_axis_value(0, gp_axislv);
isGrounded = place_meeting(x, y + 1, obj_wall);
aiming = gamepad_button_check(0, gp_shoulderrb) && canAim;

if (instance_exists(obj_game_manager)) {
	aiming = aiming && obj_game_manager.canProject;	
}

pressedJump = gamepad_button_check_pressed(0, gp_face1);

if (gamepad_button_check_pressed(0, gp_face2)) {
	room_restart();	
}

if (!isGrounded) {
	//airborne
	if (jumps == maxJumps) {
		//they walked off a ledge, they should get one less jump
		jumps -= 1;
	}
	
	yVelocity += grav;
	if (yVelocity > maxYVelocity)
		yVelocity = maxYVelocity;
} else {
	jumps = maxJumps; //restore jumps and aim
	canAim = true;
	yVelocity = 0;
}

if (pressedJump && jumps > 0 && !aiming) { //pressed jump and can jump
	yVelocity = jumpStrength;
	jumps -= 1;
}

if (gamepad_button_check_released(0, gp_face1)) {
	if (yVelocity < 0) {
		yVelocity /= 2;
	}
}

deltaX = xAxis * movementSpeed;

if (!aiming && !wasAiming) {
	for (var i = 0; i < abs(deltaX + xVelocity); i++) {
		if (!place_meeting(x + sign(deltaX), y, obj_wall)) {
			x += sign(deltaX);
		} else {
			break;
		}
	}

	for (var i = 0; i < abs(yVelocity); i++) {
		if (!place_meeting(x, y + sign(yVelocity), obj_wall)) {
			y += sign(yVelocity);	
		} else {
			if (yVelocity < 0) {
				//yVelocity = floor(yVelocity / 2);	
				yVelocity = 0;
			}
			break;
		}
	}
} else if (!aiming && wasAiming && canAim)  { //released aim this frame
	//destroy self, send out an obj_soul
	var soul = instance_create_depth(x, y, 0, obj_soul); //soul is same dimensions as player, with same centering, to prevent clipping
	soul.dir = point_direction(x, y, x + xAxis, y + yAxis);
	canAim = false;
	instance_destroy(); //destroy self
}

wasAiming = aiming;
