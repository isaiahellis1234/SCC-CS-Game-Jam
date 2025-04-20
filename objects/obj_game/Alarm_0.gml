// Destroy the previously spawned blocks
// Start fading out old blocks instead of instantly destroying
for (var i = 0; i < array_length(block_ids); i++) {
    if (instance_exists(block_ids[i])) {
        block_ids[i].fading = true;
    }
}


// Clear the array
block_ids = [];

// Spawn new 3 grappling blocks and save their IDs
for (var i = 0; i < 3; i++) {
    var new_block = instance_create_layer(random(room_width), random_range(100, 150), "Instances", obj_grappling_block);
    array_push(block_ids, new_block);
}

// Restart the alarm
alarm[0] = 6 * room_speed;
