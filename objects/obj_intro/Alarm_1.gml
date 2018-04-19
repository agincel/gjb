/// @description Insert description here
// You can write your code in this editor

if (distortionFrame) {
	if (pointer == string_length(message[current_message])) {
		if (current_message == 3 || current_message == 4 || current_message == 6) {
			for (var i = 0; i < 6; i++) {
				distortion[i] = irandom_range(-current_message/4, current_message/4);
			}
		}
	} else {
		for (var i = 0; i < 6; i++) {
			distortion[i] = 0;
		}
	}
	distortionFrame = false;
	alarm[1] = 1;
} else {
	for (var i = 0; i < 6; i++) {
		distortion[i] = 0;
	}
	distortionFrame = true;
	alarm[1] = 15 / max(1, current_message);
}

show_debug_message("tick");
