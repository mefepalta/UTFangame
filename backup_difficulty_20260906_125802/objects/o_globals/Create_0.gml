global.menu_state = "main";
global.fade_alpha = 0;
global.fullscreen = false;
global.border_enabled = false;
global.window_scale_index = 1;
global.window_scale = 1;
global.no_heal = false;
global.no_hit = false;
global.volume = 1;
global.sanstalk = 0;
global.surrender_turn = false;
global.surrender_son = false;
global.checkornot = false;
global.finalstretch = 0;
global.p1sanshp = false;
global.sansphase = 0;

global.p2_revived_pap = false;
global.p2_revived_alp = false;

global.p25phase = 0;
global.p25_dlg = false;
global.p25_iska = false;
global.p25_t = 0;
global.p25_kacis = 0;

global.p2_anim_hiz = 1;
global.p2_anim_hedef = 1;

global.display_volume = global.volume;

if (!variable_global_exists("death_count")) {
    global.death_count = 0;
}

if (!variable_global_exists("phase2_unlocked")) {
    global.phase2_unlocked = false;
}
if (!variable_global_exists("checkpoint_enabled")) {
    global.checkpoint_enabled = false;
}
if (!variable_global_exists("extras_room")) {
    global.extras_room = noone;
}
