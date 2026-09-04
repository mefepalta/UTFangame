// o_save -> Create Event
// store the save path as an instance var so we can reuse it
savefile = working_directory + "save.ini";

// debug: show where we're reading/writing
show_debug_message("o_save: working_directory = " + working_directory);
show_debug_message("o_save: savefile = " + savefile);

if (file_exists(savefile)) {
    ini_open(savefile);
    global.death_count = ini_read_real("PlayerData", "DeathCount", 0);
    ini_close();
    show_debug_message("Loaded death_count = " + string(global.death_count));
} else {
    global.death_count = 0;
    show_debug_message("No save found, starting at 0");
}
