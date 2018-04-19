/// @description Insert description here
// You can write your code in this editor

if (pointer == 0) {
	pointer = 1;
	alarm[0] = 2;
} else {
	if (pointer < string_length(message[current_message])) {
		pointer++;
		alarm[0] = (string_char_at(message[current_message], pointer) == "\n") ? 30 : 2;
	}
}