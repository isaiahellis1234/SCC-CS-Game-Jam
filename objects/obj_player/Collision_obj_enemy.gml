// Side collision check
if (bbox_bottom > other.bbox_top + 5) {
    // Decrease timer
    damage_timer -= 1;

    if (damage_timer <= 0) {
        // Deal damage
        hp -= 1; 
        damage_timer = 0.2 * room_speed; // Quater of a second cooldown
    }

    // Knockback
    if (x < other.x) {
        xSpd = -4;
    } else {
        ySpd = 4;
    }
}
