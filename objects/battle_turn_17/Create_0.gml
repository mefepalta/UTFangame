_timer=0;
_start=false;
cang=false;
canga=0;

// spear1 dalgasinin salvo sayaci. Moddaki bulletspawn 50'den 25'e indigi
// icin aralik sabit degil; bir sonraki salvonun karesi burada tutuluyor
// (bkz. Spear1Gap). spear0 kullanilmadigi icin onun sayaclari kaldirildi.
s1_next = -1;
s1_n = 0;
s1_ang = 0;

// --- Sari ruh bolumu (turun ilk yarisi) ---
sari_on = false;
sari_t = 0;
sari_son = 1010;		/// son hedef 930'da variyor, kalanin temizlenmesi icin pay

///Turu acar: kutuyu kucuk kareye indirip ruhu sariya cevirir.
SariBasla = function()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(40,40,40,40,45);
	battle_board.angle = 0;
	Battle_SetSoul(battle_soul_yellow_dr);
	Camera_Shake(4,4,3,3);

	sari_on = true;
	sari_t = 0;
};


// --- Kirmizi ruh bolumu (mizrak dalgalari, saridan sonra) ---
// Dalgalar _timer ile degil kendi sayaciyla suruluyor: sari bolum onlerinde
// oldugu icin _timer'in mutlak degerleri kaymis olurdu. kir_t sifirdan
// basladigi icin dalgalarin sayilari oldugu gibi kalabildi.
kir_on = false;
kir_t = 0;

///Sari bolum bitince mizrak dalgalarini baslatir.
KirmiziBasla = function()
{
	kir_on = true;
	kir_t = 0;
};
