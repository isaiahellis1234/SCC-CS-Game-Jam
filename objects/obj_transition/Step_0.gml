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
