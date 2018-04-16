/// @description Insert description here
// You can write your code in this editor


if (isPossessed) {
	xAxis = gamepad_axis_value(0, gp_axislh);
	yAxis = gamepad_axis_value(0, gp_axislv);
	
	if (xAxis != 0)
		xAimAxis = xAxis;
	if (yAxis != 0)
		yAimAxis = yAxis;

	aiming = gamepad_button_check(0, gp_shoulderrb) && canAim;
	pressedJump = gamepad_button_check_pressed(0, gp_face1) && canJump;
	
	var cX = x;
	var cY = y;
	var xx = cX;
	var yy = cY;
	var dir = point_direction(cX, cY, cX + xAimAxis, cY + yAimAxis);
	
	if (!aiming && wasAiming) {
		
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
			isPossessed = false;
			
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
		}
		else if (collision_line(cX, cY, xx, yy, obj_wall, true, true)) {
			with (obj_camera) {
				aberration = 1;
				chromatic_shake = 2;
			}
			
			var p = instance_create_depth(x, y, 0, obj_player);
			with (p) {
				move_contact_solid(dir, range);
				yVelocity = jumpStrength;
			}
			isPossessed = false;
			
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
			
		}
	}
	
	if (pressedJump && canJump) {
		isPossessed = false;
		var p = instance_create_depth(x, y, 0, obj_player);
		p.yVelocity = p.jumpStrength;
		
		with (obj_camera) {
			aberration = 1;
			chromatic_shake = 2;
		}
	}

	wasAiming = aiming;

} else {
	aiming = false;
	wasAiming = false;
}

//draw stuff
line_step = (line_step + 0.5) % (line_len * 2);

if (aiming) {
	radiusDraw += (range - radiusDraw) / 12.5;
} else {
	radiusDraw += (0 - radiusDraw) / 12.5;
}