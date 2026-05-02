// Global menu variables
global.menu_state = "main";    // "main" or "options"
global.fade_alpha = 0;         // Fade effect alpha
global.fullscreen = false;
global.no_heal = false;
global.no_hit = false;
global.volume = 1;             // Actual game volume
global.sanstalk = 0;
global.checkornot = false;
global.finalstretch = 0;
global.p1sanshp = false;
global.sansphase = 0;

// For smooth volume slider animation
global.display_volume = global.volume;

if (!variable_global_exists("death_count")) {
    global.death_count = 0;
}