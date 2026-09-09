function Run_ResetState() {
	global.sanstalk        = 0;
	global.finalstretch    = 0;
	global.sansphase       = 0;
	global.surrender_turn  = false;
	global.surrender_son   = false;
	global.checkornot      = false;
	global.p1sanshp        = false;
	global.p2_revived_pap  = false;
	global.p2_revived_alp  = false;
	global.p25phase        = 0;
	global.p25_dlg         = false;
	global.p25_iska        = false;
	global.p25_t           = 0;
	global.p25_kacis       = 0;
	global.easy_dmg4       = false;
	global.easy_heal_kid   = -1;
	global.easy_final      = false;
	global.no_fullscreen = false;

	Player_SetKr(0);
	Player_SetKrTimer(-1);
}
