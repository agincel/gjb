

if (textComplete && a.type == "yesno") {
	selected = 1;	//go to "yes" which is on top
} else if (textComplete && a.type == "choice") { //todo fix?
	if (selected == 1) {
		selected = 0;	
	} else if (selected == 3) {
		selected = 2;	
	}
}