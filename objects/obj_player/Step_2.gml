/// @description Insert description here
// You can write your code in this editor

if (aiming) {
	current_sprite = spr_player_jump;
	current_subimg = 1;
} else {
	
	if (!isGrounded) {

		current_sprite = spr_player_jump;
	
		if (yVelocity < -3) {
			current_subimg = 0;
		}
	
		else if (yVelocity < 0) {
			current_subimg = 1;
		}
	
		else if (yVelocity < 3) {
			current_subimg = 2;
		}
	
		else if (yVelocity < 5) {
			current_subimg = 3;
		}

		else if (yVelocity < 7) {
			current_subimg = 4;
		}
	
		else {
			current_subimg = 5;
		}

	} else {
		if (xAxis != 0) {
			current_sprite = spr_player_run;
			current_subimg = (current_subimg + 0.15) % 6;
		} else {
			current_sprite = spr_player_idle;
			current_subimg = (current_subimg + 0.05) % 6;
		}
	}
}

if (x > xprevious)
	xDir = 1;
else if (x < xprevious)
	xDir = -1;