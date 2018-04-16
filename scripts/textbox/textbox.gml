///@argument c_arr array of struct_conversations to start a chain of textboxes

//todo, account for the double-wide room
//for now, just hardcoding

var tX = 470 / 2;
var tY = 40;

var t = instance_create_depth(tX, tY, -9999, obj_textbox);
t.arr = argument0;

