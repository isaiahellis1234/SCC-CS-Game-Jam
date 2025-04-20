// Step Event of obj_shockwave

// Increase the size of the shockwave
shockwave_size += shockwave_growth_speed;

// Scale the shockwave's sprite (or make it visually expand)
image_xscale = shockwave_size;
image_yscale = shockwave_size;

// Check for any enemies or the player within the shockwave's radius
// Apply damage or pushback effects here
if (shockwave_size * shockwave_damage_radius > 0) {
    with (obj_enemy) {
        // Calculate the distance from the shockwave to the enemy
        var dist = point_distance(x, y, obj_shockwave.x, obj_shockwave.y);
        
        // If the enemy is within the shockwave's radius, apply damage or effects
        if (dist < shockwave_size * shockwave_damage_radius) {
            // Apply damage (you can customize this)
            health -= 10;  // Example damage value
            // Apply knockback or push the enemy (optional)
            var push_direction = point_direction(obj_shockwave.x, obj_shockwave.y, x, y);
            var push_strength = 5;  // Push strength (adjust as needed)
            x += lengthdir_x(push_strength, push_direction);
            y += lengthdir_y(push_strength, push_direction);
        }
    }
}

// Destroy the shockwave once it reaches a maximum size
if (shockwave_size > 5) {  // Maximum size of the shockwave (adjust as needed)
    instance_destroy();
}
