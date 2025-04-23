// Side collision check
if (bbox_bottom > other.bbox_top + 5) {
    // Knockback
    if (x < other.x) {
        xSpd = -4;
    } else {
        ySpd = 4;
    }
}
