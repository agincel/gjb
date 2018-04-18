/// @description Insert description here
// You can write your code in this editor

playerDeath = true;

alarm[0] = 2;
alarm[1] = 3;
alarm[2] = 30

with (obj_camera) {
	aberration = 2;
	chromatic_shake = 4;
}
with (obj_audio_manager) {
	death = true;	
}

state = 0;

distortionValue = 5;
distortionSurface = -1;