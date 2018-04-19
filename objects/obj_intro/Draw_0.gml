/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_intro);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (pointer > 0) {
	for (var i = 1; i < pointer; i++) {
		var messagePartial = string_copy(message[current_message], 1, pointer);
		
		if (pointer == string_length(message[current_message])) {
			draw_set_color(c_gray);
			switch (current_message) {
				case 3:
					draw_text_ext(48, 96, message3alt, -1, 384);
					break;
				case 4:
					draw_text_ext(48, 96, message4alt[0], -1, 384);
					draw_text_ext(48, 96, message4alt[1], -1, 384);
					draw_text_ext(48, 96, message4alt[2], -1, 384);
					break;
				case 6:
					draw_text_ext(48, 96, message6alt[0], -1, 384);
					draw_text_ext(48, 96, message6alt[1], -1, 384);
					draw_text_ext(48, 96, message6alt[2], -1, 384);
					break;
			}
		}
		
		draw_set_color(c_black);
		draw_text_ext(48, 96, messagePartial, -1, 384);
		
		gpu_set_blendmode_ext(bm_one, bm_inv_src_color);
		draw_set_color(c_red);
		draw_text_ext(48 + distortion[0], 96 + distortion[1], messagePartial, -1, 384);
		draw_set_color(c_blue);
		draw_text_ext(48 + distortion[2], 96 + distortion[3], messagePartial, -1, 384);
		draw_set_color(c_lime);
		draw_text_ext(48 + distortion[4], 96 + distortion[5], messagePartial, -1, 384);
		
		gpu_set_blendmode(bm_normal);
		
	}
}

if (pointer == string_length(message[current_message])) {
	draw_sprite(spr_powerup, 0, room_width/2, room_height - 32);
}