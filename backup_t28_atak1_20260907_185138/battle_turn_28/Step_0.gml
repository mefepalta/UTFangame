// Bu tur sadece faz 2'de (room_battle_1) ve sadece EASY listesinden geliyor.
// Yanlislikla baska bir yerde yaratilirsa turu hemen bitir, yoksa dovus kilitlenir.
if (room != room_battle_1)
{
	if (_timer >= 2) { Battle_EndTurn(); }
	exit;
}

// ---------------------------------------------------------------------------
// BOLUM 1 (50-240) -- DONEN YERCEKIMI
//
// Yercekimi asagi -> saga -> yukari -> sola donuyor. Her yonde o kenardan bir
// kemik targi buyuyor ve uclarina platform konuyor: oyuncunun yeni zemini o.
// Onceki targlar yerinde kaliyor, oda giderek "+" seklinde bir koridora
// kapaniyor (kutu 150x150, targ boylari 70/66/62/60 -> ortada 18x24'luk bosluk).
// ---------------------------------------------------------------------------

if (_timer == 50)
{
	instance_create_depth(0,0,0,battle_soul_blue_effect);
	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = battle_board.x;
	battle_soul.y = T28Y(0.30);
	Yercekimi(DIR.DOWN);
	DuvarDip(70,24,1000);
}
if (_timer ==  74) { Zemin(DIR.DOWN,70);  }

if (_timer == 106) { Yercekimi(DIR.RIGHT); DuvarSag(66,18,1000); }
if (_timer == 124) { Zemin(DIR.RIGHT,66); }

if (_timer == 146) { Yercekimi(DIR.UP);    DuvarTep(62,18,1000); }
if (_timer == 164) { Zemin(DIR.UP,62);    }

if (_timer == 186) { Yercekimi(DIR.LEFT);  DuvarSol(60,18,1000); }
if (_timer == 204) { Zemin(DIR.LEFT,60);  }

// Oda tek karede bosaliyor. Yercekimi SOLDA kaliyor: bundan sonra zemin
// tahtanin sol kenari, platforma gerek yok.
if (_timer == 236) { Temizle(false); }

// ---------------------------------------------------------------------------
// BOLUM 2 (242-500) -- SOL DUVAR ZEMIN, DONEN KEMIKLER
//
// Ruh sol kenarda duruyor, dikey kosuyor, saga zipliyor. Tepe/dip targlari
// pistin iki ucu; ortadaki yatay kemik yigini pisti ikiye boluyor.
// ---------------------------------------------------------------------------

if (_timer == 242)
{
	DuvarTep(20,12,278);
	DuvarDip(24,12,278);
}

if (_timer == 254)
{
	bariyer = [];
	for (var _i = 0; _i < 4; _i++)
	{
		array_push(bariyer,YatayKemik(T28Y(0.34)+_i*5,T28Gen(),0));
	}
}

// Donen capraz kemik ciftleri: ust ve alt odaciktan gecip gidiyorlar.
if (_timer == 274) { CaprazX(T28Y(0.23),2.2); CaprazX(T28Y(0.68),2.2); }
if (_timer == 298) { CaprazX(T28Y(0.70),2.4); }
if (_timer == 322) { CaprazX(T28Y(0.21),2.4); CaprazX(T28Y(0.72),2.4); }

// Odayi bastan basa supuren uzun donen kemikler.
if (_timer == 350) { UzunDonen(T28Sag()+70,-2.2,-1.4); }
if (_timer == 378) { UzunDonen(T28Sol()-70, 2.2, 1.4); }

// Mavi/turuncu bant: bariyerin en usttekiyle en alttaki beyaz kemik gidiyor,
// yerlerine sol kenara civili renkli kemikler geliyor.
if (_timer == 394)
{
	if (instance_exists(bariyer[0])) { instance_destroy(bariyer[0]); }
	if (instance_exists(bariyer[3])) { instance_destroy(bariyer[3]); }
	bant_mavi    = BantKemik(T28Y(0.34)-6,1);
	bant_turuncu = BantKemik(T28Y(0.34)+21,2);
}

// Bant sol uctan makas gibi aciliyor: turuncu tavana, mavi zemine dogru.
if (_timer == 434)
{
	if (instance_exists(bant_mavi))    { bant_mavi._angle_speed    = -0.55; }
	if (instance_exists(bant_turuncu)) { bant_turuncu._angle_speed =  0.55; }
	audio_play_sound(snd_bonewall,2,false);
}

if (_timer == 458)
{
	if (instance_exists(bant_mavi))    { instance_destroy(bant_mavi);    }
	if (instance_exists(bant_turuncu)) { instance_destroy(bant_turuncu); }
	if (instance_exists(bariyer[1]))   { instance_destroy(bariyer[1]);   }
	bant_mavi = noone;
	bant_turuncu = noone;
}

if (_timer == 482) { UzunDonen(T28Sag()+70,-2.4,-1.6); }

// ---------------------------------------------------------------------------
// BOLUM 3 (500-736) -- ZEMINDEN YUKSELEN KEMIKLER
//
// Yercekimi hala solda. Sol duvardan (zeminden) kemikler yukselip iniyor,
// oyuncu ya araligi buluyor ya da uzerinden saga zipliyor. Sag ucta sabit bir
// dikey kemik "tavan" olarak duruyor, pist daralyor.
// ---------------------------------------------------------------------------

if (_timer == 500)
{
	if (instance_exists(bariyer[2])) { instance_destroy(bariyer[2]); }
}

if (_timer == 514)
{
	DikeyKemik(T28X(0.70),T28Yuk(),0);
	audio_play_sound(snd_bonewall,2,false);
}

if (_timer == 520)
{
	DuvarTep(30,12,206);
	DuvarDip(52,12,206);
}

// Pist: T28Y(0.20) ile T28Y(0.65) arasi.
if (_timer == 586) { ZeminKemik(T28Y(0.37),44,46); }
if (_timer == 612) { ZeminKemik(T28Y(0.54),44,46); }
if (_timer == 638) { ZeminKemik(T28Y(0.26),48,46); }
if (_timer == 664) { ZeminKemik(T28Y(0.60),48,46); }
if (_timer == 690) { ZeminKemik(T28Y(0.29),48,46); ZeminKemik(T28Y(0.52),48,46); }
if (_timer == 712)
{
	ZeminKemik(T28Y(0.24),54,50);
	ZeminKemik(T28Y(0.42),54,50);
	ZeminKemik(T28Y(0.60),54,50);
}

// ---------------------------------------------------------------------------
// BOLUM 4 (736-930) -- KIRMIZI RUH, TURUNCU/MAVI MERDIVEN
//
// Yercekimi kalkiyor, kutu dar bir yatay koridora donuyor. Iki yandan renkli
// kemik ciftleri geliyor; aralarindaki bosluk sinus cizerek gezindigi icin
// oyuncu koridorda yukari asagi kayarak geciyor.
// ---------------------------------------------------------------------------

if (_timer == 736)
{
	Temizle(false);
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Battle_SetSoul(battle_soul_red);
	battle_soul.x = T28X(0.16);
	battle_soul.y = T28Y(0.40);
	DuvarTep(46,14,340);
	DuvarDip(46,14,340);
}

if (_timer == 786) { MerdivenKemik(false,T28Y(0.38),0,4.2); }
if (_timer == 806) { MerdivenKemik(true, T28Y(0.58),0,4.2); }

if (_timer >= 824) and (_timer <= 918)
{
	if ((_timer-824) % 6 == 0)
	{
		var _k   = (_timer-824) div 6;
		var _sag = ((_k % 2) == 0);
		var _ren = (((_k div 2) % 2) == 0) ? 1 : 2;
		var _gy  = T28Y(0.48)+20*dsin(_k*44);
		MerdivenKemik(_sag,_gy-32,_ren,3.4);
		MerdivenKemik(_sag,_gy+32,_ren,3.4);
	}
}

// ---------------------------------------------------------------------------
// BOLUM 5 (900-1030) -- BLASTER FINALI
//
// Cagirmadan ~62 kare sonra isin cikiyor: 900 -> "+" 962'de, 930 -> "X"
// 992'de. Koridor targlari duruyor, guvenli yer kenarlar.
// ---------------------------------------------------------------------------

if (_timer == 900) { ArtiBlaster();  }
if (_timer == 930) { CarpiBlaster(); }

if (_timer == 1040)
{
	with (battle_gasterblaster)      { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
}

// ---------------------------------------------------------------------------
// KAPANIS
// ---------------------------------------------------------------------------

if (_timer == 1076)
{
	Temizle(true);
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* Papyrus is enjoying this.");
	Battle_EndTurn();
}
