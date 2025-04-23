// Basic stats
hp = 1000;
max_hp = 1000;
speed = 3; // Speed of movement
jump_height = 12; // How high the boss jumps
fall_speed = 0; // To simulate gravity
jumping = false; // Is the boss currently jumping?

// Positioning
x_target = obj_player.x; // Target position (the player's x)
y_target = obj_player.y - 50; // The height the boss will jump to above the player

// Movement variables
x_speed = 0;
y_speed = 0;

phase = 1;
attack_timer = 0;
attack_state = 0; // Which attack is happening
attack_cooldown = 0;
move_speed = 0.05;

target = noone;

alarm[0] = random_range(1, 5) * room_speed;
