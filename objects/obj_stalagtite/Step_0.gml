/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_index = isPossessed;

if (isPossessed) {
	var xAxis = axisLH();

	if (xAxis <= -0.9 && !didLeft && counter > 0) {
		didLeft = true;
		didRight = false;
		counter -= 1;
		isShaking = shakeTime;
		shakeIntensity += shakeIntensityDelta;
	}

	if (xAxis >= 0.9 && !didRight && counter > 0) {
		didRight = true;
		didLeft = false;
	
		counter -= 1;
		isShaking = shakeTime;
		shakeIntensity += shakeIntensityDelta;
	}

	if (isShaking > 0) {
		isShaking -= 1;	
	}

	if (counter <= 0 && !done) { //become affected by gravity
		yVelocity += grav;
		if (yVelocity > maxYVelocity) {
			yVelcoity = maxYVelocity;	
		}
	
		y += yVelocity; //todo
	}

} else {
	isShaking = 0;	
}