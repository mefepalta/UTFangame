/// EASY'YE OZEL PAPYRUS ATAK ZINCIRI -- CYF modundan BIRE BIR port
///
/// Kaynak: CYF modu, Lua/Waves/txt.lua. Orada butun ataklar tek dosyada
/// "if Encounter.GetVar('atkem')==N then ... end" bloklari halinde duruyor;
/// burada da ayni sekilde TEK obje, Step_0 icinde "atak" degiskenine gore
/// dallaniyor. EASY listesi her Papyrus turu icin ayni objeyi (28) yaratiyor,
/// kacinci atak oldugunu Difficulty_PapyrusAtakNo soyluyor.
///
/// CEVIRI KURALLARI: scripts/Cyf_Bridge. Buradaki sayilar KAYNAKTAKI CYF
/// degerleri; tek istisna Step_0'daki kare damgalari, onlar kaynak karesinin
/// IKI KATI (CYF 30 fps, oyun 60 fps). Her satirin yaninda kaynak kare
/// numarasi yorumda.
///
/// SAHNE: EASY'de karakterler artik script'e gore girip cikmiyor. Papyrus
/// t15'teki {revive 1} ile geldigi andan itibaren surekli sahnede; Sans ve
/// Alphys de sahnede kaliyor ama saldirmiyor, sadece konusuyorlar.

_timer=0;
_start=false;
cang=false;
canga=0;

depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

// Bu tur hangi CYF atagini oynuyor, ve zincirin sonuncusu mu?
atak     = Difficulty_PapyrusAtakNo(Battle_GetTurnNumber());
son_atak = Difficulty_PapyrusSonAtak(Battle_GetTurnNumber());
if (atak <= 0) { atak = 1; }

// --- ortak durum ---
kesme=0;         // ekran kesme karesi (kaynakta Misc.MoveCameraTo hilesi)
pap_t=0;         // Papyrus tepki pozunun geri sayimi

// atak 1
kol1=noone; kol2=noone; kol_r=0;
targ=[]; targ1=[]; targ2=[];

// atak 2
bt1=noone; bt2=noone; bt3=noone; bt4=noone;
bsdiz=[];

// atak 4
yildiz=[];        // Lua: cb -- merkezde donen 8 kemik
yildiz_aci=0;     // ortak donme acisi
yildiz_px=6;      // Lua: sprite.xpivot
yildiz_py=0.5;    // Lua: sprite.ypivot
sb=[]; sb2=[];

// atak 10 (final)
halka=[];         // Lua: txg -- dusmanin etrafinda donen kemik halkasi
halka_aci=0;
le_hiz=0;         // Lua: le
donme=100;        // Lua: rotacion -- spiral blaster acisi
spiral=false;
l_faz=0;          // Lua: l -- sinus fazi
x_say=0;          // Lua: x -- daralan kemik koridoru

// ara sahne (atak 7 sonu -- Papyrus'un "mola" cutscene'i)
ara=0;            // 0 yok, 1 diyalog, 2 mola, 3 toparlanma
ara_t=0;
ara_tam=false;    // cutscene oncesi tam ekran miydi
ara_ww=0; ara_wh=0; ara_wx=0; ara_wy=0;
ara_mx=0; ara_my=0;
tarayici_kondu=false;
ara_kilit=false;
duman=[];
duman_t=0;

// atak 7
uyari=[];         // Lua: yz -- targin nerede duracagini gosteren beyaz cizgi
slam_yon=-1;      // Lua: blue.slam(dir) -- yercekimi yonu + oyuncuyu duvara carpma
slam_vur=false;
sp_hiz=0;         // Lua: sp

T28Sag = function() { return (battle_board.x+battle_board.right)-8; };
T28Dip = function() { return (battle_board.y+battle_board.down)-8; };

// ---------------------------------------------------------------------------
// ORTAK YARDIMCILAR
// ---------------------------------------------------------------------------

/// Papyrus'un ifadesi. battle_enemy_engage/Step_0 her karede pap_arm_angle ve
/// pap_bob'u kendisi yaziyor; turdan surulebilecek olan pap_head_image.
PapPoz = function(_img,_sure)
{
	if (!instance_exists(battle_enemy_engage)) { return; }
	battle_enemy_engage.pap_head_image = _img;
	pap_t = _sure;
};

/// Lua: Audio.PlaySound("slam") Misc.ShakeScreen(10,3)
///
/// Kaynakta bu vurusta Sans kolunu savuruyor (Encounter.Call("slam",...)).
/// Burada sahnedeki Papyrus tepki veriyor.
Carpma = function()
{
	audio_play_sound(snd_impact,2,false);
	Camera_Shake(10,10,3,3);
	PapPoz(16,45);
	kol_r = 2;
};

Temizle = function()
{
	Cyf_TargSil(targ);
	Cyf_TargSil(targ1);
	Cyf_TargSil(targ2);
	Cyf_TargSil(bsdiz);
	Cyf_TargSil(yildiz);
	Cyf_TargSil(sb);
	Cyf_TargSil(sb2);
	targ = []; targ1 = []; targ2 = []; bsdiz = [];
	yildiz = []; sb = []; sb2 = [];
	Cyf_TargSil(halka);
	halka = [];
	uyari = [];
	DusmanKaySifirla();
	KolSil();
	with (battle_regularbone)        { instance_destroy(); }
	with (battle_regularbonewall)    { instance_destroy(); }
	with (battle_platform1)          { instance_destroy(); }
	with (battle_gasterblaster)      { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
};

/// Turu kapatir. Zincirin son turuysa P25Baslat() BURADAN cagriliyor --
/// EASY'de t20 listede olmadigi icin baska cagiran yok.
Bitir = function(_menu)
{
	Temizle();
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog(_menu);
	// EASY zincirinin sonu P25'e DEGIL, ozel FIGHT-kilidi bitisine gidiyor:
	// menu aciliyor, oyuncu sadece FIGHT'a basabiliyor, saldirinca slash
	// animasyonu bitince room_easy_ending'e geciliyor (bkz battle/Step_0 +
	// battle_menu_fight_anim_knife/Other_7).
	if (son_atak) { global.easy_final = true; }
	Battle_EndTurn();
};

// ---------------------------------------------------------------------------
// ARA SAHNE: PAPYRUS'UN MOLASI  (atak 7'nin sonunda)
// ---------------------------------------------------------------------------
//
// Papyrus oyuncuya mola verdigini soyluyor, oyunun penceresini kucultup
// masaustunun sagina yasliyor, tarayicida bir YouTube videosu aciyor ve video
// bitene kadar sigara iciyor. Bu sirada fare imleci yerine sabitleniyor,
// imlecin uzerinde mavi kemikler dolaniyor.
//
// Ekrani gercekten ikiye bolmek ve imleci saglam kilitlemek Win32 cagrisi
// gerektiriyor; ikisini de tml_win.dll yapiyor (bkz. scripts/Win_Split,
// kaynak dll_src/tml_win.c). DLL yuklenemezse sahne yine oynuyor, sadece
// tarayici solda konumlanmiyor ve imlec kilidi zayif kaliyor.
//
// Videonun BITTIGI anlasilamiyor (tarayicidan geri bildirim yok), o yuzden
// sure sabit: ARA_VIDEO_SURE.

#macro ARA_VIDEO_URL  "https://www.youtube.com/watch?v=hIaolNP7vKk&list=RDhIaolNP7vKk&start_radio=1"
#macro ARA_VIDEO_SURE 12900     // 3 dk 35 sn @60fps
#macro ARA_TARAYICI  "youtube"  // tarayici penceresi bu metne gore bulunuyor

/// Lua tarafinda karsiligi yok; battle_turn_18'in sigara sahnesiyle ayni
/// yaklasim: govde sprite'i degisiyor, bas ve kol gizleniyor, duman
/// parcaciklari elle yonetiliyor.
DumanEkle = function(_x,_y)
{
	array_push(duman,{
		x: _x+random_range(-2,2),
		y: _y,
		vx: random_range(-0.22,0.22),
		vy: -random_range(0.7,1.1),
		t: 0,
		omur: 80+irandom(40),
		tohum: irandom(359)
	});
};

DumanAdim = function()
{
	if (array_length(duman) <= 0) { return; }
	for (var _i = array_length(duman)-1; _i >= 0; _i--)
	{
		var _dm = duman[_i];
		_dm.t += 1;
		_dm.vy *= 0.985;
		_dm.vx *= 0.99;
		_dm.x += _dm.vx+dsin(_dm.t*2.6+_dm.tohum)*0.35;
		_dm.y += _dm.vy;
		if (_dm.t >= _dm.omur) { array_delete(duman,_i,1); }
	}
};

SigaraBasla = function()
{
	with (battle_enemy_engage)
	{
		pap_body_sprite = spr_papyrus_smoking;
		pap_body_image  = 0;
		pap_head_alpha  = 0;
		pap_arm_alpha   = 0;
	}
	duman = [];
	duman_t = 0;
};

SigaraBitir = function()
{
	with (battle_enemy_engage)
	{
		pap_body_sprite = spr_papyrus_body;
		pap_body_image  = 0;
		pap_head_alpha  = 1;
		pap_arm_alpha   = 1;
	}
	duman = [];
};

/// Final Bolum B'de (Papyrus sola kayarken) Sans (p2_*) ve Alphys (alp_*)
/// gizleniyor; sadece Papyrus gorunur kaliyor. Blaster halkasinda geri gelirler.
SansAlphysGizle = function()
{
	// STATE ile sahne disina: p2_state/alp_state = 0 hem sprite'i kaydiriyor
	// hem de p2_offstage'i true yapip blok sprite'ini (o_sans_blockp2)
	// gizliyor. Alpha=0 yaklasimi blok pozunu ACIYORDU, o yuzden state.
	with (battle_enemy_engage)
	{
		p2_state = 0;
		alp_state = 0;
	}
};

SansAlphysGoster = function()
{
	with (battle_enemy_engage)
	{
		p2_state = 2;
		alp_state = 2;
	}
};


/// Pencereyi 1x boyuta indirip masaustunun SAG yarisina yaslar.
/// Sol yariyi tarayici alacak (bkz. scripts/Win_Split).
AraPencere = function()
{
	ara_tam = window_get_fullscreen();
	ara_ww  = window_get_width();
	ara_wh  = window_get_height();
	ara_wx  = window_get_x();
	ara_wy  = window_get_y();

	Win_Split_OyunuSagaAl();
};

AraPencereGeri = function()
{
	Win_Split_Birak();

	if (ara_tam)
	{
		window_set_fullscreen(true);
	}
	else
	{
		window_set_size(ara_ww,ara_wh);
		window_set_position(ara_wx,ara_wy);
	}
};

/// Imleci once OYUN PENCERESININ ortasina alip orada cakiyor -- imlecin
/// uzerindeki mavi kemikler ancak kendi penceremizin icine cizilebildigi icin
/// imlecin orada kalmasi gerekiyor.
AraKilitBasla = function()
{
	ara_mx = window_get_x() + 320;
	ara_my = window_get_y() + 240;
	ara_kilit = true;
	Win_Split_GirdiKilidi(true);     // Alt+F4 / Alt+Tab / Win kapali
	global.no_quit = true;           // ESC basili tutunca "JUST KIDDING ;)"
};

/// HER KARE. Windows odak degisiminde ClipCursor kisitini birakiyor, o yuzden
/// tek seferlik cagri yetmiyor; DLL yoksa display_mouse_set'e dusuyor.
AraKilitAdim = function()
{
	if (!ara_kilit) { return; }
	Win_Split_ImlecCak(ara_mx,ara_my);
};

AraBitir = function()
{
	ara_kilit = false;
	global.no_quit = false;
	Win_Split_GirdiKilidi(false);
	SigaraBitir();
	AraPencereGeri();
	if (audio_is_playing(global.p2_bgm)) { audio_sound_gain(global.p2_bgm,1,600); }
};

// ---------------------------------------------------------------------------
// ATAK 10 (FINAL) yardimcilari (kaynak: atkem == 10)
// ---------------------------------------------------------------------------

/// Lua: Encounter.Call("moves",{x,y}) -- Sans'in bacak sprite'ini kaydiriyor,
/// yani dusman yana kayiyormus gibi gorunuyor. Bizde Papyrus'un cizim ofseti
/// pap_shake_x kullaniliyor (battle_enemy_engage onu her karede EZMIYOR).
/// Lua: wg() -- ofseti sifirlar.
DusmanKay = function(_dx)
{
	if (!instance_exists(battle_enemy_engage)) { return; }
	with (battle_enemy_engage)
	{
		pap_shake_x += _dx*CYF_HIZ;
		// Kaynakta dusman ekranin solundan cikinca sagdan geri giriyor
		// (Animations/sans.lua satir 21: x <= -70 ise Move(750,0)).
		// Kosu hissini veren sey bu; olmazsa dusman ekrandan silinip gidiyor.
		if ((pap_draw_x + pap_shake_x) <= -70) { pap_shake_x += 750; }
	}
};

DusmanKaySifirla = function()
{
	if (instance_exists(battle_enemy_engage)) { battle_enemy_engage.pap_shake_x = 0; }
};

/// Lua: txg -- dusmanin etrafinda 45 derecelik araliklarla duran, donen
/// 8 kemik. Zarar VERMIYOR (kaynakta da CreateSprite, mermi degil), o yuzden
/// alpha 1'in altinda tutuluyor; _inside=1 ile tahtanin disina ciziliyor.
HalkaKur = function()
{
	halka = [];
	halka_aci = 0;
	var _cx = battle_board.x;
	var _cy = 160;                       // CYF mutlak (320,320) -> oda (320,160)
	if (instance_exists(battle_enemy_engage))
	{
		_cx = battle_enemy_engage.pap_draw_x + battle_enemy_engage.pap_shake_x;
	}
	for (var _i = 0; _i < 8; _i++)
	{
		var _b = RegularBone(_cx,_cy,150*CYF_BOY,0,0,_i*45,0,
			1,        // _inside 1 -> tahta disina cizilir (dusmanin etrafi)
			0.99,     // alpha < 1: sadece gosterge, hasar vermez
			1, 0, 0, 0, false);
		_b._uzun = true;
		_b.cyf_taban = _i*45;
		array_push(halka,_b);
	}
};

/// ypivot 1.1: donme merkezi kemigin ust ucunun 15 px otesinde, yani kemikler
/// merkezden disari dogru sarkiyor.
HalkaAdim = function()
{
	var _cx = battle_board.x;
	var _cy = 160;
	if (instance_exists(battle_enemy_engage))
	{
		_cx = battle_enemy_engage.pap_draw_x + battle_enemy_engage.pap_shake_x;
	}

	var _r = 150*0.6;                    // ypivot 1.1 -> merkezden kemik ortasina
	for (var _i = 0; _i < array_length(halka); _i++)
	{
		var _b = halka[_i];
		if (!instance_exists(_b)) { continue; }
		var _a = _b.cyf_taban + halka_aci;
		_b.x = _cx + _r*dsin(_a);
		_b.y = _cy + _r*dcos(_a);
		_b._angle = _a;
	}
};

/// Lua'daki spiral blaster. CosenoYSeno() aslinda elle yazilmis bir sin/cos
/// tablosu; dort ceyrek icin ayni sonucu veriyor, o yuzden dogrudan dsin/dcos:
///   baslangic = merkez + 700*(sin,cos)     bitis = merkez + 185*(-sin,cos)
/// (bitisin x'i AYNALI -- kaynaktaki haliyle korundu.)
SpiralBlaster = function()
{
	donme -= 95;
	if (donme < 0) { donme += 360; }

	var _sn = dsin(donme);
	var _cs = dcos(donme);
	var _ax = battle_board.x;            // CYF mutlak x
	var _ay = 480 - battle_board.y;      // CYF mutlak y (asagidan)

	Cyf_Blaster(_ax + 700*_sn, _ay + 700*_cs,
	            _ax - 185*_sn, _ay + 185*_cs,
	            donme, -donme, 50, 0.75, 2, 30);
};

// ---------------------------------------------------------------------------
// ATAK 7 yardimcilari (kaynak: atkem == 7)
// ---------------------------------------------------------------------------

/// Lua: yz=CreateProjectile("mask",cx,cy) + Scale(999,3), CanHit=false
/// Zarar vermeyen, sadece targin nereye kadar gelecegini gosteren beyaz cizgi.
/// Draw_0'da tahta yuzeyine ciziliyor.
UyariCizgi = function(_cx,_cy,_dikey)
{
	uyari = [{
		x: Cyf_X(_cx),
		y: Cyf_Y(_cy),
		dikey: _dikey
	}];
	audio_play_sound(snd_warn,2,false);
};

UyariSil = function() { uyari = []; };

/// Lua: blue.slam(dir) -- yercekimini cevirir ve oyuncuyu o yone firlatir.
SlamKur = function(_yon)
{
	slam_yon = _yon;
	slam_vur = false;
	if (instance_exists(battle_soul)) { battle_soul.dir = _yon; }
};

SlamAdim = function()
{
	if (!instance_exists(battle_soul)) { return; }

	var _s = 15*CYF_HIZ;
	switch (slam_yon)
	{
		case DIR.DOWN:  battle_soul.y += _s; break;
		case DIR.UP:    battle_soul.y -= _s; break;
		case DIR.LEFT:  battle_soul.x -= _s; break;
		case DIR.RIGHT: battle_soul.x += _s; break;
	}

	var _ox = battle_soul.x;
	var _oy = battle_soul.y;
	battle_soul.x = clamp(battle_soul.x,(battle_board.x-battle_board.left)+8,(battle_board.x+battle_board.right)-8);
	battle_soul.y = clamp(battle_soul.y,(battle_board.y-battle_board.up)+8,(battle_board.y+battle_board.down)-8);

	// duvara degdigi ilk karede vurus
	if (!slam_vur) and ((battle_soul.x != _ox) or (battle_soul.y != _oy))
	{
		slam_vur = true;
		audio_play_sound(snd_impact,2,false);
		Camera_Shake(30,30,3,3);
		PapPoz(16,45);
	}
};

// ---------------------------------------------------------------------------
// ATAK 4 yardimcilari (kaynak: atkem == 4)
// ---------------------------------------------------------------------------
//
// Kaynakta 8 kemik (0,0) noktasinda duruyor ama sprite'larinin PIVOTU kaydirilmis
// (xpivot 6, yani sprite genisliginin 6 kati saga); dolayisiyla her kemik
// merkezden uzakta bir yaricapta donuyor. CYF'te pivot orani sprite'a gore:
//   dx = (0.5 - xpivot) * genislik      dy = (0.5 - ypivot) * boy
// Kemik merkezi bu vektorun aci kadar dondurulmus hali kadar oteleniyor.
// Pivot animasyonu (xpivot 6 -> -7 -> 0, ypivot -> 1) yildizi acip kapatiyor.

#macro T28_KEMIK_EN   10     // CYF "bone" sprite genisligi
#macro T28_KEMIK_BOY 200     // CYF "bone" sprite boyu

YildizKur = function()
{
	var _aci = [0,45,90,135,180,-45,-90,-135];
	yildiz = [];
	for (var _i = 0; _i < array_length(_aci); _i++)
	{
		var _b = Cyf_Kemik(T28_KEMIK_BOY,0,0, 0,0, 0,0, _aci[_i],0, 0, 0);
		_b.cyf_taban = _aci[_i];       // kendi baslangic acisi
		array_push(yildiz,_b);
	}
};

/// Her karede kemikleri pivot + aciya gore yeniden konumlandirir.
YildizAdim = function()
{
	var _dx = (0.5 - yildiz_px)*T28_KEMIK_EN;
	var _dy = (0.5 - yildiz_py)*T28_KEMIK_BOY;

	for (var _i = 0; _i < array_length(yildiz); _i++)
	{
		var _b = yildiz[_i];
		if (!instance_exists(_b)) { continue; }

		var _a = _b.cyf_taban + yildiz_aci;
		// CYF (y yukari) donusum, sonra oda koordinatina cevriliyor
		var _wx = _dx*dcos(_a) - _dy*dsin(_a);
		var _wy = _dx*dsin(_a) + _dy*dcos(_a);
		_b.x = battle_board.x + _wx;
		_b.y = battle_board.y - _wy;
		_b._angle = _a;
	}
};

YildizRenk = function(_renk)
{
	for (var _i = 0; _i < array_length(yildiz); _i++)
	{
		if (instance_exists(yildiz[_i])) { yildiz[_i]._color = _renk; }
	}
};

/// Lua: sb[i].sprite.alpha=0.5 + SetVar("CanHit",false)
/// Bizde alpha 1 degilse battle_regularbone zaten hasar vermiyor, tek satir yetiyor.
DiziSolgun = function(_liste)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { _liste[_i]._alpha = 0.5; }
	}
};

// ---------------------------------------------------------------------------
// ATAK 1 yardimcilari (kaynak: atkem == 1)
// ---------------------------------------------------------------------------

/// Lua: b1/b2 = CreateProjectile("bonew",60,-245) + SetPivot(...,-0.1)
///
/// CYF'te ypivot -0.1, yani donme merkezi sprite'in alt ucundan 15 px ASAGIDA.
/// Bizde _center=0 kemigi tabanindan cizip tabanindan donduruyor, o yuzden
/// kemik dogrudan o merkeze konuyor ve boyu 15 px uzatiliyor (150->165):
/// supurdugu alan birebir ayni oluyor.
Kol = function(_ox)
{
	var _k = RegularBone(
		Cyf_X(60+_ox), Cyf_Y(-245-75-15),
		165*CYF_BOY,
		0,0, 0, 0,
		0, 1, 1,
		0,   // _center 0 -> tabandan cizilir/doner
		0,   // _bottom 0: iki ucta da topuz
		0, false);
	_k._uzun = true;
	return _k;
};

KolHareket = function(_dy)
{
	if (instance_exists(kol1)) { kol1.y -= _dy*CYF_HIZ; }
	if (instance_exists(kol2)) { kol2.y -= _dy*CYF_HIZ; }
};

KolDon = function()
{
	// Lua (30 fps): r -= 0.05 ; rotation += r
	kol_r -= 0.05*CYF_HIZ;
	if (instance_exists(kol1)) { kol1._angle += kol_r*CYF_HIZ; }
	if (instance_exists(kol2)) { kol2._angle += kol_r*CYF_HIZ; }
};

KolSil = function()
{
	if (instance_exists(kol1)) { instance_destroy(kol1); }
	if (instance_exists(kol2)) { instance_destroy(kol2); }
	kol1 = noone;
	kol2 = noone;
};
