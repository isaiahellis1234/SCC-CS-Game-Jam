draw_self(); // Draws the player so it doesn't dissapear

if active {
	draw_line(x, y, mx, my)	
}
// Getting bars width and height
var bar_width = 63;
var bar_height = 6;
var bar_x = x - bar_width / 2;
var bar_y = y - sprite_height / 2 - 10;

// Drawing bar
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Drawing health
var hp_ratio = hp / hp_max;
draw_set_color(c_lime);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * hp_ratio), bar_y + bar_height, false);