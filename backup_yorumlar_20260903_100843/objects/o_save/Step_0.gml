// o_save -> Step Event (testing shortcuts)
if (keyboard_check_pressed(ord("S"))) {
    ini_open(savefile);
    ini_write_real("PlayerData", "DeathCount", global.death_count);
    ini_close();
    show_debug_message("Saved death_count = " + string(global.death_count) + " -> " + savefile);
}

if (keyboard_check_pressed(ord("L"))) {
    if (file_exists(savefile)) {
        ini_open(savefile);
        global.death_count = ini_read_real("PlayerData", "DeathCount", 0);
        ini_close();
        show_debug_message("Loaded death_count = " + string(global.death_count));
    } else {
        show_debug_message("Load failed: file not found at " + savefile);
    }
}
