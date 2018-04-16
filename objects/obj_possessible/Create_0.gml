/// @description Insert description here
// You can write your code in this editor
aiming = false;
wasAiming = false;

isPossessed = false;
range = 96;

xAimAxis = 0;
yAimAxis = 0;

canAim = true; //allowed to soul project out of this object?
canJump = true; //allowed to jump out of this object?

radiusDraw = 0;
draw_border = false;
line_step = 0;
line_len = 16;

spark1 = instance_create_layer(x, y - sprite_get_height(sprite_index) / 2, layer_get_id("UpperEffect"), obj_projection_circle_spark);
spark2 = instance_create_layer(x, y - sprite_get_height(sprite_index) / 2, layer_get_id("UpperEffect"), obj_projection_circle_spark);

spark1.step = irandom(359);
spark2.step = (spark1.step + 180) % 360;

spark1.originator = id;
spark2.originator = id;