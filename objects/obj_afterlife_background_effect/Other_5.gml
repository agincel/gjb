/// @description Insert description here
// You can write your code in this editor

part_system_clear(p_system);
part_type_clear(p_back);
part_emitter_clear(p_system, p_emit);
part_system_destroy(p_system);

if (surface_exists(p_surface)) {
	surface_free(p_surface);
}