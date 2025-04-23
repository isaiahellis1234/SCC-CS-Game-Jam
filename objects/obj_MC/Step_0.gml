if (instance_exists(obj_player)) {
    // Follow the player
    var follow_speed = 2; // Adjust this value to control the speed at which the boss follows the player
    move_towards_point(obj_player.x, obj_player.y, follow_speed);
}