// Each frame, check if player has exited camera view, if so, change room
// (Subject to change, looking into side scrolling)

if (room == Room_Cutscene_0) {
	type_timer++;
	
	if (type_timer >= type_speed) {
		if (char_index_exp1 < string_length(text_exposition1)) {
			audio_play_sound(snd_text,1,false);
			char_index_exp1++;
		} else if (char_index_exp2 < string_length(text_exposition2)) {
			audio_play_sound(snd_text,1,false);
			char_index_exp2++;
		}
		else if (char_index_exp2_2 < string_length(text_exposition2_2)) {
			audio_play_sound(snd_text,1,false);
			char_index_exp2_2++;
		}
		else if (char_index_exp3 < string_length(text_exposition3)) {
			audio_play_sound(snd_text,1,false);
			char_index_exp3++;
		}
		else if (char_index_exp4 < string_length(text_exposition4)) {
			audio_play_sound(snd_text,1,false);
			char_index_exp4++;
		}
		else if (char_index_exp4_2 < string_length(text_exposition4_2)) {
			audio_play_sound(snd_text,1,false);
			char_index_exp4_2++;
		}
		else if (pause_timer_exp < text_pause_exp) {
			pause_timer_exp++;
		} 
		else if (char_index_exp5 < string_length(text_exposition5)) {
				audio_play_sound(snd_text,1,false);
				char_index_exp5++;
			}
			type_timer = 0;
		}
}

if (room == Room_Cutscene_1) {
	type_timer++;

	if (type_timer >= type_speed) {
		if (char_index_one < string_length(text_one)) {
			char_index_one++;
		} else if (char_index_two < string_length(text_two)) {
			char_index_two++;
		}
		type_timer = 0;
	}
}

if (room == Room_Cutscene_Transition_1) {
	type_timer++;

	if (!main_done) {
		if (type_timer >= type_speed) {
			if (char_index_main < string_length(text_main)) {
				char_index_main++;
			} else {
				main_done = true;
			}
			type_timer = 0;
		}
	} else {
		if (pause_timer_two < text_pause_two) {
			pause_timer_two++;
		} else if (type_timer >= type_speed) {
			if (char_index_dots < string_length(text_dotdotdot)) {
				char_index_dots++;
			}
			type_timer = 0;
		}
	}
}


if room == Room1_Prototyping_Area {
	if obj_player.x > room_width {

		if room == Room1_Prototyping_Area {
	
			room_goto(Room2_Prototyping_Area);
	
		}
	}
}

if room == Room2_Prototyping_Area {
	if obj_player.x < 0 {
		room_goto(Room1_Prototyping_Area);	
	}
}

if (room == Room_Boss && alarm[0] <= 0) {
    alarm[0] = 1; // 2 seconds delay before the first spawn
}
if (room != Room_Boss) {
	alarm[0] = -1;	
}

if room == Game_Level_1 {
	if keyboard_check_pressed(ord("P")) {
		with (obj_player) {
			obj_player.x = 170;
			obj_player.y = 600;
		}
	}
}

if room == Game_Level_2 {
	if keyboard_check_pressed(ord("P")) {
		with (obj_player) {
				
		}
	}
}

// RESET PLAYER POSITION MID-GAME
if (room == Room_Boss) {
	if keyboard_check_pressed(ord("P")) {
		with (obj_player) {
			obj_player.x = 225;
			obj_player.y = 580;
		}
	}
}
