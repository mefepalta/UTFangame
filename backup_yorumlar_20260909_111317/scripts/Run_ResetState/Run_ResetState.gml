/// @desc Bir kosunun (run) tur durumunu temizler.
///
/// Bu globaller savas boyunca birikiyor ve HICBIRI kayit bayragi degil, yani
/// Player_Load onlara dokunmuyor. Olum sonrasi sifirlanmazlarsa bir sonraki
/// oynayisa siziyorlar. Bilinen uc ornek:
///   - global.p1sanshp  : room_battle'a girer girmez 125 karelik faz 1 bitis
///                        penceresi aciliyor, faz 1 bir daha oynanamiyor
///   - global.finalstretch : faz 1 sonrasi yorgun poz mantigi yanlis dala giriyor
///   - FLAG_TEMP.KR     : Player_Heal'i HP_MAX-KR ile sinirliyor, esyalar
///                        can vermiyor
///
/// Ayni liste eskiden hem o_menu/Create_0 (StartRun) hem o_gameover_ef icinde
/// ELLE kopyalanmisti ve birbirinden ayrismisti (sansphase sadece birinde
/// vardi). Tek yer olsun diye buraya alindi.
///
/// STATIC/DYNAMIC kayit bayraklarina DOKUNMAZ - onlari cagiran taraf yonetir
/// (menu Flag_Custom ile sifirdan kurar, olum ekrani Player_Load ile geri
/// yukler).
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

	// KR savas ici bir deger; onu azaltan tek sey battle_enemy_engage'in End
	// Step'i, o da savas disinda yok. Kosuyla birlikte sifirlanmali.
	Player_SetKr(0);
	Player_SetKrTimer(-1);
}
