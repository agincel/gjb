/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var anchor_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
var anchor_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;

draw_set_alpha(drawAlpha);
draw_set_font(fnt_credits_small);
draw_set_color(c_black);
for (var i = 0; i < 4; i++) {
	draw_text(anchor_x + lengthdir_x(1, i * 90),
			  anchor_y + lengthdir_y(1, i * 90) - 16, smallText);
}
draw_set_color(c_white);
draw_text(anchor_x, anchor_y - 16, smallText);

draw_set_font(fnt_credits_big);
draw_set_color(c_black);
for (var i = 0; i < 4; i++) {
	draw_text(anchor_x + lengthdir_x(1, i * 90),
			  anchor_y + lengthdir_y(1, i * 90), bigText);
}
draw_set_color(c_purple);
draw_text(anchor_x, anchor_y, bigText);
draw_set_alpha(1);