/// @desc Phase 2 canlandirma sahnesi
// Papyrus ve Alphys olu; Sans ruhlarini geri cagiriyor. Bu nesne o sahneyi
// oynatiyor: muzik susar, ekran kararir, sadece ruh gorunur, sonra patlama
// ile karakter belirir.
//
// Metinden {revive 1} (Papyrus) veya {revive 2} (Alphys) ile tetiklenir.

depth = -9000000;
// visible = false yapilamaz: GameMaker o zaman Draw event'lerini de calistirmaz.
// Onun yerine sprite'i kaldirip ciziimi tamamen Draw_75'e birakiyoruz.
visible = true;
sprite_index = -1;

active = false;
who = 0;			// 1 = Papyrus, 2 = Alphys
t = 0;

// --- zaman cizelgesi (kare cinsinden, 60 fps) ---
T_BLACK   = 22;		// ekranin kararmasi
T_SOUL    = 70;		// ruhun belirmesi
T_HOLD    = 112;	// ruh sabit bekler
T_GLITCH  = 126;	// sarsinti
T_BURST   = 158;	// isinlar ve buyuyen daire
T_FLASH   = 174;	// tam beyaz
T_END     = 210;	// karakter yerinde, ekran acilir

// --- ciziim durumu ---
soul_x = 320;
soul_y = 300;
soul_alpha = 0;
soul_bright = 0;	// 0 = koyu gri, 1 = bembeyaz
soul_scale = 1;
soul_shake_x = 0;
soul_shake_y = 0;

black_alpha = 0;
flash_alpha = 0;
beam_alpha = 0;
beam_len = 0;
beam_n = 6;
beam_spin = 0;
circle_r = 0;

// --- kalp parcalari (spr_battle_soul_slice_white) ---
// Ruh dogrudan belirmiyor: parcalar ekranin cesitli yerlerinden gelip
// ruhun yerinde birlesiyor ve kalp oradan olusuyor.
PIECE_N = 7;
piece_p = 0;					// 0..1 birlesme ilerlemesi
piece_ox = array_create(PIECE_N,0);		// ruh noktasina gore baslangic ofseti
piece_oy = array_create(PIECE_N,0);
piece_ang = array_create(PIECE_N,0);
piece_spin = array_create(PIECE_N,0);
piece_img = array_create(PIECE_N,0);
piece_delay = array_create(PIECE_N,0);	// her parca birazcik farkli anda yola cikar

// Patlamada ayni noktadan savrulup dusen parcalar
DEBRIS_N = 4;
debris_on = false;
debris_alpha = 0;
deb_x = array_create(DEBRIS_N,0);
deb_y = array_create(DEBRIS_N,0);
deb_hs = array_create(DEBRIS_N,0);
deb_vs = array_create(DEBRIS_N,0);
deb_ang = array_create(DEBRIS_N,0);
deb_spin = array_create(DEBRIS_N,0);
deb_img = array_create(DEBRIS_N,0);

// Karakter belirdikten sonra uzerinde buyuyup saydamlasan beyaz daire
ring_r = 0;
ring_alpha = 0;

/// Sahneyi baslatir. WHO: 1 = Papyrus, 2 = Alphys
start = function(_who)
{
	if (active) { return; }
	active = true;
	who = _who;
	t = 0;
	soul_alpha = 0;
	soul_bright = 0;
	soul_scale = 1;
	black_alpha = 0;
	flash_alpha = 0;
	beam_alpha = 0;
	beam_len = 0;
	circle_r = 0;
	beam_spin = random(360);
	piece_p = 0;
	debris_on = false;
	debris_alpha = 0;
	ring_r = 0;
	ring_alpha = 0;

	// Parcalari ekranin cevresine dagit. Konumlar ruh noktasina GORE ofset
	// olarak tutuluyor; ruhun gercek yeri T_BLACK'te belli oluyor.
	for (var i = 0; i < PIECE_N; i++)
	{
		var _a = (i/PIECE_N)*360 + random_range(-24,24);
		var _d = random_range(280,440);
		piece_ox[i] = lengthdir_x(_d,_a);
		piece_oy[i] = lengthdir_y(_d,_a);
		piece_ang[i] = random(360);
		piece_spin[i] = random_range(-7,7);
		piece_img[i] = irandom(sprite_get_number(spr_battle_soul_slice_white)-1);
		piece_delay[i] = random(0.22);
	}

	// Sahne karakter basina yalnizca bir kez oynar. Yarida kesilse bile
	// tekrarlamasin diye bayragi hemen basta koyuyoruz.
	if (who == 1) { global.p2_revived_pap = true; } else { global.p2_revived_alp = true; }

	// NOT: kadro yerlestirmesi burada YAPILMIYOR. Sahneye kaydetmek hizalamayi
	// aninda degistiriyor ve Sans daha ekran kararmadan, kutu bosken yana
	// kayiyordu. Yerlestirme ekran tamamen karardiginda (T_BLACK) yapiliyor.

	// Muzigi sustur (hem BGM slotu hem dogrudan calan parca icin)
	audio_pause_all();
};
