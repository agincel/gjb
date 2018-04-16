/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_purple);
draw_line_width(x, y, draw_x, draw_y, size * (life / 60));

draw_set_color(c_white);
draw_line_width(x, y, draw_x, draw_y, (size * 0.65) * (life / 60));