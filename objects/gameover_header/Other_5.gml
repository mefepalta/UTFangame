global.death_count += 1;

ini_open("save.ini");
ini_write_real("PlayerData", "DeathCount", global.death_count);
ini_close();
