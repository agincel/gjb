gamepad_set_axis_deadzone(0, 0.15);

xAxis = axisLH();
yAxis = axisLV();
isGrounded = place_meeting(x, y + 1, obj_wall);
aiming = pressingAim() && canAim;

//if (xAxis != 0) //wasn't able to aim pure horizontal or vertical which felt bad, doesn't seem to break anything
	xAimAxis = xAxis;
//if (yAxis != 0)
	yAimAxis = yAxis;

if (instance_exists(obj_game_manager)) {
	maxJumps = obj_game_manager.maxJumps;
	aiming = aiming && obj_game_manager.canProject;	
}

pressedJump = pressJump();

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

//audio stuff
if (aiming && !wasAiming) {
	with (obj_audio_manager) {
		startedAiming = true;	
	}
}

if (!aiming && wasAiming) {
	with (obj_audio_manager) {
		stoppedAiming = true;	
	}
}



if (!aiming && !wasAiming) {
	for (var i = 0; i < abs(deltaX + xVelocity); i++) {
		if (!place_meeting(x + sign(deltaX), y, obj_wall)) {
			x += sign(deltaX);
		} else {
			break;
		}
	}

	for (var i = 0; i < abs(floor(yVelocity)); i++) {
		if (!place_meeting(x, y + sign(yVelocity), obj_wall)) {
			y += sign(yVelocity);	
		} else {
			if (yVelocity < 0) {
				yVelocity = 0;
			}
			break;
		}
	}
} else if (!aiming && wasAiming && canAim && radiusDraw > (range * percentNeeded))  { //released aim this frame
	
	canAim = false;
	
	var cX = x;
	var cY = y - sprite_get_height(sprite_index) / 2;
	var xx = cX;
	var yy = cY;
	var dir = point_direction(cX, cY, cX + xAimAxis, cY + yAimAxis);
	
	var i = 0;
	while (i < range && !collision_line(cX, cY, xx, yy, obj_wall, true, true)
					 && !collision_line(cX, cY, xx, yy, obj_possessible, true, true)) {
		/*/*/
		xx += lengthdir_x(1, dir);
		yy += lengthdir_y(1, dir);
		i++;
	}
	
	var possessibleObjectInLine = collision_line(cX, cY, xx, yy, obj_possessible, true, true);
	if (possessibleObjectInLine) {
		with (possessibleObjectInLine) {
			isPossessed = true;
		}
		with (obj_camera) {
			aberration = 1;
			chromatic_shake = 2;
		}
		with (obj_audio_manager) {
			impactPossessible = true;	
		}
		
		var boltDir = point_direction(cX, cY, xx, yy);
		var boltDist = point_distance(cX, cY, xx, yy);
		var distCovered = 0;
		
		var last_xx = cX;
		var last_yy = cY;
		
		show_debug_message(boltDist);
		while (distCovered < boltDist) {
			distCovered += 8;
			with (instance_create_layer(last_xx,
										last_yy,
										"UpperEffect",
										obj_bolt_line)) {
				/*/*/
				draw_x = cX + lengthdir_x(distCovered, boltDir) + irandom_range(-8, 8);
				draw_y = cY + lengthdir_y(distCovered, boltDir) + irandom_range(-8, 8);
				
				last_xx = draw_x;
				last_yy = draw_y;
			}
		}
		instance_destroy(); //destroy self
	}
	else if (collision_line(cX, cY, xx, yy, obj_wall, true, true)) {
		with (obj_camera) {
			aberration = 1;
			chromatic_shake = 2;
		}
		with (obj_audio_manager) {
			impactWall = true;	
		}
		move_contact_solid(dir, range);
		yVelocity = jumpStrength;
		jumps = 1;
		
		var boltDir = point_direction(cX, cY, xx, yy);
		var boltDist = point_distance(cX, cY, xx, yy);
		var distCovered = 0;
		
		var last_xx = cX;
		var last_yy = cY;
		
		while (distCovered < boltDist) {
			distCovered += 8;
			with (instance_create_layer(last_xx,
										last_yy,
										"UpperEffect",
										obj_bolt_line)) {
				/*/*/
				draw_x = cX + lengthdir_x(distCovered, boltDir) + irandom_range(-8, 8);
				draw_y = cY + lengthdir_y(distCovered, boltDir) + irandom_range(-8, 8);
				
				last_xx = draw_x;
				last_yy = draw_y;
			}
		}
		
	} else {
		with (obj_audio_manager) {
			impactNothing = true;	
		}
	}
}

wasAiming = aiming;

//visual stuff

line_step = (line_step + 0.5) % (line_len * 2);

if (aiming) {
	radiusDraw += (range - radiusDraw) / 12.5;
} else {
	radiusDraw += (0 - radiusDraw) / 12.5;
}

y = floor(y);