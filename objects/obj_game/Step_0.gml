// Each frame, check if player has exited camera view, if so, change room
// (Subject to change, looking into side scrolling)
if obj_player.x > room_width {

	if room == Room1_Prototyping_Area {
	
		room_goto(Room2_Prototyping_Area);
	
	}

}