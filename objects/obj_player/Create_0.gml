// Initializes variables on player creation
// (Numbers are somewhat arbitrary, subject to change) 

// How fast the player moves
moveSpd = 5;

// How fast the player jumps
jSpd = 12;

// Dictates speed in the x-axis, start with none
xSpd = 0;

// Dictates speed in the y-axis, start with none
ySpd = 0;

// "Gravity" the player experiences
grav = 0.5;

// Create cord for the grappling hook
mx = x; // Hook X coord
my = y; // Hook y corrd
active = false; // If we are actually grappling

wall_jump_speed = 4; // how hard you push away from the wall
canWallJump = false;
wallDir = 0; // -1 for left wall, 1 for right wall

jump_count = 0;
max_jumps = 2; // regular + double