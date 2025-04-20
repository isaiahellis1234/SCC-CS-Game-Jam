draw_self(); // Draw sprite first

// Health bar
var bar_width = 100;
var bar_height = 10;
var hp_percent = hp / max_hp;

draw_set_color(c_black);
draw_rectangle(x - 50, y - 60, x + 50, y - 50, false);

draw_set_color(c_red);
draw_rectangle(x - 50, y - 60, x - 50 + bar_width * hp_percent, y - 50, false);
