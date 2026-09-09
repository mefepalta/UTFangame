// DIKKAT: burasi save.ini'nin TEK okuyucusu, ama yazanlar
// (battle_enemy_engage -> Phase2Unlocked, gameover_header ve o_globals ->
// DeathCount) hep sade "save.ini" kullaniyor. Sade ad, GameMaker'in kayit
// alanina (%APPDATA%\TMLCookie_Edit\) gidiyor; working_directory ise sandbox
// kapali oldugu icin OYUN KLASORUNU gosteriyor. Ikisi ayni dosya degil:
// eskiden burasi oyun klasorune bakiyordu, orada dosya hic olusmuyordu ve
// her acilista phase2_unlocked / death_count / checkpoint_enabled sifirlaniyordu
// (Extras'ta "BEAT PHASE 1 TO UNLOCK" hic gecmiyordu).
// Yazanlarla ayni cozumleme kullanilmali.
savefile = "save.ini";

// file_exists goreli yolu ini_open ile ayni sekilde cozmeyebilir; guard yerine
// dogrudan ini_open + varsayilan deger kullaniliyor. Olmayan dosyada
// ini_read_real varsayilani doner, davranis ayni.
ini_open(savefile);
global.death_count        = ini_read_real("PlayerData", "DeathCount", 0);
global.phase2_unlocked    = (ini_read_real("PlayerData", "Phase2Unlocked", 0) > 0);
global.checkpoint_enabled = (ini_read_real("PlayerData", "CheckpointEnabled", 0) > 0);
ini_close();

show_debug_message("o_save: yuklendi death_count=" + string(global.death_count)
  + " phase2_unlocked=" + string(global.phase2_unlocked)
  + " checkpoint=" + string(global.checkpoint_enabled));

// remembers the last written value so the option is only saved when it
// actually changes, instead of hammering the ini file every step
checkpoint_saved = global.checkpoint_enabled;
