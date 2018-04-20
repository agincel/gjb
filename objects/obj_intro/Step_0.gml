/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(obj_distortion_block)) {
	if (current_message == 3 || current_message == 4 || current_message == 6) {
		if (glitchSound == -1 || !audio_is_playing(glitchSound)) {
			glitchSound = choose(snd_glitch1, snd_glitch2, snd_glitch3, snd_glitch4, snd_glitch5, snd_glitch6, snd_glitch7, snd_glitch8);
			audio_play_sound(glitchSound, 1, false);
		}
	}
	if (pointer == string_length(message[current_message])) {
		if (pressJump()) {
			if (current_message < 6) {
				pointer = 0;
				current_message++;
				alarm[0] = 1;
			} else {
				with (instance_create_depth(x, y, -200, obj_distortion_block)) {
					playerDeath = false;
				}
				audio_sound_gain(snd_static, 0.65, 1500);
			}
		}
	} else {
		if (pressJump()) {
			pointer = string_length(message[current_message]);
		}
	}
}