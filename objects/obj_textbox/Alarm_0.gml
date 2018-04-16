/// @description process sourceString, start incrementing

#region Load from arr
show_debug_message(arr);
a = arr[0]; //if this is out of bounds it'll crash
show_debug_message(arr);
sourceString = a.text;
textWait = a.textWait;

if (array_length_1d(arr) == 1) {
	//we know we're the last one
	if (a.type == "yesno") {
		choiceLockout = 50;	
		selected = 1;
	} else if (a.type == "choice") {
		choiceLockout = 50;
		selectedMax = ds_list_size(a.choices);
	}
}
#endregion


#region Parse String
//increment through string to lineStart + charsPerLine,
//seek back to most recent space character, replace with \n.
var lineStart = 0;
var currentLineCharacter = 0;
var nbsp = " "; //it's ascii code 255. 
while (lineStart + charsPerLine <= string_length(sourceString)) {
	//we'll need a new line.
	currentLineCharacter = lineStart;
	for (var i = 0; i < charsPerLine; i++) {
		if (string_char_at(sourceString, currentLineCharacter) == "^") {
			currentLineCharacter += 2;
		}
		currentLineCharacter += 1;
	}
	
	//seek back from "end of line" to last valid space before last word on that line
	while(currentLineCharacter > 0 && string_char_at(sourceString, currentLineCharacter) != " ") {
		currentLineCharacter -= 1;	
	}
	//we're at the space character, replace it with a nbsp (can't be used otherwise, we don't care)
	show_debug_message(currentLineCharacter);
	sourceString = string_delete(sourceString, currentLineCharacter, 1);
	sourceString = string_insert(nbsp, sourceString, currentLineCharacter);
		
	lineStart = currentLineCharacter + 1;
	currentLineCharacter = 0;
}


//now replace nbsp with newlines (didn't do it before because \n is two characters)
show_debug_message(sourceString);
sourceString = string_replace_all(sourceString, nbsp, "\n");
#endregion

alarm[1] = 1;