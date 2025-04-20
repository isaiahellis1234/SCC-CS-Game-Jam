x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

if (place_meeting(x, y, obj_player)) {
    with (obj_player) {
        hp -= 5;
    }
    instance_destroy();
}
