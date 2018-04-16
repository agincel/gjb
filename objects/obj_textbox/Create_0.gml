/// @description Insert description here
// You can write your code in this editor
sourceString = "Hello,^6 this is a long test string where I'm not entirely sure what to say except this dialog box needs to be slightly long.^9^5 Yay.";
displayString = "";
portrait = -1;
name = -1;


currentCharacter = 1;
charsPerLine = 39; //if change font, probably change this.
lineHeight = 11;

textWait = 2;

arr = -1; //this will end up being an array of struct_conversations
a = -1;
textComplete = false;
alarm[0] = 1;

animSpeed = 0.5;
animCurrent = 0;

selected = 0; // 0|1 for no|yes, or 0|1|2|... for choices
selectedMax = 1; //default for yes/no, really important for choice type

choiceLockout = -1; //one second where you can't select a choice, might tweak for better playability