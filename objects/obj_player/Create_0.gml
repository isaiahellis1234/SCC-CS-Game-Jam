// Initializes variables on player creation
// (Numbers are somewhat arbitrary, subject to change) 

// How fast the player moves
moveSpd = 5;

// How fast the player jumps
jSpd = 12;

// makes the x-axis speed
xSpd = 0;

// makes the y-axis speed
ySpd = 0;

// gravity
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

// Make hp and hp_max the same.
hp = 100; // the health that starts
hp_max = 100; // the max the health could be

coins = 0;

damage_timer = 0; // Start with zero so it damages right away