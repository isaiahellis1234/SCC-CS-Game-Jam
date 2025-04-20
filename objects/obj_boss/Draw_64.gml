// Show current boss phase
var phase_text = "Phase: " + string(phase);

draw_set_font(fnt1); // or use your own font
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(20, 20, phase_text);
