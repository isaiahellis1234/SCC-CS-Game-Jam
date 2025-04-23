// Check if the boss's hp has dropped to 0 or below, destroy it
if (hp <= 0) {
	instance_create_layer(x, y, "Instances", obj_bullet_boss_death_anim);
    instance_destroy();
}

// Phase transitio
if (hp <= 500 && phase == 1) {
    phase = 2;
    attack_timer = 0;
    show_debug_message("Phase changed to 2");
}

if (hp <= 250 && phase == 2) {
    phase = 3;
    attack_timer = 0;
    show_debug_message("Phase changed to 3");
}

// Boss Movement: The boss follows the player continuously
if (instance_exists(obj_player)) {
    // Follow the player
    var follow_speed = move_speed; // Adjust this value to control the speed at which the boss follows the player
    move_towards_point(obj_player.x, obj_player.y, follow_speed);
}

// Attack logic: trigger attacks based on cooldown and phase
attack_timer++;
if (attack_timer > attack_cooldown) {
    switch (phase) {
        case 1:
            if (irandom(1) == 0) {
                laser_attack();
            } else {
                ground_slam();
            }
            attack_cooldown = 120; // Phase 1 cooldown
            break;

        case 2:
            if (irandom(1) == 0) {
                homing_missiles();
            } else {
                shockwave();
            }
            attack_cooldown = 100; // Phase 2 cooldown
            break;

        case 3:
			rapid_laser_barrage();
            attack_cooldown = random_range(100, 230); // Phase 3 cooldown
            break;
    }
    attack_timer = 0; // Reset attack timer after each attack
}

// === ATTACK FUNCTIONS ===

// Laser attack: Fires a laser towards the player
function laser_attack() {
    var laser = instance_create_layer(x, y, "Instances", obj_laser);
    laser.direction = point_direction(x, y, obj_player.x, obj_player.y);
    laser.speed = 8;
}

// Ground slam: Creates a shockwave under the boss
function ground_slam() {
    var shockwave = instance_create_layer(x - 100, y - sprite_height / 2, "Instances", obj_shockwave);
    shockwave.shockwave_size = 1;  // Optional: custom size value
    shockwave.shockwave_growth_speed = 0.1;
    shockwave.shockwave_damage_radius = 50;
    shockwave.direction = 90; // Upward
    shockwave.speed = 4;      // Adjust as needed
}



// Homing missiles: Fires missiles that track the player
function homing_missiles() {
    if (!instance_exists(obj_player)) return;

    for (var i = 0; i < 3; i++) {
        var missile = instance_create_layer(x + irandom_range(-16, 16), y, "Instances", obj_missile);
        if (missile != noone) {
            missile.target = obj_player;
        }
    }
}

// Shockwave: Fires multiple shockwaves (wider effect)
function shockwave() {
    ground_slam(); // Calls ground slam twice for a wider effect
    ground_slam();
}

// Rapid laser barrage: Fires lasers in a full circle (360 degrees)
function rapid_laser_barrage() {
    var num_lasers = 16; // You can increase for a denser circle
    var angle_step = 360 / num_lasers;

    for (var i = 0; i < num_lasers; i++) {
        var angle = i * angle_step;
        var laser = instance_create_layer(x, y, "Instances", obj_laser);
        laser.direction = angle;
        laser.speed = 10;
    }
}

// Laser puddle: Creates a puddle that lasts for a set amount of time
function laser_puddle() {
    var puddle = instance_create_layer(x + random_range(-32, 32), y + 48, "Instances", obj_laser);
    puddle.speed = 0; // Puddle doesn't move
    alarm[0] = room_speed * 3; // Puddle lasts for 3 seconds
}

// Energy pulse: Pushes or stuns the player briefly
function energy_pulse() {
    with (obj_player) {
        // Push player back or stun briefly
        xSpd = lengthdir_x(8, point_direction(other.x, other.y, x, y));
        ySpd = -4;
    }
}

// Step Event of obj_boss

// 1. Check if the boss is within the room's boundaries.
if (x < 0) {
    x = 0;  // Prevent moving past the left edge of the room.
}
if (x > room_width) {
    x = room_width;  // Prevent moving past the right edge of the room.
}
if (y < 0) {
    y = 0;  // Prevent moving past the top edge of the room.
}

// 2. Prevent the boss from touching the bottom
var min_y_position = 475;  // Minimum Y value where the boss can move (adjust as needed).
if (y > min_y_position) {
    y = min_y_position;  // Keep the boss above this Y value.
}

// 3. Movement towards the player
if (instance_exists(obj_player)) {
    var follow_speed = 0.5;  // Adjust the speed as needed.
    move_towards_point(obj_player.x, obj_player.y, follow_speed);
}

// Optional: If you want to make sure the boss does not go past the walls or follow the player, add this additional check:
if (x < 50) {  // Left wall (adjust to fit your game)
    x = 50;  // Prevent boss from crossing the left wall.
}
if (x > room_width - 50) {  // Right wall (adjust to fit your game)
    x = room_width - 50;  // Prevent boss from crossing the right wall.
}
