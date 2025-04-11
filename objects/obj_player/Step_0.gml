// Checks if either A or D is held down, both either 0 or 1
var moveLeft = keyboard_check(ord("A"));
var moveRight = keyboard_check(ord("D"));

// Calculates the velocity vector of the player
xSpd = (moveRight - moveLeft) * moveSpd;

// Orientates the sprite based on direction of movement
if xSpd < 0 {

	image_xscale = -1;

}

else if xSpd > 0 {

	image_xscale = 1;

}

// Moves the player sprite by amount denoted by xSpd
x += xSpd;
