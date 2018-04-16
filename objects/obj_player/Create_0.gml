/// @description 

grav = 0.5;
movementSpeed = 3;

jumpStrength = -8;

maxJumps = 2;
jumps = maxJumps;
isGrounded = true;

xVelocity = 0;
yVelocity = 0;

maxYVelocity = 10;

aiming = false;
wasAiming = false;
range = 96;
percentNeeded = 0.66;

xAxis = 0;
yAxis = 0;
xAimAxis = 0;
yAimAxis = 0;

canAim = false;

//visual stuff
radiusDraw = 0;

spark1 = instance_create_layer(x, y - sprite_get_height(sprite_index) / 2, layer_get_id("UpperEffect"), obj_projection_circle_spark);
spark2 = instance_create_layer(x, y - sprite_get_height(sprite_index) / 2, layer_get_id("UpperEffect"), obj_projection_circle_spark);

spark1.step = irandom(359);
spark2.step = (spark1.step + 180) % 360;

spark1.originator = id;
spark2.originator = id;

line_step = 0;
line_len = 16;

current_sprite = spr_player_idle;
current_subimg = 0;