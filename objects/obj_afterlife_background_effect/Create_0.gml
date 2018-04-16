/// @description Insert description here
// You can write your code in this editor

p_system = part_system_create();
part_system_layer(p_system, layer_get_id("Effect"));

p_back = part_type_create();
part_type_shape(p_back, pt_shape_circle);
part_type_size(p_back,0.15, 0.45, 0, 0.01);
part_type_color1(p_back, c_dkgray);
part_type_alpha3(p_back, 0.15, 1, 0);
part_type_speed(p_back, 0.5, 2, 0, 0);
part_type_direction(p_back, 90, 90, 0, 0);
part_type_gravity(p_back, 0, 270);
part_type_orientation(p_back, 90, 90, 0, 0, 0);
part_type_blend(p_back, 1);
part_type_life(p_back, 60, 300);

p_emit = part_emitter_create(p_system);
part_emitter_region(p_system, p_emit, 0, 480, 290, 310, ps_shape_rectangle, ps_distr_linear);
part_system_automatic_draw(p_system, false);

p_surface = surface_create(480, 256);

step = 0;
emit_rate = 20;
