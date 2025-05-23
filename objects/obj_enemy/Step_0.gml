/* ===== KEEP IN MIND WHEN ENEMY HITS THE LEFT
		SIDE OF A INV BLOCK, THE BLOCK HAS TO BE FURTHER
		AWAY THEN IF IT HITS THE RIGHT SIDE
*/



// Next horizontal position
var next_x = x + xspd;
// Slightly below the enemy to check for ground
var below_y = y;

// If there's a wall in front OR there's no ground ahead, turn around
if (place_meeting(next_x, y, obj_solid_inv)) {
    xspd = -xspd; // Reverse direction
}

// Move
x += xspd;

// Flip sprite to face the correct direction (optional)
image_xscale = sign(xspd);

if hp <= 0 {
	instance_create_layer(x, y - 50, "Instances", obj_coins);
	instance_create_layer(x, y, "Instances", obj_bullet_collision_anim);
	instance_destroy();
	audio_play_sound(snd_explode,1,false);
}