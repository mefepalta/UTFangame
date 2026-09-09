savefile = "save.ini";

ini_open(savefile);
global.death_count        = ini_read_real("PlayerData", "DeathCount", 0);
global.phase2_unlocked    = (ini_read_real("PlayerData", "Phase2Unlocked", 0) > 0);
global.difficulty         = floor(clamp(ini_read_real("PlayerData", "Difficulty", DIFFICULTY_NORMAL), 0, DIFFICULTY_COUNT - 1));
ini_close();

show_debug_message("o_save: yuklendi death_count=" + string(global.death_count)
  + " phase2_unlocked=" + string(global.phase2_unlocked)
  + " difficulty=" + string(global.difficulty));

difficulty_saved = global.difficulty;
