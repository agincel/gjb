/// @description Increment character by one, display new string. 
//If at end of string, prompt user to either select a dialog option or continue.

var c = string_char_at(sourceString, currentCharacter);
var additionalDelay = 0;
if (c == "\\") {
	//the next character is n for newline, add both
	displayString += c;
	currentCharacter += 1;
	c = string_char_at(sourceString, currentCharacter); //add a second character
	displayString += c;
	currentCharacter += 1;
} else if (c == "^") {
	show_debug_message("adding delay");
	currentCharacter += 1;
	//this should be a 1 digit number, that is equal to the number of frames to add to delay
	c = string_char_at(sourceString, currentCharacter);
	additionalDelay = real(c);
	currentCharacter++; //seek to the next character for the next go around
} else {
	displayString += c;
	currentCharacter += 1;
}

if (currentCharacter > string_length(sourceString)) {
	//if the strings are the same, we're at the end of this textbox
	textComplete = true;
} else {
	alarm[1] = textWait + additionalDelay; //in textWait frames, increment again
}

