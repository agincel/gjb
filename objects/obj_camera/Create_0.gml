/// @description Insert description here
// You can write your code in this editor

view_enabled = true;
view_set_visible(0, true);

view_set_wport(0, 960);
view_set_hport(0, 540);

my_camera = camera_create_view(0, 0, 480, 270, 0, noone, 0, 0, 0, 0);
view_set_camera(0, my_camera);

camera_set_view_pos(my_camera, 0, 0);
inMenu = false;

aberration = 0;
chromatic_shake = 0;

minimap_surface = -1;

for (var i = 0; i < room_width / 480; i++) {
	for (var j = 0; j < room_height / 256; j++) {
		visited[i, j] = false;
	}
}

level_name = "the afterlife";