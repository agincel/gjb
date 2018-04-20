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
	draw_text(xx + 424, yy + 256, "[+] map");
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
	draw_text(xx + 424, yy + 16, "[-] map");
	
	if (surface_exists(minimap_surface)) {
		surface_set_target(minimap_surface);
			draw_clear_alpha(c_white, 0);
			if (instance_exists(obj_player)) {
				with (obj_wall) {
					var visited_i = floor(x / 480);
					var visited_j = floor(y / 256);
					
					if (other.visited[visited_i, visited_j]) {
						
						var sharedPowerup = false;
						with (obj_powerup) {
							if (floor(x / 480) == visited_i && floor(y / 256) == visited_j) {
								sharedPowerup = true;
							}
						}
						
						if (!sharedPowerup) {
							draw_sprite(spr_minimap_ground, 0, 192 + ((x + 8) - room_width/2) * (1/16), 108 + ((y + 8) - (room_height/2)) * (1/16));
						} else {
							draw_set_alpha(random(1));
							draw_sprite(spr_minimap_ground, 0, 192 + ((floor(x / 480) * 480 + 8) - room_width/2) * (1/16) + irandom(29), 108 + ((floor(y / 256) * 256 + 8) - (room_height/2)) * (1/16) + irandom(15));
							draw_set_alpha(1);
						}
					}
				}
				
				with (obj_save_point) {
					var visited_i = floor(x / 480);
					var visited_j = floor(y / 256);
					
					if (other.visited[visited_i, visited_j]) {
						draw_sprite(spr_minimap_save, 0, 192 + ((x + 8) - room_width/2) * (1/16), 108 + ((y + 8) - (room_height/2)) * (1/16));
					}
				}
				
				with (obj_player) {
					draw_sprite(spr_minimap_player, 0, 192 + ((x) - room_width/2) * (1/16), 108 + ((y - 12) - (room_height/2)) * (1/16));
				}
			}
		surface_reset_target();
		
		draw_surface(minimap_surface, xx + xx_w/2 - surface_get_width(minimap_surface)/2, yy + yy_h/2 - surface_get_height(minimap_surface)/2);
		
		draw_set_font(fnt_credits_small);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text(xx + xx_w/2, yy + yy_h - 16, level_name);
	}
}