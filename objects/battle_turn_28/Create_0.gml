// Bu zincirin ortak olcek sabitleri. Kemik hizlari/ivmeleri ve boylari tek
// yerden ayarlanabilsin diye buradan carpan olarak geciyor.
#macro ATAK_HIZ   0.5
#macro ATAK_IVME  0.25
#macro ATAK_BOY   1.2

_timer=0;
_start=false;
cang=false;
canga=0;

depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

atak     = Difficulty_PapyrusAtakNo(Battle_GetTurnNumber());
son_atak = Difficulty_PapyrusSonAtak(Battle_GetTurnNumber());
if (atak <= 0) { atak = 1; }

kesme=0;
pap_t=0;

kol1=noone; kol2=noone; kol_r=0;
targ=[]; targ1=[]; targ2=[];

bt1=noone; bt2=noone; bt3=noone; bt4=noone;
bsdiz=[];

yildiz=[];
yildiz_aci=0;
yildiz_px=6;
yildiz_py=0.5;
sb=[]; sb2=[];

halka=[];
halka_aci=0;
le_hiz=0;
donme=100;
spiral=false;
l_faz=0;
x_say=0;

ara=0;
ara_t=0;
ara_tam=false;
ara_ww=0; ara_wh=0; ara_wx=0; ara_wy=0;
ara_mx=0; ara_my=0;
tarayici_kondu=false;
ara_kilit=false;
duman=[];
duman_t=0;

uyari=[];
slam_yon=-1;
slam_vur=false;
sp_hiz=0;

// ---------------------------------------------------------------------------
// ARENA YARDIMCILARI
// Arena merkezli (Y yukari) koordinatlari oda koordinatina cevirir ve kemik /
// duvar / blaster uretimini tek yerden yapar. Sadece bu atak zinciri kullaniyor.
// ---------------------------------------------------------------------------

AtakX = function(_cx) { return battle_board.x + _cx; };

AtakY = function(_cy) { return battle_board.y - _cy; };

EkranX = function(_ax) { return _ax; };

EkranY = function(_ay) { return 480 - _ay; };

BlasterAci = function(_a) { return ((270 + _a) mod 360 + 360) mod 360; };

Kemik = function(_boy,_cx,_cy,_xv,_yv,_xcx,_ycy,_rot,_rots,_renk,_omur)
{
	var _b = RegularBone(
		AtakX(_cx), AtakY(_cy),
		_boy*ATAK_BOY,
		_xv*ATAK_HIZ, -_yv*ATAK_HIZ,
		_rot, _renk,
		0,
		1,
		1,
		1,
		0,
		_rots*ATAK_HIZ,
		false);

	if ((_xcx != 0) or (_ycy != 0))
	{
		var _ax = _xcx*ATAK_IVME;
		var _ay = -_ycy*ATAK_IVME;
		_b.gravity = point_distance(0,0,_ax,_ay);
		_b.gravity_direction = point_direction(0,0,_ax,_ay);
	}

	_b._uzun = true;

	if (_omur > 0) { _b.atak_omur = _omur*2; }
	return _b;
};

MaviRuh = function(_yon)
{
	instance_create_depth(0,0,0,battle_soul_blue_effect);
	Battle_SetSoul(battle_soul_blue);
	if (instance_exists(battle_soul)) { battle_soul.dir = _yon; }
	audio_play_sound(snd_ding,2,false);
};

KirmiziRuh = function()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
};

Hareket = function(_b,_dx,_dy)
{
	if (instance_exists(_b)) { _b.x += _dx*ATAK_HIZ; _b.y -= _dy*ATAK_HIZ; }
};

Dondur = function(_b,_d)
{
	if (instance_exists(_b)) { _b._angle += _d*ATAK_HIZ; }
};

/// Sureli kemikleri sayar; suresi dolani yok eder.
OmurAdim = function()
{
	with (battle_regularbone)
	{
		if (variable_instance_exists(id,"atak_omur"))
		{
			atak_omur -= 1;
			if (atak_omur <= 0) { instance_destroy(); }
		}
	}
};

/// 44 kemikten olusan, verilen aciyla duran uzun duvar.
Duvar = function(_cx,_cy,_rot)
{
	var _liste = [];
	var _x0 = AtakX(_cx);
	var _y0 = AtakY(_cy);

	for (var _i = 0; _i < 44; _i++)
	{
		var _lx = -235.5 + _i*11;
		var _px = _x0 + lengthdir_x(_lx,-_rot);
		var _py = _y0 + lengthdir_y(_lx,-_rot);

		var _b = RegularBone(_px,_py,300*ATAK_BOY,0,0,_rot,0,0,1,1,1,0,0,false);
		_b._uzun = true;
		array_push(_liste,_b);
	}
	return _liste;
};

DuvarHareket = function(_liste,_dx,_dy)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		var _b = _liste[_i];
		if (instance_exists(_b)) { _b.x += _dx*ATAK_HIZ; _b.y -= _dy*ATAK_HIZ; }
	}
};

DuvarSil = function(_liste)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { instance_destroy(_liste[_i]); }
	}
};

DuvarRenk = function(_liste,_renk)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { _liste[_i]._color = _renk; }
	}
};

Blaster = function(_x,_y,_x1,_y1,_ang,_ang1,_ates,_s1,_s2,_kal)
{
	var _ucus = _ates*2 - 21;
	if (_ucus < 1) { _ucus = 1; }

	var _b = RegularBlaster(
		EkranX(_x),  EkranY(_y),
		EkranX(_x1), EkranY(_y1),
		BlasterAci(_ang1), BlasterAci(_ang),
		max(_kal*2,30),
		1,
		_s2, _s1,
		_ucus);
	return _b;
};

T28Sag = function() { return (battle_board.x+battle_board.right)-8; };
T28Dip = function() { return (battle_board.y+battle_board.down)-8; };


PapPoz = function(_img,_sure)
{
	if (!instance_exists(battle_enemy_engage)) { return; }
	battle_enemy_engage.pap_head_image = _img;
	pap_t = _sure;
};

Carpma = function()
{
	audio_play_sound(snd_impact,2,false);
	Camera_Shake(10,10,3,3);
	PapPoz(16,45);
	kol_r = 2;
};

Temizle = function()
{
	DuvarSil(targ);
	DuvarSil(targ1);
	DuvarSil(targ2);
	DuvarSil(bsdiz);
	DuvarSil(yildiz);
	DuvarSil(sb);
	DuvarSil(sb2);
	targ = []; targ1 = []; targ2 = []; bsdiz = [];
	yildiz = []; sb = []; sb2 = [];
	DuvarSil(halka);
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
	if (son_atak) { global.easy_final = true; }
	Battle_EndTurn();
};


#macro ARA_VIDEO_URL  "https://www.youtube.com/watch?v=hIaolNP7vKk&list=RDhIaolNP7vKk&start_radio=1"
#macro ARA_VIDEO_SURE 12900
#macro ARA_TARAYICI  "youtube"

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

SansAlphysGizle = function()
{
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

AraKilitBasla = function()
{
	ara_mx = window_get_x() + 320;
	ara_my = window_get_y() + 240;
	ara_kilit = true;
	Win_Split_GirdiKilidi(true);
	global.no_quit = true;
	global.no_fullscreen = true;
};

AraKilitAdim = function()
{
	if (!ara_kilit) { return; }
	Win_Split_ImlecCak(ara_mx,ara_my);
};

AraBitir = function()
{
	ara_kilit = false;
	global.no_quit = false;
	global.no_fullscreen = false;
	Win_Split_GirdiKilidi(false);
	SigaraBitir();
	AraPencereGeri();
	if (audio_is_playing(global.p2_bgm)) { audio_sound_gain(global.p2_bgm,1,600); }
};


DusmanKay = function(_dx)
{
	if (!instance_exists(battle_enemy_engage)) { return; }
	with (battle_enemy_engage)
	{
		pap_shake_x += _dx*ATAK_HIZ;
		if ((pap_draw_x + pap_shake_x) <= -70) { pap_shake_x += 750; }
	}
};

DusmanKaySifirla = function()
{
	if (instance_exists(battle_enemy_engage)) { battle_enemy_engage.pap_shake_x = 0; }
};

HalkaKur = function()
{
	halka = [];
	halka_aci = 0;
	var _cx = battle_board.x;
	var _cy = 160;
	if (instance_exists(battle_enemy_engage))
	{
		_cx = battle_enemy_engage.pap_draw_x + battle_enemy_engage.pap_shake_x;
	}
	for (var _i = 0; _i < 8; _i++)
	{
		var _b = RegularBone(_cx,_cy,150*ATAK_BOY,0,0,_i*45,0,
			1,
			0.99,
			1, 0, 0, 0, false);
		_b._uzun = true;
		_b.atak_taban = _i*45;
		array_push(halka,_b);
	}
};

HalkaAdim = function()
{
	var _cx = battle_board.x;
	var _cy = 160;
	if (instance_exists(battle_enemy_engage))
	{
		_cx = battle_enemy_engage.pap_draw_x + battle_enemy_engage.pap_shake_x;
	}

	var _r = 150*0.6;
	for (var _i = 0; _i < array_length(halka); _i++)
	{
		var _b = halka[_i];
		if (!instance_exists(_b)) { continue; }
		var _a = _b.atak_taban + halka_aci;
		_b.x = _cx + _r*dsin(_a);
		_b.y = _cy + _r*dcos(_a);
		_b._angle = _a;
	}
};

SpiralBlaster = function()
{
	donme -= 95;
	if (donme < 0) { donme += 360; }

	var _sn = dsin(donme);
	var _cs = dcos(donme);
	var _ax = battle_board.x;
	var _ay = 480 - battle_board.y;

	Blaster(_ax + 700*_sn, _ay + 700*_cs,
	            _ax - 185*_sn, _ay + 185*_cs,
	            donme, -donme, 50, 0.75, 2, 30);
};


UyariCizgi = function(_cx,_cy,_dikey)
{
	uyari = [{
		x: AtakX(_cx),
		y: AtakY(_cy),
		dikey: _dikey
	}];
	audio_play_sound(snd_warn,2,false);
};

UyariSil = function() { uyari = []; };

SlamKur = function(_yon)
{
	slam_yon = _yon;
	slam_vur = false;
	if (instance_exists(battle_soul)) { battle_soul.dir = _yon; }
};

SlamAdim = function()
{
	if (!instance_exists(battle_soul)) { return; }

	var _s = 15*ATAK_HIZ;
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

	if (!slam_vur) and ((battle_soul.x != _ox) or (battle_soul.y != _oy))
	{
		slam_vur = true;
		audio_play_sound(snd_impact,2,false);
		Camera_Shake(30,30,3,3);
		PapPoz(16,45);
	}
};


#macro T28_KEMIK_EN   10
#macro T28_KEMIK_BOY 200

YildizKur = function()
{
	var _aci = [0,45,90,135,180,-45,-90,-135];
	yildiz = [];
	for (var _i = 0; _i < array_length(_aci); _i++)
	{
		var _b = Kemik(T28_KEMIK_BOY,0,0, 0,0, 0,0, _aci[_i],0, 0, 0);
		_b.atak_taban = _aci[_i];
		array_push(yildiz,_b);
	}
};

YildizAdim = function()
{
	var _dx = (0.5 - yildiz_px)*T28_KEMIK_EN;
	var _dy = (0.5 - yildiz_py)*T28_KEMIK_BOY;

	for (var _i = 0; _i < array_length(yildiz); _i++)
	{
		var _b = yildiz[_i];
		if (!instance_exists(_b)) { continue; }

		var _a = _b.atak_taban + yildiz_aci;
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

DiziSolgun = function(_liste)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { _liste[_i]._alpha = 0.5; }
	}
};


Kol = function(_ox)
{
	var _k = RegularBone(
		AtakX(60+_ox), AtakY(-245-75-15),
		165*ATAK_BOY,
		0,0, 0, 0,
		0, 1, 1,
		0,
		0,
		0, false);
	_k._uzun = true;
	return _k;
};

KolHareket = function(_dy)
{
	if (instance_exists(kol1)) { kol1.y -= _dy*ATAK_HIZ; }
	if (instance_exists(kol2)) { kol2.y -= _dy*ATAK_HIZ; }
};

KolDon = function()
{
	kol_r -= 0.05*ATAK_HIZ;
	if (instance_exists(kol1)) { kol1._angle += kol_r*ATAK_HIZ; }
	if (instance_exists(kol2)) { kol2._angle += kol_r*ATAK_HIZ; }
};

KolSil = function()
{
	if (instance_exists(kol1)) { instance_destroy(kol1); }
	if (instance_exists(kol2)) { instance_destroy(kol2); }
	kol1 = noone;
	kol2 = noone;
};
