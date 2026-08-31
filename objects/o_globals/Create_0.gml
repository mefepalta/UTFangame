// Global menu variables
global.menu_state = "main";    // "main" or "options"
global.fade_alpha = 0;         // Fade effect alpha
global.fullscreen = false;
global.border_enabled = false;
global.window_scale_index = 1;
global.window_scale = 1;
global.no_heal = false;
global.no_hit = false;
global.volume = 1;             // Actual game volume
global.sanstalk = 0;
global.surrender_turn = false;
global.surrender_son = false;	/// dovus teslim yoluyla mi bitti (overworld konusmasini secer)	/// bu tur Surrender ACT'tan mi geldi (bkz. scripts/Surrender)
global.checkornot = false;
global.finalstretch = 0;
global.p1sanshp = false;
global.sansphase = 0;

// Phase 2 canlandirma sahnesi karakter basina yalnizca bir kez oynar.
// Yeni bir savas baslarken battle_enemy_engage bunlari sifirliyor.
global.p2_revived_pap = false;
global.p2_revived_alp = false;

// FINAL PHASE (P25) sahne durumu. Ayrintili aciklama scripts/P25'te.
//   0 kapali | 1 Sans hasar alabilir | 2 turlar | 3 sahte iskalama repligi
//   4 son vurus bekleniyor | 5 olum konusmasi | 6 CHECK/MERCY/son FIGHT
//   7 veda konusmasi | 8 ekrandan cikis | 9 bitti
global.p25phase = 0;
global.p25_dlg = false;		/// olum sahnesinin balonu acildi mi
global.p25_iska = false;	/// sahte iskalama kullanildi mi
global.p25_t = 0;			/// sahne ici kare sayaci
global.p25_kacis = 0;		/// sahte iskalamada Sans'in yatay kacisi (px)

// Faz 2 Sans'inin bosta durma animasyon temposu (bkz.
// battle_enemy_engage/Step_0). 1 = normal, 0.2 = final faz temposu.
global.p2_anim_hiz = 1;
global.p2_anim_hedef = 1;

// For smooth volume slider animation
global.display_volume = global.volume;

if (!variable_global_exists("death_count")) {
    global.death_count = 0;
}
