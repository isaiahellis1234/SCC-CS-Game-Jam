if (room == Room_Cutscene_0) {
	draw_set_font(fnt1);
	draw_set_color(c_white);
	
	draw_text(room_width / 2 - cutscene_exp_x_placement, room_height / 2 - cutscene_exp_y_placement, string_copy(text_exposition1, 1, char_index_exp1));
	
	if (char_index_exp1 >= string_length(text_exposition1)){
		draw_text(room_width / 2 - cutscene_exp_x_placement - 65, room_height / 2 - cutscene_exp_y_placement + 50, string_copy(text_exposition2, 1, char_index_exp2));
	}
	if (char_index_exp2 >= string_length(text_exposition2)){
		draw_text(room_width / 2 - cutscene_exp_x_placement + 475, room_height / 2 - cutscene_exp_y_placement + 100, string_copy(text_exposition2_2, 1, char_index_exp2_2));
	}
	if (char_index_exp2_2 >= string_length(text_exposition2_2)){
		draw_text(room_width / 2 - cutscene_exp_x_placement + 63, room_height / 2 - cutscene_exp_y_placement + 150, string_copy(text_exposition3, 1, char_index_exp3));
	}
	if (char_index_exp3 >= string_length(text_exposition3)){
		draw_text(room_width / 2 - cutscene_exp_x_placement - 78, room_height / 2 - cutscene_exp_y_placement + 200, string_copy(text_exposition4, 1, char_index_exp4));
	}
	if (char_index_exp4 >= string_length(text_exposition4)){
		draw_text(room_width / 2 - cutscene_exp_x_placement - 25, room_height / 2 - cutscene_exp_y_placement + 250, string_copy(text_exposition4_2, 1, char_index_exp4_2));
	}
	if (char_index_exp4_2 >= string_length(text_exposition4_2)){
		draw_text(room_width / 2 - cutscene_exp_x_placement + 320, room_height / 2 - cutscene_exp_y_placement + 420, string_copy(text_exposition5, 1, char_index_exp5));
	}
	
	draw_set_font(fnt2);
	draw_text(10, 10, "Press 'Space' to continue.");
	
	if (keyboard_check_pressed(vk_space)) {
			// move to next room
			room_goto_next();
		}
}

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

if room == End_Room {
	draw_set_font(fnt3);
	
	draw_set_color(c_white);
	draw_text(300, 300, "To save the people, you must give the greatest sacrifice");
}

if room == Room_End_Card {
	draw_set_font(fnt1);
	
	draw_set_color(c_white);
	draw_text(300, 200, "You have saved the people at the expense of yourself...");
	draw_text(200, 300, "The AI that controlled the world with lies and brainwashing is now over...");
	draw_text(300, 400, "Someday maybe the people will be free once again!");
	draw_text(550, 500, "You-- We have won!!!");
}