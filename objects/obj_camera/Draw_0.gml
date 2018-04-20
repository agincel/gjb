/// @description Insert description here
// You can write your code in this editor

var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);

var xx_w = camera_get_view_width(view_camera[0]);
var yy_h = camera_get_view_height(view_camera[0]);

if (!inMenu) {
	draw_set_color(c_black);
	draw_rectangle(xx, yy + 256, xx + xx_w, yy + yy_h, false);

	draw_set_color(c_white);
	draw_line_width(xx - 1, yy + 256, xx + xx_w, yy + 256, 6);
	draw_set_color(c_black);
	draw_line_width(xx - 1, yy + 256, xx + xx_w, yy + 256, 4);

	draw_set_color(c_white);
	draw_rectangle(xx + 391, yy + 247, xx + 459, yy + 265, false);
	draw_set_color(c_black);
	draw_rectangle(xx + 392, yy + 248, xx + 458, yy + 264, false);
	draw_set_color(c_white);
	draw_set_font(fnt_hud_small);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx + 424, yy + 256, "[+] menu");
} else {
	draw_set_color(c_black);
	draw_rectangle(xx, yy, xx + xx_w, yy + yy_h, false);

	draw_set_color(c_white);
	draw_line_width(xx - 1, yy + 16, xx + xx_w, yy + 16, 6);
	draw_set_color(c_black);
	draw_line_width(xx - 1, yy + 16, xx + xx_w, yy + 16, 4);

	draw_set_color(c_white);
	draw_rectangle(xx + 391, yy + 7, xx + 459, yy + 25, false);
	draw_set_color(c_black);
	draw_rectangle(xx + 392, yy + 8, xx + 458, yy + 24, false);
	draw_set_color(c_white);
	draw_set_font(fnt_hud_small);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx + 424, yy + 16, "[-] menu");
}