if (room == Room_Cutscene_1) {
	draw_set_font(fnt1);
	draw_set_color(c_white);

	// Only draw part of the string
	draw_text(room_width / 2 - cutscene_one_x_placement, room_height / 2, string_copy(text_one, 1, char_index_one));
	
	if (char_index_one >= string_length(text_one)) {
		draw_text(room_width / 2 - 200, room_height / 2 + 100, string_copy(text_two, 1, char_index_two));
	}
}

if room == Room_Cutscene_Transition_1 {

	draw_set_font(fnt1);
	draw_set_color(c_white);

	draw_text(room_width / 2, room_height / 2, string_copy(text_main, 1, char_index_main));

	if (main_done && pause_timer_two >= text_pause_two) {
		draw_text(room_width / 2, room_height / 2 + 100, string_copy(text_dotdotdot, 1, char_index_dots));
	}

	draw_set_font(fnt2);
	draw_text(10, 10, "Press 'Space' to continue.");

	
	if (keyboard_check_pressed(vk_space)) {
		if (char_index_main == string_length(text_main) && char_index_dots == string_length(text_dotdotdot)) {
			// move to next room
			room_goto_next();
		}
	}
}

if room == Room1_Prototyping_Area {
	draw_set_font(fnt1);
	// World coordinates where you want the text to appear
	var world_x = 400; // X position in the room
	var world_y = 500; // Y position in the room

	// Convert world coordinates to screen coordinates
	var screen_x = world_x - view_xview[0]; // Adjust for the camera's x position
	var screen_y = world_y - view_yview[0]; // Adjust for the camera's y position

	// Set text color and other drawing options
	draw_set_color(c_white);
	draw_text(screen_x, screen_y, "This text stays fixed in the world");
}