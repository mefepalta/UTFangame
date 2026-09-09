if (!disc_shown) {
    valval++;
    if (valval == 15) room_goto(room_story);
    exit;
}

disc_time++;

if (!disc_leaving) {
    disc_alpha = min(1, disc_alpha + FADE_IN);

    if (disc_alpha >= 1) and (disc_time >= MIN_HOLD) {
        disc_blink++;
        if (Input_IsPressed(INPUT.CONFIRM)) {
            disc_leaving = true;

            ini_open(disc_savefile);
            ini_write_real("PlayerData", "DisclaimerSeen", 1);
            ini_close();
        }
    }
} else {
    disc_alpha = max(0, disc_alpha - FADE_OUT);
    if (disc_alpha <= 0) room_goto(room_story);
}

