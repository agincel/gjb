/// @description Insert description here
// You can write your code in this editor

var newSound = choose(snd_glitch1,
						snd_glitch2,
						snd_glitch3,
						snd_glitch4,
						snd_glitch5,
						snd_glitch6,
						snd_glitch7,
						snd_glitch8);

audio_play_sound(newSound, 1, false);
audio_sound_gain(newSound, 0.35, false);

with (obj_camera) {
	aberration = 1;
	chromatic_shake = 1;
}

alarm[0] = 60 * irandom_range(6, 14);