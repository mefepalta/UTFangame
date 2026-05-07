// Begin Step event - from_left artık doğru değerde
if (alpha == 0 && fade_in) {
    // İlk frame'de pozisyonu ayarla
    if (from_left) {
        x = -100;
        dir = 1;
    } else {
        x = room_width + 100;
        dir = -1;
    }
}