if (alpha == 0 && fade_in) {
    if (from_left) {
        x = -100;
        dir = 1;
    } else {
        x = room_width + 100;
        dir = -1;
    }
}