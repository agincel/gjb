/// @description temp go to next box

if (textComplete && choiceLockout < 0) {
	//time to do a thing
	
	if (array_length_1d(arr) > 1) {
		//there's more conversation to be had
		var new_arr = -1;
		show_debug_message("Arr: " + string(arr));
		for (var i = 0; i < array_length_1d(arr) - 1; i++) {
			new_arr[i] = arr[i + 1];	
		}
		show_debug_message("New_arr: " + string(new_arr));
		textbox(new_arr);
		instance_destroy(id);
	} else {
		//last one of the conversation, do stuff depending on type
		if (a.type == "plain") { //if plain, check for valid endScript and endFile, execute if needed
			if (!is_undefined(a.endScript) && a.endScript != -1 && a.endScript != "-1") {
				script_execute(asset_get_index(a.endScript));	
			}
			
			if (!is_undefined(a.endFile) && a.endFile != -1 && a.endFile != "-1") {
				load_conversation(a.endFile);	
			}
			
		} else if (a.type == "yesno") { //if yesno, check for valid yes/noScript/File, and execute if needed
			if (selected == 0) {
				if (!is_undefined(a.noScript) && a.noScript != -1 && a.noScript != "-1") {
					var asset = asset_get_index(a.noScript);
					if (asset != -1)
						script_execute(asset);
					else
						show_debug_message("Could not find script " + a.noScript);
				}
				
				if (!is_undefined(a.noFile) && a.noFile != -1 && a.noFile != "-1") {
					load_conversation(a.noFile);	
				}
				
			} else if (selected == 1) {
				if (!is_undefined(a.yesScript) && a.yesScript != -1 && a.yesScript != "-1") {
					var asset = asset_get_index(a.yesScript)
					if (asset != -1)
						script_execute(asset);
					else
						show_debug_message("Could not find script " + a.yesScript);
				}
				
				if (!is_undefined(a.yesFile) && a.yesFile != -1 && a.yesFile != "-1") {
					load_conversation(a.yesFile);	
				}
			}
		} else if (a.type == "choice") {
			//check for valid choiceScript[selected] and choiceFile[selected], execute if needed
			if (!is_undefined(a.choiceScripts) && a.choiceScripts != -1 && a.choiceScripts != "-1") {
				//array fine, now check specific element
				var cS = ds_list_find_value(a.choiceScripts, selected);
				if (!is_undefined(cS) && cS != -1 && cS != "-1") {
					//we were given an actual string for choiceScripts[selected], try to execute
					var asset = asset_get_index(cS);
					if (asset != -1)
						script_execute(asset);
					else
						show_debug_message("Could not find script " + cS);
				}
			}
			
			if (!is_undefined(a.choiceFiles) && a.choiceFiles != -1 && a.choiceFiles != "-1") {
				//array fine, now check specific element
				var cF = ds_list_find_value(a.choiceFiles, selected);
				if (!is_undefined(cF) && cF != -1 && cF != "-1") {
					//we were given an actual string for choiceFiles[selected], try to execute
					load_conversation(cF);	
				}
			}
		}
		
		instance_destroy(id);
	}
} else {
	//skip to end of textbox
	
	while (currentCharacter <= string_length(sourceString)) {
		var c = string_char_at(sourceString, currentCharacter);
		
		if (c == "\\") {
			//the next character is n for newline, add both
			displayString += c;
			currentCharacter += 1;
			c = string_char_at(sourceString, currentCharacter); //add a second character
			displayString += c;
			currentCharacter += 1;
		} else if (c == "^") {
			currentCharacter += 2; //skip over it and the next
		} else {
			displayString += c;
			currentCharacter += 1;
		}
	}
	textComplete = true;
	alarm[1] = -1; //cancel alarm 1
}/// @description Insert description here
// You can write your code in this editor
