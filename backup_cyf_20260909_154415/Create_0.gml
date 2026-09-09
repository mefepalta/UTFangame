
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
		pap_shake_x += _dx*CYF_HIZ;
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
		var _b = RegularBone(_cx,_cy,150*CYF_BOY,0,0,_i*45,0,
			1,
			0.99,
			1, 0, 0, 0, false);
		_b._uzun = true;
		_b.cyf_taban = _i*45;
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
		var _a = _b.cyf_taban + halka_aci;
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

	Cyf_Blaster(_ax + 700*_sn, _ay + 700*_cs,
	            _ax - 185*_sn, _ay + 185*_cs,
	            donme, -donme, 50, 0.75, 2, 30);
};


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
		var _b = Cyf_Kemik(T28_KEMIK_BOY,0,0, 0,0, 0,0, _aci[_i],0, 0, 0);
		_b.cyf_taban = _aci[_i];
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

		var _a = _b.cyf_taban + yildiz_aci;
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
		Cyf_X(60+_ox), Cyf_Y(-245-75-15),
		165*CYF_BOY,
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
	if (instance_exists(kol1)) { kol1.y -= _dy*CYF_HIZ; }
	if (instance_exists(kol2)) { kol2.y -= _dy*CYF_HIZ; }
};

KolDon = function()
{
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
