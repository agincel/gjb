/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_speed = 0;
image_index = 0;

canAim = false;
canJump = false;

didLeft = false;
didRight = false;

counter = 8;
isShaking = 0;
shakeTime = 15;

maxYVelocity = 7;
yVelocity = 0;
grav = 0.25;

overwriteDrawSelf = true;

shakeIntensity = 1;
shakeIntensityDelta = 0.25; //goes up by this much each shake

done = false;