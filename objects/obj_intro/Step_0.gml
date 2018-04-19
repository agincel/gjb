/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(obj_distortion_block)) {
	switch (current_message) {
		case 3:
			audio_sound_gain(snd_static, 0.05, 1000);
			break;
		case 4:
			audio_sound_gain(snd_static, 0.07, 1000);
			break;
		case 6:
			audio_sound_gain(snd_static, 0.09, 1000);
			break;
		default:
			audio_sound_gain(snd_static, 0, 1000);
			break;
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