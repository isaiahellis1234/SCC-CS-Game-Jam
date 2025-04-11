// Checks if either A or D is held down, both either 0 or 1
var moveLeft = keyboard_check(ord("A"));
var moveRight = keyboard_check(ord("D"));
var jKey = keyboard_check(vk_space);

// Check for ground
if place_meeting(x, y + 1, obj_solid) {

	ySpd = 0;
	
	if jKey {
	
		ySpd = -jSpd;
	
	}

} else {

	if ySpd < 10 {
	
		ySpd += grav;
	
	}

}

// Calculates the velocity vector of the player
xSpd = (moveRight - moveLeft) * moveSpd;

// Orientates the sprite based on direction of movement
if xSpd != 0 { 
	
	image_xscale = sign(xSpd); 

}

// Horizantal collision checking
if place_meeting(x + xSpd, y, obj_solid) {

	while(!place_meeting(x + sign(xSpd), y, obj_solid)) {
	
		x += sign(xSpd);
	
	}

	xSpd = 0;

}

// Moves the player sprite by amount denoted by xSpd
x += xSpd;

// Vertical collision checking
if place_meeting(x, y + ySpd, obj_solid) {

	while(!place_meeting(x, y + sign(ySpd), obj_solid)) {
	
		y += sign(ySpd);
	
	}

	ySpd = 0;

}

// Moves the player sprite by amount denoted by ySpd
y += ySpd;
