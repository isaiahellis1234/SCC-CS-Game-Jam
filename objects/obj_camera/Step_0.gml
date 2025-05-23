// Fullscreen toggle
if keyboard_check_pressed(vk_f11) {

	window_set_fullscreen(!window_get_fullscreen());

}

// Exit if there is no player
if !instance_exists(obj_player) exit;

// Get camera size
var camWidth = camera_get_view_width(view_camera[0]);
var camHeight = camera_get_view_height(view_camera[0]);

// Get camera target coords
var camX = obj_player.x - camWidth / 2;
var camY = obj_player.y - camHeight / 2;

// Constrain camera to room borders
camX = clamp(camX, 0, room_width - camWidth);
camY = clamp(camY, 0, room_height - camHeight);

// Set camera coordinate variables
finalCamX += (camX - finalCamX) * camTrailSpd;
finalCamY += (camY - finalCamY) * camTrailSpd;

// Set camera coords
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

