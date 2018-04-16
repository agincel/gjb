/// @description Insert description here
// You can write your code in this editor

if (aiming && isPossessed) {
	
	var cX = x;
	var cY = y;
	
	draw_set_circle_precision(64);
	gpu_set_blendmode_ext(bm_inv_dest_color, bm_zero);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_circle(cX, cY, radiusDraw, false);
	
	draw_set_color(c_black);
	gpu_set_blendmode(bm_add);
	draw_circle(cX, cY, radiusDraw, false);
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_black);
	
	var dir = point_direction(cX, cY, cX + xAimAxis, cY + yAimAxis);

	var i = 0;
	
	var xx = cX;
	var yy = cY;
	
	while (i < range && ( !collision_line(cX, cY, xx, yy, obj_wall, true, true)
					 &&   !collision_line(cX, cY, xx, yy, obj_possessible, true, true))) {
		/*/*/
		xx += lengthdir_x(1, dir);
		yy += lengthdir_y(1, dir);
		i++;
		
	}
	
	draw_set_color(c_gray);
	if (collision_line(cX, cY, xx, yy, obj_wall, true, true)
	 || collision_line(cX, cY, xx, yy, obj_possessible, true, true)) {
		draw_set_color(c_red);	 
	}
		
	var draw_i = 0;
	while (draw_i < i - line_step && draw_i < range) {
		
		draw_line_width(cX - 1,
						cY - 1,
						cX - lengthdir_x(min(0, line_len - line_step), dir) - 1,
						cY - lengthdir_y(min(0, line_len - line_step), dir) - 1,
						2);
			
		var line_draw = 0;
		for (var j = 0; j < line_len; j++) {
			if (draw_i + line_draw < i - line_step && draw_i + line_draw < range) {
				line_draw += 1;
			}
		}
			
		draw_line_width(cX + lengthdir_x(min(draw_i + line_step, range), dir) - 1,
						cY + lengthdir_y(min(draw_i + line_step, range), dir) - 1,
						cX + lengthdir_x(min(draw_i + line_step + line_draw, range), dir) - 1,
						cY + lengthdir_y(min(draw_i + line_step + line_draw, range), dir) - 1,
						2);
			
		draw_i += line_draw;
			
		for (var j = 0; j < line_len; j++) {
			if (draw_i < i - line_step && draw_i < range) {
				draw_i += 1;
			}
		}
	}
	
}

if (isPossessed) {
	image_blend = c_blue;	
} else {
	image_blend = c_white;	
}

if (draw_border) {
	/*
	for (var i = 0; i < 4; i++) {
		gpu_set_blendmode_ext(bm_zero, bm_src_alpha_sat);
		draw_sprite_ext(sprite_index, image_index,
						x + lengthdir_x(4, i * 90),
						y + lengthdir_y(4, i * 90),
						image_xscale, image_yscale,
						image_angle, c_purple, 1);
		gpu_set_blendmode(bm_normal);
	}
	*/
}

draw_self();