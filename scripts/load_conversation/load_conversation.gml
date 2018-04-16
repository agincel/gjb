///@argument jsonFilePath

var json = read_json(argument0);
var list = json[0];
var maptodestroy = json[1];

var metadata = ds_list_find_value(list, 0); //get the metadata

var type = metadata[? "type"];
var endScript = metadata[? "endScript"];
var yesScript = metadata[? "yesScript"];
var noScript = metadata[? "noScript"];
var choiceScripts = metadata[? "choiceScripts"]; //should return yet another ds_list
var endFile = metadata[? "endFile"];
var yesFile = metadata[? "yesFile"];
var noFile = metadata[? "noFile"];
var choiceFiles = metadata[? "choiceFiles"]; //a ds_list
var choices = metadata[? "choices"]; //ds_list

var arr = -1;
var arr_index = 0;

//perform cleanup on all old struct conversations
with (struct_conversation) {
	instance_destroy(id);
}

if (type == "plain") {
	for (var i = 1; i < ds_list_size(list); i++) {
		var c = instance_create_depth(0, 0, 9999, struct_conversation);
		c.type = type;
		c.endScript = endScript;
		c.endFile = endFile;
		
		var conversationNode = ds_list_find_value(list, i);
		c.text = conversationNode[? "text"];
		c.name = conversationNode[? "name"];
		c.side = conversationNode[? "portraitType"];
		c.portrait = conversationNode[? "portrait"];
		var textWait = conversationNode[? "textWait"];
		if (is_undefined(textWait)) {
			textWait = 2; //default
		} else {
			textWait = real(textWait);	
		}
		c.textWait = textWait;
		arr[arr_index++] = c;
	}
} else if (type == "yesno") {
	for (var i = 1; i < ds_list_size(list); i++) {
		var c = instance_create_depth(0, 0, 9999, struct_conversation);
		if (i != ds_list_size(list) - 1) {
			//if we haven't reached the very last one yet
			c.type = "yesno";
			
			var conversationNode = ds_list_find_value(list, i);
			c.text = conversationNode[? "text"];
			c.name = conversationNode[? "name"];
			c.side = conversationNode[? "portraitType"];
			c.portrait = conversationNode[? "portrait"];
			var textWait = conversationNode[? "textWait"];
			if (is_undefined(textWait)) {
				textWait = 2; //default
			} else {
				textWait = real(textWait);	
			}
			c.textWait = textWait;
		} else {
			//last one, set to "yesno" and set relevant scripts
			c.type = type;
			c.yesScript = yesScript;
			c.noScript = noScript;
			c.yesFile = yesFile;
			c.noFile = noFile;
			
			var conversationNode = ds_list_find_value(list, i);
			c.text = conversationNode[? "text"];
			c.name = conversationNode[? "name"];
			c.side = conversationNode[? "portraitType"];
			c.portrait = conversationNode[? "portrait"];
			var textWait = conversationNode[? "textWait"];
			if (is_undefined(textWait)) {
				textWait = 2; //default
			} else {
				textWait = real(textWait);	
			}
			c.textWait = textWait;
		}
		
		arr[arr_index++] = c;
	}
} else if (type == "choice") {
	for (var i = 1; i < ds_list_size(list); i++) {
		var c = instance_create_depth(0, 0, 9999, struct_conversation);
		if (i != ds_list_size(list) - 1) {
			//if we haven't reached the very last one yet
			c.type = "choice";
			
			var conversationNode = ds_list_find_value(list, i);
			c.text = conversationNode[? "text"];
			c.name = conversationNode[? "name"];
			c.side = conversationNode[? "portraitType"];
			c.portrait = conversationNode[? "portrait"];
			var textWait = conversationNode[? "textWait"];
			if (is_undefined(textWait)) {
				textWait = 2; //default
			} else {
				textWait = real(textWait);	
			}
			c.textWait = textWait;
		} else {
			//last one, set to "yesno" and set relevant scripts
			c.type = type;
			c.choices = choices;
			c.choiceScripts = choiceScripts;
			c.choiceFiles = choiceFiles;
			
			var conversationNode = ds_list_find_value(list, i);
			c.text = conversationNode[? "text"];
			c.name = conversationNode[? "name"];
			c.side = conversationNode[? "portraitType"];
			c.portrait = conversationNode[? "portrait"];
			var textWait = conversationNode[? "textWait"];
			if (is_undefined(textWait)) {
				textWait = 2; //default
			} else {
				textWait = real(textWait);	
			}
			c.textWait = textWait;
		}
		
		arr[arr_index++] = c;
	}
}


textbox(arr); //actually create the textbox






