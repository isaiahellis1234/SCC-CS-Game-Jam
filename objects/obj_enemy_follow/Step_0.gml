// Check if player exists and is not noone
if (instance_exists(player) && player != noone) {
    var dist = point_distance(x, y, player.x, player.y);
    var dir = point_direction(x, y, player.x, player.y);
    var move_x = 0;

    // Follow Movement
    if (dist < follow_range && dist > stop_dist) {
        move_x = lengthdir_x(follow_speed, dir);
        image_xscale = sign(player.x - x);
    }

    // Gravity
    var grav = 0.5;
    if (!place_meeting(x, y + 1, obj_solid)) {
        yspd += grav;
    } else {
        yspd = 0;
    }

    // Horizontal Collision
    if (!place_meeting(x + move_x, y, obj_solid)) {
        x += move_x;
    }

    // Vertical Collision
    if (!place_meeting(x, y + yspd, obj_solid)) {
        y += yspd;
    } else {
        while (!place_meeting(x, y + sign(yspd), obj_solid)) {
            y += sign(yspd);
        }
        yspd = 0;
    }

    // Shooting
    if (dist <= shoot_range) {
        if (shoot_cooldown <= 0) {
            var b = instance_create_layer(x, y, "Instances", obj_basic_enemy_bullet);
            b.direction = dir;
            b.speed = 6;
            shoot_cooldown = 60; // cooldown in frames (1 sec at 60fps)
        }
    }

    // Cooldown timer
    if (shoot_cooldown > 0) {
        shoot_cooldown -= 1;
    }
} else {
    // Optional: Idle behavior when player doesn't exist
    // yspd still affected by gravity even if no player
    var grav = 0.5;
    if (!place_meeting(x, y + 1, obj_solid)) {
        yspd += grav;
    } else {
        yspd = 0;
    }

    if (!place_meeting(x, y + yspd, obj_solid)) {
        y += yspd;
    } else {
        while (!place_meeting(x, y + sign(yspd), obj_solid)) {
            y += sign(yspd);
        }
        yspd = 0;
    }
}

// Check for death
if (hp <= 0) {
	instance_create_layer(x + 25, y - 50, "Instances", obj_coins);
	instance_create_layer(x - 25, y - 50, "Instances", obj_coins);
    instance_create_layer(x, y, "Instances", obj_bullet_collision_anim);
    instance_destroy();
}
