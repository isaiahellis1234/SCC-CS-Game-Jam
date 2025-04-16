// Plays collision animation when a bullet hits the wall
sprite_index = s_bullet_collision_anim

// Once animation is done, delete instance
if(image_index > image_number - 1) {

	instance_destroy();

}