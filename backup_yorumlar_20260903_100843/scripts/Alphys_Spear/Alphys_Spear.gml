///@desc Alphys'in kirmizi ruh mizrak dalgalari.
///
///Unitale modu "Alphys Alpha"nin Lua/Waves klasorunden BIREBIR aktarildi.
///Ozgun lua: Jetrocketboy, Crystalwarrior ve Moofins21; animasyon
///BOBtheman2000. Sprite ve sesler de o modun icinden geliyor.
///
///=== KARE HIZI ===
///Moddaki degerler DOGRUDAN kullaniliyor: hem kare basina mesafeler hem
///kare sayaclari lua'daki haliyle. Once Unitale 30 FPS sanilip hepsi
///yariya indirilmisti, ama oyunda ataklar belirgin sekilde yavas kaliyordu.
///Her degerin yanindaki yorum moddaki karsiligini gosteriyor; artik
///degerle yorum birebir ayni olmali.
///
///=== KOORDINAT ===
///Unitale'de orijin arenanin merkezi ve y YUKARI artiyor. GameMaker'da y
///asagi artiyor, merkez de battle_board. Donusum:
///   gm_x = battle_board.x + u_x        gm_y = battle_board.y - u_y
///
///=== HASAR ===
///Modda her dalga Player.Hurt(12) diyor. Bu oyunun can olcegi farkli
///oldugu icin hasar projenin kendi yolundan gidiyor (o_alphys_bolt ile
///ayni: Other_10 -> Player_Hurt(3)). Bilincli tek sapma bu.

#macro SPEAR_THRUST 0
#macro SPEAR_SPIRAL 1
#macro SPEAR_DIVE 2
#macro SPEAR_AIM 3


///Dalganin arenasini kurar. Modda her dosyanin basinda Arena.resize var;
///oradaki olculer TAM genislik/yukseklik, bizim kutu ise yari-olcu
///tuttugu icin ikiye bolunuyor.
///@arg wave					4 = spear4, 5 = spear5, 3 = spear3,
///							41 = hardspear4, digeri = spear0/1/2
///@arg time*				kutu animasyonunun suresi (varsayilan 40)
function SpearArena(_wave)
{
	var _time = 40;
	if (argument_count >= 2) { _time = argument[1]; }

	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");

	if (_wave == 4)
	{
		// Arena.resize(75,100)
		Battle_SetBoardSizeCubic(50,50,37.5,37.5,_time);
	}
	else if (_wave == 5)
	{
		// Arena.resize(300,75)
		Battle_SetBoardSizeCubic(37.5,37.5,150,150,_time);
	}
	else if (_wave == 3)
	{
		// Arena.resize(150,150)
		Battle_SetBoardSizeCubic(75,75,75,75,_time);
	}
	else if (_wave == 41)
	{
		// hardspear4: Arena.resize(115,100)
		Battle_SetBoardSizeCubic(50,50,57.5,57.5,_time);
	}
	else
	{
		// Arena.resize(565,330). Yukseklik moddaki gibi 325 px, ama simetrik
		// degil: alt kenar 385'te sabit tutuldu (varsayilan kutuyla ayni), fark
		// yukari eklendi. down=160 iken alt kenar 480'e iniyor ve can cubugunu
		// (battle_ui y=401) tamamen ortuyordu.
		Battle_SetBoardSizeCubic(260,65,282.5,282.5,_time);
	}
}


///spear4 -- ASAGIDAN YUKARI SANCAN MIZRAK
///Mod: 26 karede bir, uc seritten (-25/0/25) rastgele birinde, arenanin
///altinda (y = -68) bir mizrak doguyor. 60 karelik "firing" sayaci boyunca
///0.3 px/kare yukari kayip (en fazla 10 px) ve alfasi 0.05/kare artarak
///bekliyor; sayac bitince 'pierce' calip 5 px/kare yukari sanciyor.
///y > 15 olunca DURUYOR ve 2/40 alfa/kare ile soniyor. Hasar sadece
///alfa 0.9 ustundeyken.
///@arg lane*				0/1/2 serit; verilmezse rastgele
function Spear4()
{
	var _lane = irandom(2);
	if (argument_count >= 1) { _lane = argument[0]; }

	var _s = instance_create_depth(battle_board.x+(-25+_lane*25),battle_board.y+68,
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_s.kind = SPEAR_THRUST;
	_s.dir = 90;				/// yukari
	_s.warn_time = 60;			/// mod 60
	_s.drift = 0.3;			/// mod 0.3
	_s.drift_max = 10;			/// mod: y en fazla -58'e cikiyor
	_s.fade_in = 0.05;			/// mod 0.05
	_s.spd = 5;				/// mod 5
	_s.run_len = 73;			/// -58'den 15'e
	_s.run_stop = true;			/// spear4 durup soner
	_s.fade_out = 0.05;		/// mod 2/40
	_s.dmg_alpha = 0.9;			/// mod: OnHit'te alpha > 0.9 kosulu
	audio_play_sound(snd_spear_spawn,0,false);
	return _s;
}


///spear5 -- IKI YANDAN SANCAN MIZRAKLAR
///Mod: 45 karede bir SOL ve SAG ayni anda birer mizrak doguruyor, her biri
///uc seritten (-25/0/25) rastgele birinde. Sol mizrak x = -177'de, sag
///mizrak x = 181'de basliyor. 60 karelik sayacta 0.3 px/kare iceri kayiyor.
///spear4'un aksine ALFA ANIMASYONU YOK, mizrak bastan opak. Sayac bitince
///8 px/kare karsiya geciyor ve |x| > 70'i asinca 4/40 alfa/kare ile
///SONERKEN YOLUNA DEVAM EDIYOR. OnHit'te alfa kosulu yok.
function Spear5()
{
	var _luy = [-25,0,25];

	// --- soldaki, saga gidiyor ---
	var _a = instance_create_depth(battle_board.x-177,battle_board.y-_luy[irandom(2)],
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_a.kind = SPEAR_THRUST;
	_a.dir = 0;
	_a.warn_time = 60;			/// mod 60
	_a.drift = 0.3;			/// mod 0.3
	_a.drift_max = 0;			/// modda sinir fiilen devreye girmiyor
	_a.fade_in = 0;				/// bastan opak
	_a.spd = 8;					/// mod 8
	_a.run_len = 229;			/// -159'dan 70'e
	_a.run_stop = false;		/// sonerken devam ediyor
	_a.fade_out = 0.1;			/// mod 4/40
	_a.dmg_alpha = 0.05;		/// modda alfa kosulu yok

	// --- sagdaki, sola gidiyor ---
	var _b = instance_create_depth(battle_board.x+181,battle_board.y-_luy[irandom(2)],
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_b.kind = SPEAR_THRUST;
	_b.dir = 180;
	_b.warn_time = 60;
	_b.drift = 0.3;
	_b.drift_max = 0;
	_b.fade_in = 0;
	_b.spd = 8;
	_b.run_len = 233;			/// 163'ten -70'e
	_b.run_stop = false;
	_b.fade_out = 0.1;
	_b.dmg_alpha = 0.05;

	audio_play_sound(snd_spear_spawn,0,false);
}


///spear2 -- ICINE KAPANAN SPIRAL HALKA
///Mod: 70 karede bir, kalbin O ANKI konumunu merkez alan 180 px yaricapli
///bir halka doguyor. Donus yonu rastgele. Her kare aci "rad" kadar
///ilerliyor; rad 2.35'ten baslayip ticker (+0.015/kare) ile 1'e kadar
///soniyor. Ayni anda yaricap 1.2/kare azaliyor, yani halka donerken ice
///kapaniyor. Yaricap sifira inince 5/40 alfa/kare ile soniyor. Hasar
///alfa 0.9 ustunde.
///NOT: mod "for i = 0, 7" ile sekiz mermi uretip aciyi 360/7 ile boluyor,
///yani i=0 ile i=7 ayni yere dusuyor. Birebir aktarim icin o da korundu.
///@arg dir*				1 veya -1; verilmezse rastgele
///@arg hard*				true ise hardspear2 (yaricap 1.2 yerine 1 azaliyor)
function Spear2()
{
	var _d = (irandom(1) == 0) ? 1 : -1;
	if (argument_count >= 1) { _d = argument[0]; }
	var _hard = false;
	if (argument_count >= 2) { _hard = argument[1]; }

	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul))
	{
		_cx = battle_soul.x;
		_cy = battle_soul.y;
	}

	for (var _i = 0; _i <= 7; _i++)
	{
		var _a = _i*360/7;
		var _s = instance_create_depth(_cx+lengthdir_x(180,_a),_cy+lengthdir_y(180,_a),
			DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
		_s.kind = SPEAR_SPIRAL;
		_s.orb_x = _cx;
		_s.orb_y = _cy;
		_s.orb_rad = 180;
		_s.orb_shrink = _hard ? 1 : 1.2;	/// mod 1 / 1.2
		_s.ang = _a;
		_s.ang_step = 2.35;	/// mod 2.35
		_s.ang_floor = 1;		/// mod 1
		_s.ang_tick = 0.015;	/// mod 0.015
		_s.orb_dir = _d;
		_s.fade_in = 0.05;		/// mod 0.05
		_s.fade_out = 0.125;	/// mod 5/40
		_s.dmg_alpha = 0.9;
		_s.dir = _a+180;
	}
}


///spear2'nin oyuncuya verdigi hiz takviyesi.
///Mod bu dalga boyunca Player.SetControlOverride ile kalbi 3 px/kare
///hareket ettiriyor, yani normalin ustunde. Spiral bu olmadan
///kacilamiyor. Bizde toplam 4.5 px/kare: 6 denendi, kalp asiri hizli oluyordu.
///@arg on					true = takviye acik, false = normale don
function Spear2Speed(_on)
{
	if (_on)
	{
		Battle_SetPlayerTempSpd(3.6-Player_GetSpd()-Player_GetSpdItem());
	}
	else
	{
		Battle_SetPlayerTempSpd(0);
	}
}


///spear0 -- UZAKTAN DALAN MIZRAKLAR
///Mod: her salvoda iki mermi uretiyor ama ikisi de AYNI aciya dusuyor
///(bulletcount 1 iken "for i = 0, 1" ve aci 2*pi*i/1). Birebir aktarim
///icin bu da korundu; mizragin daha kalin gorunmesinin sebebi bu.
///Aci her salvoda 45 derece kayiyor.
///Dogus mesafesi bulletspeed*bulletdistance = 5*150 = 750 px. Mermi
///lifetime -150'den basliyor ve 5/kare artiyor; sifira gelene kadar
///kimildamiyor (30 kare), sonra 5 px/kare kalbe geliyor. 637.5'te
///sonmeye basliyor, 825'te siliniyor.
///Salvo araligi cagiran tarafta: bkz. Spear0Gap.
///@arg addAngle			salvonun acisi (derece)
///@arg hard*				true ise hardspear0 (hiz 5.5, mesafe 140)
function Spear0(_addAngle)
{
	var _hard = false;
	if (argument_count >= 2) { _hard = argument[1]; }
	var _bs = _hard ? 5.5 : 5;		/// bulletspeed
	var _bd = _hard ? 140 : 150;	/// bulletdistance

	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul))
	{
		_cx = battle_soul.x;
		_cy = battle_soul.y;
	}

	repeat(2)
	{
		var _s = instance_create_depth(_cx+lengthdir_x(_bs*_bd,_addAngle),_cy+lengthdir_y(_bs*_bd,_addAngle),
			DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
		_s.kind = SPEAR_DIVE;
		_s.dir = _addAngle+180;		/// kalbe dogru
		_s.spd = _bs;				/// mod bulletspeed
		_s.dive_life = -150;
		_s.dive_step = _bs;
		_s.dive_fade = 0.85*_bd*_bs;
		_s.dive_kill = 1.10*_bd*_bs;
		_s.fade_in = 1;				/// modda alfa animasyonu yok, bastan opak
		_s.fade_out = 0.05;		/// mod 2/40
		_s.dmg_alpha = 0.05;		/// modda alfa kosulu yok
	}
}


///spear0'in salvo araligi (kare).
///Mod: spawntimer her kare 3 artiyor ve bulletspawn'a ulasinca ates
///ediliyor; bulletspawn 50'den basliyor, her salvoda 4 azaliyor, 20'de
///duruyor. Yani mod-kare cinsinden aralik ceil(bulletspawn/3), bizde
///moddakiyle ayni. Pattern boyle kendi kendine hizlaniyor.
///@arg n					kacinci salvo (0'dan baslar)
function Spear0Gap(_n)
{
	return ceil(max(20,50-4*_n)/3);
}


///spear1 -- KALBIN ETRAFINDA DONEREK BELIREN, DUZ ICERI GELEN HALKA
///Mod: spear2 ile ayni buyuk arenada. Her salvoda kalbin O ANKI konumunun
///175 px cevresinde (bulletspeed*bulletdistance = 5*35) yedi mizrak
///beliriyor. lifetime -150'den basliyor ve 5/kare artiyor; sifira gelene
///kadar mizrak KIMILDAMIYOR ama kendi ekseninde 9.3 derece/kare donuyor
///ve alfasi 0.05/kare artiyor. Sifira gelince duz kalbe dogru geliyor.
///lifetime 175'i gecince sonmeye baslar, 262.5'te silinir. Carpma alfa
///0.9 ustunde ve mizragi da yok ediyor.
///Aci her salvoda 32 derece kayiyor; salvo araligi 50'den 25'e iniyor,
///yani pattern sonlara dogru HIZLANIYOR (bkz. Spear1Gap).
///NOT: mod "for i = 0, 6" ile yedi mermi uretip aciyi 360/6 ile boluyor,
///yani i=0 ile i=6 ayni yere dusuyor. Birebir aktarim icin korundu.
///@arg addAngle			salvonun acisi (derece)
///@arg hard*				true ise hardspear1 (alti yerine sekiz mizrak)
function Spear1(_addAngle)
{
	var _hard = false;
	if (argument_count >= 2) { _hard = argument[1]; }
	var _n = _hard ? 8 : 6;			/// bulletcount

	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul))
	{
		_cx = battle_soul.x;
		_cy = battle_soul.y;
	}

	for (var _i = 0; _i <= _n; _i++)
	{
		var _a = _i*360/_n+_addAngle;
		var _s = instance_create_depth(_cx+lengthdir_x(175,_a),_cy+lengthdir_y(175,_a),
			DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
		_s.kind = SPEAR_DIVE;
		_s.dir = _a+180;			/// kalbe dogru
		_s.spd = 5;				/// mod 5
		_s.dive_life = -150;
		_s.dive_step = 5;			/// mod 5
		_s.dive_fade = 175;			/// mod bulletdistance*bulletspeed
		_s.dive_kill = 262.5;		/// mod 1.5*bulletdistance*bulletspeed
		_s.fade_in = 0.05;			/// mod 0.05
		_s.fade_out = 0.05;		/// mod 2/40
		_s.dmg_alpha = 0.9;
		_s.dmg_kill = true;			/// spear1 carpan mizragi Remove() ediyor
		/// Modda sprite 'speardown', yani gidis yonunun 90 derece disinda
		/// basliyor; telegraf boyunca donup neredeyse yola hizaliniyor.
		_s.free_angle = true;
		_s.spin = 9.3;				/// mod 9.3
		_s.image_angle = (_a+180)-90+90;
	}
}


///spear1'in salvo araligi (kare).
///Mod: spawntimer her kare 1 artiyor, bulletspawn 50'den basliyor, her
///salvoda 4 azaliyor, 25'te duruyor. Aralik moddakiyle ayni.
///@arg n					kacinci salvo (0'dan baslar)
function Spear1Gap(_n)
{
	return max(25,50-4*_n);
}


///spear3 -- ARENANIN DISINDAN NISAN ALIP HIZLANARAK GELEN MIZRAK
///Mod: 20 karede bir, arenanin disinda rastgele bir kosede (x ve y ayri
///ayri +-105..150) tek mizrak doguyor. Sprite once hedefin 180 derece
///TERSINE bakiyor ve her kare (hedef-simdiki)/10 kadar donerek kalbe
///yoneliyor; bu sirada alfa 0.05/kare artiyor ve mizrak KIMILDAMIYOR.
///Alfa 1 olunca hizlanarak gidiyor: vel her kare 0.125 artiyor, adim
///birimyon*4*vel/5. Yon dogus aninda kilitleniyor, takip etmiyor.
///20. karede 'toss' sesi caliyor. |x| veya |y| 160'i asinca 4/40 alfa/kare
///ile sonerken yoluna devam ediyor. Carpma alfa kosulsuz ve mizragi
///yok etmiyor.
///@arg hard*				true ise hardspear3 (hiz carpani 4 yerine 5)
function Spear3()
{
	var _hard = false;
	if (argument_count >= 1) { _hard = argument[0]; }

	var _sx = (irandom(1) == 0) ? 1 : -1;
	var _sy = (irandom(1) == 0) ? 1 : -1;
	var _x = battle_board.x+_sx*irandom_range(105,150);
	var _y = battle_board.y-_sy*irandom_range(105,150);

	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul))
	{
		_cx = battle_soul.x;
		_cy = battle_soul.y;
	}

	var _s = instance_create_depth(_x,_y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_s.kind = SPEAR_AIM;
	_s.dir = point_direction(_x,_y,_cx,_cy);
	_s.aim_to = _s.dir-90;			/// sprite ucu yukari bakiyor
	_s.aim_now = _s.aim_to+180;		/// mod: rotation = rtarget + 180
	_s.image_angle = _s.aim_now;
	_s.aim_ease = 10;				/// mod 10
	var _k = _hard ? 5 : 4;			/// mod: normalize * 4, hardspear3'te * 5
	_s.aim_sx = lengthdir_x(_k,_s.dir);
	_s.aim_sy = lengthdir_y(_k,_s.dir);
	_s.aim_vel = 1;
	_s.aim_acc = 0.125;			/// mod 0.125
	_s.aim_out = 160;
	_s.aim_toss = 20;				/// mod 20
	_s.fade_in = 0.05;				/// mod 0.05
	_s.fade_out = 0.1;				/// mod 4/40
	_s.dmg_alpha = 0.05;			/// modda alfa kosulu yok
	audio_play_sound(snd_spear_spawn,0,false);
	return _s;
}


///hardspear4 -- HEM ASAGIDAN HEM YUKARIDAN SANCAN MIZRAKLAR
///Mod: arena 115x100'e genisliyor ve spear4'un aksine mizraklar HEM ALTTAN
///HEM USTTEN geliyor, 25 karede bir birer tane. Serit sayisi ucten bese
///cikiyor (posx = 23, yani -46/-23/0/23/46). Alttaki mizrak y = -68'de
///dogup 15'e kadar sanciyor; ustteki y = 64'te dogup -15'e kadar iniyor.
///Geri kalan her sey spear4 ile ayni.
function Spear4Hard()
{
	var _posx = 23;

	// --- alttan yukari ---
	var _a = instance_create_depth(battle_board.x+(-_posx+(irandom_range(1,5)-2)*_posx),battle_board.y+68,
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_a.kind = SPEAR_THRUST;
	_a.dir = 90;
	_a.warn_time = 60;
	_a.drift = 0.3;
	_a.drift_max = 10;
	_a.fade_in = 0.05;
	_a.spd = 5;
	_a.run_len = 73;				/// -58'den 15'e
	_a.run_stop = true;
	_a.fade_out = 0.05;
	_a.dmg_alpha = 0.9;

	// --- ustten asagi ---
	var _b = instance_create_depth(battle_board.x+(-_posx+(irandom_range(1,5)-2)*_posx),battle_board.y-64,
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_b.kind = SPEAR_THRUST;
	_b.dir = 270;
	_b.warn_time = 60;
	_b.drift = 0.3;
	_b.drift_max = 10;				/// mod: y 64'ten 54'e iniyor
	_b.fade_in = 0.05;
	_b.spd = 5;
	_b.run_len = 69;				/// 54'ten -15'e
	_b.run_stop = true;
	_b.fade_out = 0.05;
	_b.dmg_alpha = 0.9;

	audio_play_sound(snd_spear_spawn,0,false);
}

///@desc Mizrak sesini ust uste bindirmeden calar.
///spear4 uc, spear5 iki mizragi AYNI karede atesliyor ve her mizrak sesi
///kendisi caliyordu; ucu birden calinca ses uc kat sertlesiyordu. Kisa bir
///pencerede tek calma yetiyor -- salvolar arasi en az 20 kare oldugu icin
///ayri salvolar etkilenmiyor.
///@arg snd					calinacak ses
function SpearSound(_snd)
{
	if (!variable_global_exists("spear_snd_last")) { global.spear_snd_last = -9999; }
	if (current_time-global.spear_snd_last < 40) { return; }
	global.spear_snd_last = current_time;
	audio_play_sound(_snd,0,false);
}
