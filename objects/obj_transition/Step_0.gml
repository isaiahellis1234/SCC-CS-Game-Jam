// Use after obj_player touches the obj_transition_obj
// It goes to the next room

if (fading_out) {
    transition_alpha += transition_speed;
    if (transition_alpha >= 1) {
        transition_alpha = 1;
        room_goto_next();
        fading_out = false; // Now fade back in
    }
} else {
    transition_alpha -= transition_speed;
    if (transition_alpha <= 0) {
        instance_destroy(); // Done transitioning
    }
}
