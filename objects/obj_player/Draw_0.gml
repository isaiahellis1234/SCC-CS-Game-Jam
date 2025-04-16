draw_self(); // Draws the player so it doesn't dissapear

if active {
	draw_line(x, y, mx, my)	
}
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