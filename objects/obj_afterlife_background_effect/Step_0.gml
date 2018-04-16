/// @description Insert description here
// You can write your code in this editor

step++;
if (step == emit_rate) {
	part_emitter_burst(p_system, p_emit, p_back, 1);
	step = 0;
}

if (!surface_exists(p_surface)) {
	p_surface = surface_create(480, 256);
}