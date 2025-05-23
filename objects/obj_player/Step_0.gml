if bbox_top > room_height {

	room_restart();

}

if room == Room_Cutscene_1 {
	x += 5;
	sprite_index = spr_hero_run;
	image_speed = 1; // Make sure it's animating
	image_xscale = 1; // Face right
	
	// if player hits the room_width go to the next room
	if x > room_width {
		room_goto_next();	
	}
	// Skip animation logic & physics below
	exit;
}

if room != Room_Cutscene_1 {
	var moveLeft  = keyboard_check(ord("A"));
	var moveRight = keyboard_check(ord("D"));
	var jKey      = keyboard_check_pressed(vk_space); // _pressed gives snappier jumps

	// gravity
	if (!active) {
	    if (ySpd < 10) ySpd += grav;
	}

	// Regular Movement (not swinging)
	if (!active) {
	    xSpd = (moveRight - moveLeft) * moveSpd;
	}

	// Wall Jumping
	var onGround = place_meeting(x, y + 1, obj_solid);
	var canWallJump = false;
	var wallDir = 0;

	if (!onGround) {
	    if (place_meeting(x - 1, y, obj_solid)) {
	        canWallJump = true;
	        wallDir = -1; // wall on left
	    } else if (place_meeting(x + 1, y, obj_solid)) {
	        canWallJump = true;
	        wallDir = 1; // wall on right
	    }
	}

	// Jumping
	if (jKey) {
		audio_play_sound(snd_jump,1,false);
	    if (onGround) {
	        ySpd = -jSpd;
	        jump_count = 1;
	    } 
	    else if (canWallJump) {
	        ySpd = -jSpd;

	        // Nudge player away from wall to prevent glitch
	        if (!place_meeting(x - wallDir * 4, y, obj_solid)) {
	            x += -wallDir * 4;
	        }

	        xSpd = -wallDir * min(wall_jump_speed, 6); // limit wall jump power
	        jump_count = 1; // Reset to 1 so you can still double jump after wall jump
	    } 
	    else if (jump_count < max_jumps) {
	        ySpd = -jSpd;
	        jump_count += 1;
	    }
	}

	// Wall sliding with a slow fall down
	if (canWallJump and ySpd > 2) {
	    ySpd = 2;
	}

	// Grappling Input
// Grappling Input
if (mouse_check_button_pressed(mb_right)) {
    mx = mouse_x;
    my = mouse_y;

    // Check if the grappling block exists before allowing the grapple
    var grapple_block = instance_place(mx, my, obj_grappling_block);
    if (grapple_block != noone) {
        active = true;
		audio_play_sound(snd_grapple,1,false);

        // Optional: give slight velocity toward grapple when hooking
        var hook_dir = point_direction(x, y, mx, my);
        xSpd += lengthdir_x(2, hook_dir);
        ySpd += lengthdir_y(2, hook_dir);
    }
}

if (mouse_check_button_released(mb_right)) {
    active = false;
    jump_count = 1;
}


	//Grappling Physics
	if (active) {
	    // gravity while swinging
	    if (ySpd < 10) ySpd += grav;

	    // left/right influence
	    xSpd += (moveRight - moveLeft) * 0.4;

	    // Pull player back toward the grapple if stretched too far
	    var dx = x - mx;
	    var dy = y - my;
	    var dist = point_distance(x, y, mx, my);
	    var rope_length = 100;

	    if (dist > rope_length) {
	        var overshoot = dist - rope_length;
	        var pull_strength = 0.2;

	        // Pull back toward grapple
	        var pull_dir = point_direction(mx, my, x, y);
	        var pullX = lengthdir_x(overshoot * pull_strength, pull_dir);
	        var pullY = lengthdir_y(overshoot * pull_strength, pull_dir);

	        xSpd -= pullX;
	        ySpd -= pullY;

	        // Remove outward momentum 
	        var dot = (xSpd * dx + ySpd * dy) / dist;
	        xSpd -= (dx / dist) * dot;
	        ySpd -= (dy / dist) * dot;
	    }
	}

// Combined Horizontal Collision
if (place_meeting(x + xSpd, y, obj_solid) || place_meeting(x + xSpd, y, obj_non_jump_solid)) {
   while (!place_meeting(x + sign(xSpd), y, obj_solid) && !place_meeting(x + sign(xSpd), y, obj_non_jump_solid)) {
		 x += sign(xSpd);
	}

    xSpd = 0;
}
x += xSpd;

// Combined Vertical Collision
if (place_meeting(x, y + ySpd, obj_solid) || place_meeting(x, y + ySpd, obj_non_jump_solid)) {
    while (!place_meeting(x, y + sign(ySpd), obj_solid) && !place_meeting(x, y + sign(ySpd), obj_non_jump_solid)) {
        y += sign(ySpd);
    }
    ySpd = 0;
}
y += ySpd;


	// left and right facing image
	if (xSpd != 0) {
	    image_xscale = sign(xSpd);
	}
	
	// Clamping Movement
	xSpd = clamp(xSpd * 0.98, -12, 12);
	ySpd = clamp(ySpd * 0.98, -12, 12);

	// Gun
	// Gun
	if (mouse_check_button_pressed(mb_left)) {
	    audio_play_sound(snd_gunshot, 1, false);

	    var angle = point_direction(x, y, mouse_x, mouse_y);

	    var bulletX = x + lengthdir_x(25, angle);
	    var bulletY = y + lengthdir_y(25, angle);

	    var bullet = instance_create_layer(bulletX, bulletY, "Instances", obj_regular_bullet);

	    bullet.direction = angle;
	    bullet.image_angle = angle; // Rotates bullet sprite to face direction
	    bullet.speed = 12;
	}

	// MAKE SPRINTING ONLY FOR TESTING TURN OFF FOR PRODUCTION
	if keyboard_check(vk_shift) {
		moveSpd = 20;	
	}
	else {
		moveSpd = 5;
	}
}

// If enemy dies, create animation which will restart room
if hp <= 0 {
	audio_play_sound(snd_bigexplosion,1,false);
	instance_create_layer(x, y, "Instances", obj_player_death_restart_level);
	instance_destroy();
}

// Makes it so when not touching enemy damage doesn't happen
if (!place_meeting(x, y, obj_enemy)) {
    damage_timer = 0;
}



//Animation
if (!place_meeting(x,y+1,obj_solid)) {
	if (image_xscale = 1) {
		sprite_index = spr_hero_j;
		image_speed = 0;
			if (sign(ySpd) > 0) image_index = 1; else image_index = 0;
	}
	else if (image_xscale = -1) {
		sprite_index = spr_jump_l;
		image_speed = 0;
			if (sign(ySpd) > 0) image_index = 1; else image_index = 0;
	}
}

else {
		image_speed = 1;
	if (xSpd == 0) {
		if (image_xscale = 1) {
		sprite_index = spr_hero;
		}
		else if (image_xscale = -1) {
			sprite_index = spr_hero_l;
		}
	}
	else if (xSpd > 0) {
		sprite_index = spr_hero_run;
	}
	else if (xSpd < 0) {
			sprite_index = spr_hero_run_l;
	}
}