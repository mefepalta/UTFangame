savefile = working_directory + "save.ini";

show_debug_message("o_save: working_directory = " + working_directory);
show_debug_message("o_save: savefile = " + savefile);

if (file_exists(savefile)) {
    ini_open(savefile);
    global.death_count = ini_read_real("PlayerData", "DeathCount", 0);
    global.phase2_unlocked = (ini_read_real("PlayerData", "Phase2Unlocked", 0) > 0);
    global.checkpoint_enabled = (ini_read_real("PlayerData", "CheckpointEnabled", 0) > 0);
    ini_close();
    show_debug_message("Loaded death_count = " + string(global.death_count));
} else {
    global.death_count = 0;
    global.phase2_unlocked = false;
    global.checkpoint_enabled = false;
    show_debug_message("No save found, starting at 0");
}

// remembers the last written value so the option is only saved when it
// actually changes, instead of hammering the ini file every step
checkpoint_saved = global.checkpoint_enabled;
