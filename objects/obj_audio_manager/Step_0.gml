/// @description Insert description here
// You can write your code in this editor
if (startedAiming) {
	aiming = true;
	startedAiming = false;
	soulStart = audio_play_sound(snd_soul_aim_start, 0, false);
}

if (aiming) {
	if (!audio_is_playing(soulStart) && !audio_is_playing(soulLoop)) {
		soulLoop = audio_play_sound(snd_soul_aim_loop, 0, true);	
	}
}

if (stoppedAiming) {
	audio_stop_sound(soulStart);
	audio_stop_sound(soulLoop);
	aiming = false;
	stoppedAiming = false;
}

if (startedAimingPossessed) {
	aimingPossessed = true;
	startedAimingPossessed = false;
	soulStartPossessed = audio_play_sound(snd_soul_aim_start_possessed, 0, false);
}

if (aimingPossessed) {
	if (!audio_is_playing(soulStartPossessed) && !audio_is_playing(soulLoopPossessed)) {
		soulLoopPossessed = audio_play_sound(snd_soul_aim_loop_possessed, 0, true);	
	}
}

if (stoppedAimingPossessed) {
	audio_stop_sound(soulStartPossessed);
	audio_stop_sound(soulLoopPossessed);
	aimingPossessed = false;
	stoppedAimingPossessed = false;
}

if (impactWall) {
	impactWall = false;
	audio_play_sound(snd_soul_impact3, 0, false);
}

if (impactPossessible) {
	impactPossessible = false;
	audio_play_sound(snd_soul_impact1, 0, false);
}

if (impactNothing) {
	impactNothing = false;
	audio_play_sound(snd_soul_impact4, 0, false);
}

if (death) {
	death = false;
	audio_play_sound(snd_soul_impact2, 0, false);
}