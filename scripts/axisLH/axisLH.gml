return clamp(gamepad_axis_value(0, gp_axislh) + (keyboard_check(vk_right) - keyboard_check(vk_left)), -1, 1);