/// @description Draw the textbox, the current displayString, and any portraits/additional needed text

draw_self(); //draw the text box background sprite

//let's get the starting x and y for the text
//hardcode at 12, 12

var margin_left = 12;
var margin_right = 12;


var margin_top = 8;


draw_set_font(fnt_text_box);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);



portrait = asset_get_index(!is_undefined(a.portrait) ? a.portrait : "");
if (portrait > 0) {
	//draw portrait
	if (a.side == "left") {
		draw_sprite(portrait, 0, bbox_left + (sprite_get_width(portrait) / 2) + (margin_left / 2), y);	
		margin_left += (margin_left / 2) + sprite_get_width(portrait);
	} else {
		draw_sprite_ext(portrait, 0, bbox_right - (sprite_get_width(portrait) / 2) - (margin_right / 2), y, -1, 1, 0, c_white, 1);	
	}
}


var startX = bbox_left + margin_left;
var endX = bbox_right - margin_right;
var startY = bbox_top + margin_top;
draw_text_ext(startX, startY, displayString, lineHeight, endX - startX);

if (textComplete) {
	animCurrent += animSpeed;
	draw_sprite(spr_textbox_next, animCurrent, bbox_right - 12, bbox_bottom - margin_top);
}
