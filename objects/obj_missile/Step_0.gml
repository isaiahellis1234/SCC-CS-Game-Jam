if (instance_exists(target)) {
    direction = point_direction(x, y, target.x, target.y);
}
x += lengthdir_x(4, direction);
y += lengthdir_y(4, direction);

if (place_meeting(x, y, obj_player)) {
    with (obj_player) {
        health -= 10;
    }
    instance_destroy();
}
