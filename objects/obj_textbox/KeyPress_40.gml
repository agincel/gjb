

if (textComplete && a.type == "yesno") {
	selected = 0;	//go to "yes" which is on top
} else if (textComplete && a.type == "choice") { //todo fix?
	if (selected == 0 && selectedMax > 1) {
		selected = 1;	
	} else if (selected == 2 && selectedMax > 3) {
		selected = 3;	
	}
}