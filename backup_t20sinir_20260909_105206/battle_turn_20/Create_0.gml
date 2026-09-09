#macro T20_TESLIM_KARARMA 100
#macro T20_TESLIM_BEKLE    30
#macro T20_TESLIM_ACILMA   45

teslim_cikis = false;
teslim_kare = 0;

_timer=0;
_start=false;
cang=false;
canga=0;
attack_done = false;
spriteready = false;
frameready = false;


F2Sol = function() { return (battle_board.x-battle_board.left); };
F2Sag = function() { return (battle_board.x+battle_board.right); };
F2Dip = function() { return (battle_board.y+battle_board.down)-2; };
F2Tep = function() { return (battle_board.y-battle_board.up)+2; };

F2Ust = function(_hiz,_boy)
{
	var _x = (_hiz > 0) ? F2Sol()-12 : F2Sag()+12;
	return RegularBone(_x,F2Tep(),_boy,_hiz,0,180,0,0,1,0,0,0,0,true);
};

F2Alt = function(_hiz,_boy)
{
	var _x = (_hiz > 0) ? F2Sol()-12 : F2Sag()+12;
	return RegularBone(_x,F2Dip(),_boy,_hiz,0,0,0,0,1,0,0,0,0,true);
};

F2Bosluk = function(_hiz,_nere)
{
	var _x = (_hiz > 0) ? F2Sol()-6 : F2Sag()+6;
	var _ust, _alt;
	switch (_nere)
	{
		case 0:  _ust = 16; _alt = 104; break;
		case 1:  _ust = 66; _alt = 66; break;
		default: _ust = 104; _alt = 16; break;
	}
	RegularBone(_x,F2Tep(),_ust,_hiz,0,180,0,0,1,1,0,0,0,true);
	RegularBone(_x,F2Dip(),_alt,_hiz,0,0,0,0,1,1,0,0,0,true);
};

F2InenYatay = function(_hiz)
{
	return RegularBone(battle_board.x,F2Tep()-24,150,0,_hiz,90,0,0,1,0,1,0,0,true);
};

F2AltBlaster = function(_ox)
{
	return RegularBlaster(battle_board.x+_ox,560,battle_board.x+_ox,F2Dip()+64,90,90,26,24,2,2,42);
};

F2UstBlaster = function(_ox)
{
	return RegularBlaster(battle_board.x+_ox,-60,battle_board.x+_ox,F2Tep()-64,270,270,26,24,2,2,42);
};


f2_gecit = [];
f2_mavi = noone;

F2GecitBoy = function(_p,_g,_ust)
{
	var _h = battle_board.up+battle_board.down;
	if (_ust) { return max(0,(_h-_p-_g/2)/0.7); }
	return max(0,(_p-_g/2)/0.7);
};

F2Gecit = function(_hiz,_i,_g)
{
	var _h = battle_board.up+battle_board.down;
	var _p = _h*0.5+dsin(_i*34)*(_h*0.26);
	var _x = (_hiz > 0) ? (battle_board.x-battle_board.left)-8
	                    : (battle_board.x+battle_board.right)+8;
	var _bt = battle_board.y-battle_board.up+2;
	var _bb = battle_board.y+battle_board.down-2;
	var _a = RegularBone(_x,_bb,F2GecitBoy(_p,_g,false),_hiz,0,0,0,0,1,1,0,0,0,true);
	var _b = RegularBone(_x,_bt,F2GecitBoy(_p,_g,true),_hiz,0,180,0,0,1,1,0,0,0,true);
	array_push(f2_gecit,_a);
	array_push(f2_gecit,_b);
};

F2MaviYelpaze = function()
{
	var _gen = (battle_board.left+battle_board.right)+90;
	var _basla = battle_board.y-battle_board.up-20;
	var _derin = (battle_board.y+battle_board.down)-_basla;
	var _hiz = _derin/24.9;

	var _b = RegularBone(battle_board.x,_basla,_gen,0,_hiz,90,1,1,1,0,1,0,0,false);
	_b._dynamic = true;
	_b._dynamic_lifetime = 400;
	_b._base_hspeed = 0;
	_b._base_vspeed = _hiz;
	_b._dynamic_rate = 0.012;
	f2_mavi = _b;
	return _b;
};

F2Duvar = function(_yon,_boy,_uyari,_sure)
{
	var _sl = (battle_board.x-battle_board.left);
	var _st = (battle_board.y-battle_board.up)+2;
	var _sb = (battle_board.y+battle_board.down)-2;
	if (_yon == DIR.LEFT) or (_yon == DIR.RIGHT)
	{
		var _yuk = battle_board.up+battle_board.down+20;
		RegularBoneWall(_yon,_yuk,10,_boy,_sl,_st,_uyari,_sure,1,false);
	}
	else
	{
		var _gen = battle_board.left+battle_board.right+20;
		RegularBoneWall(_yon,_gen,14,_boy,_sl,(_yon == DIR.DOWN) ? _sb : _st,_uyari,_sure,1,false);
	}
};

F2SolaBlaster = function(_oy)
{
	return RegularBlaster(760,battle_board.y+_oy,(battle_board.x+battle_board.right)+64,battle_board.y+_oy,180,180,26,24,2,2,42);
};


f2_deniz = [];
f2_deniz_x = [];
f2_dalga_x = [];
f2_dalga_t = [];
f2_plat = noone;

F2DenizKur = function(_adet,_taban,_sure)
{
	f2_deniz = [];
	f2_deniz_x = [];
	f2_dalga_x = [];
	f2_dalga_t = [];
	var _w = battle_board.left+battle_board.right;
	var _gap = _w/_adet;
	var _x0 = battle_board.x-battle_board.left+_gap/2;
	for (var _i = 0; _i < _adet; _i++)
	{
		var _x = _x0+_i*_gap;
		var _b = RegularBone(_x,battle_board.y+battle_board.down-2,0,0,0,0,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_taban,_sure);
		array_push(f2_deniz,_b);
		array_push(f2_deniz_x,_x);
	}
	audio_play_sound(snd_exclamation,0,false);
};

F2Dalga = function(_x)
{
	array_push(f2_dalga_x,_x);
	array_push(f2_dalga_t,0);
};

F2DenizAdim = function(_taban,_amp,_hiz,_sonme,_zaman)
{
	for (var _j = array_length(f2_dalga_t)-1; _j >= 0; _j--)
	{
		f2_dalga_t[_j] += 1;
		if (f2_dalga_t[_j] > 300)
		{
			array_delete(f2_dalga_t,_j,1);
			array_delete(f2_dalga_x,_j,1);
		}
	}

	var _n = array_length(f2_deniz);
	var _m = array_length(f2_dalga_t);
	for (var _i = 0; _i < _n; _i++)
	{
		if (!instance_exists(f2_deniz[_i])) { continue; }
		var _l = _taban;
		for (var _j = 0; _j < _m; _j++)
		{
			var _d = abs(f2_deniz_x[_i]-f2_dalga_x[_j]);
			var _f = f2_dalga_t[_j]-_d/_hiz;
			if (_f <= 0) { continue; }
			_l += _amp/(1+_d/_sonme)*exp(-_f/_zaman)*dsin(_f*9);
		}
		f2_deniz[_i]._length = max(2,_l);
	}
};

F2PlatformAdim = function()
{
	if (!instance_exists(f2_plat)) { return; }
	var _sol = battle_board.x-battle_board.left+f2_plat.width/2;
	var _sag = battle_board.x+battle_board.right-f2_plat.width/2;
	if (f2_plat.x < _sol) { f2_plat.move_x = abs(f2_plat.move_x); }
	if (f2_plat.x > _sag) { f2_plat.move_x = -abs(f2_plat.move_x); }
};

F2DenizTemizle = function()
{
	var _n = array_length(f2_deniz);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(f2_deniz[_i])) { instance_destroy(f2_deniz[_i]); }
	}
	f2_deniz = [];
	f2_deniz_x = [];
	f2_dalga_x = [];
	f2_dalga_t = [];
	if (instance_exists(f2_plat)) { instance_destroy(f2_plat); }
};


f2_kol_geri = -1;

F2El = function()
{
	var _ex, _ey;
	with (battle_enemy_engage)
	{
		_ex = x+p2_off_x+p2_shake_x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2-104;
		_ey = y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2+21;
	}
	return { ex : _ex, ey : _ey };
};

F2KolFirlat = function(_kare)
{
	audio_play_sound(snd_grab,2,false);
	battle_enemy_engage.p2_armleft_sprite = spr_p2_arm_left_1;
	var _el = F2El();
	instance_create_depth(_el.ex,_el.ey,-999,o_fakebone);
	f2_kol_geri = _kare;
};

F2KolGeri = function()
{
	battle_enemy_engage.p2_armleft_sprite = spr_p2_arm_left;
	instance_destroy(o_fakebone);
	f2_kol_geri = -1;
};

F2DonenKemik = function(_hiz,_don)
{
	audio_play_sound(snd_swift,2,false);
	var _el = F2El();
	var _yon = point_direction(_el.ex,_el.ey,battle_soul.x,battle_soul.y);
	var _b = RegularBone(_el.ex,_el.ey,28,lengthdir_x(_hiz,_yon),lengthdir_y(_hiz,_yon),0,0,1,0,0,1,0,_don,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,12);
	return _b;
};

F2Cekic = function(_kose)
{
	var _sol = battle_board.x-battle_board.left+190;
	var _sag = battle_board.x+battle_board.right-190;
	var _ust = battle_board.y-battle_board.up;
	var _alt = battle_board.y+battle_board.down;
	switch (_kose)
	{
		case 0:  AlphysHammer(1,_sol,_ust,-1,1,1); break;
		case 1:  AlphysHammer(1,_sag,_ust, 1,1,1); break;
		case 2:  AlphysHammer(0,_sag,_alt,-1,1,1); break;
		default: AlphysHammer(0,_sol,_alt, 1,1,1); break;
	}
};

f2_s1_next = -1;
f2_s1_n = 0;
f2_s1_ang = 0;


F2AltGrup = function(_hiz)
{
	var _x = (battle_board.x-battle_board.left)-5;
	var _y = (battle_board.y+battle_board.down)-2;
	for (var _i = 0; _i < 6; _i++)
	{
		var _b = RegularBone(_x-_i*14,_y,105,_hiz,0,0,0,0,1,1,0,0,0,true);
		_b.f2_grup = true;
	}
};

F2GrupVur = function()
{
	if (instance_number(battle_regularbone) <= 0) { return; }
	with (battle_regularbone)
	{
		if (variable_instance_exists(id,"f2_grup"))
		{
			Anim_Destroy(id,"_length");
			Anim_Create(id,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,105, 70,8);
			Anim_Create(id,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN ,175,-70,8,52);
		}
	}
	audio_play_sound(snd_stab,2,false);
};

F2NisanBlaster = function(_soldan)
{
	var _bx = _soldan ? -50 : 690;
	return RegularBlaster(_bx,-50,battle_soul.x,(battle_board.y-battle_board.up)-70,270,270,30,5,1,2,40);
};


sari_on = false;
sari_t = 0;
sari_son = 1575;

F2SariBasla = function()
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

F2SariBitir = function()
{
	sari_on = false;
	with (battle_dr_target) { instance_destroy(); }
	with (battle_dr_shot) { instance_destroy(); }
};

depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

yol=0;
bolum=0;
atak_yol=14450;
bitis_kare=-1;
konuk_son=0;

car_on=false;
cars=[];
car_ang=0;
car_spin=1.1;
car_n=14;
car_rx=145;
car_ry=28;

CarSeg = function(_i,_cy)
{
	var _adim = 360/car_n;
	var _a1 = car_ang+_i*_adim;
	var _a2 = _a1+_adim;
	return {
		x1: battle_board.x+car_rx*dcos(_a1),
		x2: battle_board.x+car_rx*dcos(_a2),
		y: _cy+car_ry*(dsin(_a1)+dsin(_a2))/2,
		on: dsin(_a1+_adim/2),
		sc: 1.0+1.2*(0.5+0.5*dsin(_a1+_adim/2))
	};
};

CarCap = function(_cx,_cy,_ang,_sc,_col,_al)
{
	var _sw = sprite_get_width(spr_paps_bonetop);
	var _sh = sprite_get_height(spr_paps_bonetop);
	var _dx = (_sw/2-sprite_get_xoffset(spr_paps_bonetop))*_sc;
	var _dy = (_sh/2-sprite_get_yoffset(spr_paps_bonetop))*_sc;
	var _rx = _dx*dcos(_ang)+_dy*dsin(_ang);
	var _ry = -_dx*dsin(_ang)+_dy*dcos(_ang);
	draw_sprite_ext(spr_paps_bonetop,0,_cx-_rx,_cy-_ry,_sc,_sc,_ang,_col,_al);
};

CarBone = function(_x1,_x2,_y,_sc,_col,_al)
{
	var _l = min(_x1,_x2);
	var _r = max(_x1,_x2);
	if (_r-_l < 1) { return; }
	var _cap = sprite_get_height(spr_paps_bonetop)*_sc;
	var _kal = 5*_sc;
	if (_r-_l < _cap*1.7)
	{
		CarCap((_l+_r)/2,_y,90,_sc,_col,_al);
		return;
	}
	var _sl = _l+_cap;
	var _sr = _r-_cap;
	if (_sr > _sl)
	{
		draw_set_alpha(_al);
		draw_set_color(_col);
		draw_rectangle(_sl,_y-_kal/2,_sr,_y+_kal/2,false);
		draw_set_alpha(1);
	}
	CarCap(_l+_cap/2,_y,90,_sc,_col,_al);
	CarCap(_r-_cap/2,_y,-90,_sc,_col,_al);
};

CarMark = function(_d)
{
	array_push(cars,{ y: 400-_d });
	car_on = true;
};

CarStop = function()
{
	car_on = false;
	cars = [];
};

gst_state=0;
gst_on=false;
gst_x=320;
gst_y=120;
gst_home_y=120;
gst_bekle=6;
gst_hazir=30;
gst_geri=20;
gst_vx=1.4;
gst_t=0;
gst_cycle=0;
gst_max=4;
gst_alpha=0;
gst_flash=0;
gst_bob=0;
gst_scale=2.2;
gst_tx=320;
gst_ty=400;
gst_spd=19;
gst_rvx=0;
gst_rvy=0;

kon_tep_t   = -1;
kon_tep_x0  = 0;
kon_tep_hed = 0;

GuestStart = function(_max)
{
	gst_max = _max;
	gst_cycle = 0;
	gst_on = true;
	gst_state = 0;
	gst_t = 0;
	gst_x = battle_board.x;
	gst_y = -60;
	gst_vx = 1.4;
	gst_flash = 0;
	Anim_Destroy(id,"gst_alpha");
	Anim_Create(id,"gst_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,25);
	audio_play_sound(snd_exclamation,0,false);
};

GuestStop = function()
{
	gst_on = false;
	Anim_Destroy(id,"gst_alpha");
	Anim_Create(id,"gst_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,gst_alpha,-gst_alpha,25);
};

box_on=false;
boxes=[];
blasts=[];
box_gap=260;

blast_warn=120;
blast_len=20000;

DrBlaster = function(_side,_y)
{
	var _hx = (_side < 0) ? (battle_board.x-battle_board.left-42) : (battle_board.x+battle_board.right+42);
	var _ang = (_side < 0) ? 0 : 180;
	var _b = RegularBlaster(_hx,_y,_hx,_y,_ang,_ang,26,55,2,2,1);
	_b.dr_mode = true;
	_b.dr_len = blast_len;
	_b.image_alpha = 0;
	Anim_Create(_b,"image_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,30);
	return _b;
};

ChainRun = function(_count,_gap,_w)
{
	var _ofs = [-20,20,-20,20,-20,20];
	for (var _i = 0; _i < _count; _i++)
	{
		var _b = DrBone(_ofs[_i % array_length(_ofs)],_w);
		_b.y = -40-_i*_gap;
	}
	audio_play_sound(snd_exclamation,0,false);
};

BlastMark = function(_d,_side)
{
	array_push(blasts,{ y: 400-_d, side: _side, dogdu: false });
};

BoxRun = function(_count,_w,_h,_gap,_off)
{
	boxes = [];
	blasts = [];
	box_gap = _gap;
	var _adim = _h+_gap;
	for (var _i = 0; _i < _count; _i++)
	{
		var _ox = (_i % 2 == 0) ? -_off : _off;
		var _y = -250-_i*_adim;
		array_push(boxes,{ ox:_ox, w:_w, h:_h, y:_y });

		var _b1 = DrBone(_ox,_w);
		_b1.y = _y+_h/2;
		var _b2 = DrBone(_ox,_w);
		_b2.y = _y-_h/2;

		if (_i < _count-1)
		{
			BlastMark(400-(_y-_h/2-_gap/2),(_ox < 0) ? -1 : 1);
		}
	}
	box_on = true;
	audio_play_sound(snd_exclamation,0,false);
};

BoxStop = function()
{
	box_on = false;
	boxes = [];
	with (battle_dr_obstacle) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
};




JumpRing = function(_off,_dy)
{
	var _r = DrRing(_off);
	_r.y -= _dy;
	return _r;
};

JumpBar = function(_dy)
{
	var _b = DrBone(-9999,2);
	_b.y -= _dy;
	return _b;
};

JumpUnit = function(_first,_lanes)
{
	var _n = array_length(_lanes);
	for (var _i = 0; _i < _n; _i++)
	{
		var _d = _first+260*_i;
		JumpRing(_lanes[_i],_d-420);
		JumpBar(_d+130-424);
	}
	var _td = _first+260*_n;
	JumpRing(_lanes[_n-1],_td-420);
	CarMark(_td+130);
};

sahne=0;
sahne_kare=0;
duman=[];
duman_t=0;


ChainRunX = function(_count,_gap,_w,_ofs)
{
	for (var _i = 0; _i < _count; _i++)
	{
		var _b = DrBone(_ofs[_i % array_length(_ofs)],_w);
		_b.y = -40-_i*_gap;
	}
	audio_play_sound(snd_exclamation,0,false);
};

F2TuruncuBasla = function()
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(360,160,120,120,1);
	Battle_SetSoul(battle_soul_orange_dr);
	battle_soul.x = battle_board.x;
	battle_soul.y = 400;
	DrCorridor(false,4);
	bolum = 0;
	yol = 0;
};


son_on = false;
son_t = 0;
son_bitis = -1;

F2Merkez = function() { return { x : battle_board.x, y : battle_board.y }; };

F2Cember = function(_r,_n,_hiz,_baslangic)
{
	var _my = (battle_board.y-battle_board.up)+(battle_board.up+battle_board.down)/2;
	var _boy = (2*pi*_r)/_n+8;
	for (var _i = 0; _i < _n; _i++)
	{
		var _a = _baslangic+_i*(360/_n);
		var _x = battle_board.x+lengthdir_x(_r,_a);
		var _y = _my+lengthdir_y(_r,_a);
		var _b = RegularBone(_x,_y,_boy,lengthdir_x(-_hiz,_a),lengthdir_y(-_hiz,_a),_a+90,0,1,0,0,1,0,0,false);
		Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,14);
	}
	audio_play_sound(snd_stab,2,false);
};

F2SerbestBolt = function()
{
	var _x = irandom_range(60,580);
	var _b = AlphysBigBolt(_x,-70,270,7,7,2.4);
	_b.serbest_y = irandom_range(120,400);
	return _b;
};

F2Hancer = function(_dx,_dy,_hsp,_vsp,_ang,_wait)
{
	var _b = RegularBone(_dx,_dy,58,0,0,_ang-110,0,1,0,1,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,12);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,18);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,5,_wait);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,5,_wait);
	return _b;
};

F2HancerNisan = function(_kenar)
{
	var _x, _y;
	switch (_kenar)
	{
		case 0:  _x = irandom_range(60,580); _y = -40;  break;
		case 1:  _x = 680; _y = irandom_range(60,420);  break;
		case 2:  _x = irandom_range(60,580); _y = 520;  break;
		default: _x = -40; _y = irandom_range(60,420);  break;
	}
	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul)) { _cx = battle_soul.x; _cy = battle_soul.y; }
	var _d = point_direction(_x,_y,_cx,_cy);
	return F2Hancer(_x,_y,lengthdir_x(13,_d),lengthdir_y(13,_d),_d-90,30);
};

F2SonKayma = function()
{
	Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN,battle_soul.y,-120-battle_soul.y,45);
};

F2SonBeyaz = function()
{
	fader.color = c_white;
	Fader_Fade(0,1,16);
	rgb_shake1(10,1,90);
	audio_play_sound(snd_noise,1,false);
	Camera_Shake(6,6,2,2);
};

F2SonAc = function()
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(320,160,320,320,1);
	Battle_SetSoul(battle_soul_red);
	battle_soul.x = battle_board.x;
	battle_soul.y = battle_board.y;
	F2SeritBasla();
	son_on = true;
	son_t = 0;
};

F2SonKapat = function()
{
	Fader_Fade(1,0,36);
};

F2FaderSiyah = function()
{
	fader.color = c_black;
};


serit_on = false;
seritler = [];

F2SeritYap = function(_yeni)
{
	return {
		x   : irandom_range(10,630),
		y   : _yeni ? (500+irandom(140)) : irandom_range(0,480),
		boy : irandom_range(30,90),
		hiz : irandom_range(6,13),
		a   : random_range(0.10,0.26)
	};
};

F2SeritBasla = function()
{
	seritler = [];
	for (var _i = 0; _i < 18; _i++) { array_push(seritler,F2SeritYap(false)); }
	serit_on = true;
};

F2SeritAdim = function(_carpan)
{
	if (!serit_on) { return; }
	var _sn = array_length(seritler);
	for (var _i = 0; _i < _sn; _i++)
	{
		var _sr = seritler[_i];
		_sr.y -= _sr.hiz*_carpan;
		if (_sr.y+_sr.boy < 0) { seritler[_i] = F2SeritYap(true); }
	}
};

F2SeritDur = function()
{
	serit_on = false;
	seritler = [];
};


mavi_on = false;
mavi_t = 0;
mavi_hiz = 1.4;
mavi_adim = 0;

mavi_parkur = [
	[320, 120, 0],
	[125,  80, 0],
	[300,  80, 1],
	[540,  70, 0],
	[370,  70,-1],
	[535,  70, 0],
	[300,  60, 1],
	[140,  60, 0],
	[300,  70,-1],
	[530,  70, 1],
	[365,  60, 0],
	[520,  60,-1],
	[285,  60, 1],
	[120,  70, 0],
	[290,  80,-1],
	[575,  90,-1],
	[270, 100, 2],
	[495,  70, 1],
	[195,  90, 2],
	[370,  60,-1],
	[100,  80, 2],
	[420, 100, 2],
	[185,  70, 1],
	[500,  90,-1],
	[315,  70, 1],
	[570, 100, 2],
	[330, 160, 0]
];

F2Basamak = function(_adim)
{
	var _p = makeplatform(_adim[0],505,_adim[1],0,-mavi_hiz,1,0);
	_p.auto_destroy_dir = DIR.UP;
	if (_adim[2] == 2)
	{
		F2PlatDuvar(_p,_adim[1],44);
	}
	else if (_adim[2] != 0)
	{
		F2PlatKemik(_p,_adim[1],_adim[2],44);
	}
	return _p;
};

F2PlatKemik = function(_plat,_gen,_yon,_boy)
{
	var _sol = _plat.x-_gen/2+10;
	var _sag = _plat.x+_gen/2-10;
	var _bas = (_yon < 0) ? _sol : _sag;
	var _deg = (_yon < 0) ? (_sag-_sol) : (_sol-_sag);
	var _sure = max(45,abs(_deg)/1.2);

	var _b = RegularBone(_bas,_plat.y-6,_boy,0,-mavi_hiz,0,0,0,1,1,0,0,0,true);
	Anim_Create(_b,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,_bas,_deg,_sure,0,0,0,ANIM_MODE.PINGPONG);
	return _b;
};

F2PlatDuvar = function(_plat,_gen,_boy)
{
	var _kul = _gen-28;
	var _n = max(2,floor(_kul/30)+1);
	var _ara = _kul/(_n-1);
	for (var _i = 0; _i < _n; _i++)
	{
		RegularBone(_plat.x-_kul/2+_i*_ara,_plat.y-6,_boy,0,-mavi_hiz,0,0,0,1,1,0,0,0,true);
	}
};

F2LabBlaster = function(_kenar)
{
	var _sx = 320;
	var _sy = 240;
	if (instance_exists(battle_soul))
	{
		_sx = battle_soul.x;
		_sy = battle_soul.y;
	}
	switch (_kenar)
	{
		case 0:  return RegularBlaster(-80,_sy, 70,_sy,  0,  0,30,25,2,2,40);
		case 1:  return RegularBlaster(720,_sy,570,_sy,180,180,30,25,2,2,40);
		case 2:  return RegularBlaster(_sx,-80,_sx, 60,270,270,30,25,2,2,40);
		default: return RegularBlaster(_sx,620,_sx,440, 90, 90,30,25,2,2,40);
	}
};

F2MaviBasla = function()
{
	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = battle_board.x;
	battle_soul.y = 292;
	battle_soul.dir = 270;
	battle_soul.jump_state = 2;

	battle_soul.jump_speed = 6.6;

	battle_soul.moveable = 1;

	if (instance_exists(mavi_ilk)) { mavi_ilk.move_y = -mavi_hiz; }

	mavi_on = true;
	mavi_t = 0;
	mavi_adim = 0;
	mavi_gecis = -1;
	mavi_final = false;
	final_t = 0;
	final_beyaz = 0;
	final_beyaz_hedef = 0;
	final_bitis = -1;
	final_dus1 = false;
	final_hiz = 0;
	final_kay = 0;
	final_kutu = false;
	sahte_on = false;
	mavi_son = noone;
};

F2MaviOlum = function()
{
	if (!mavi_on) { return; }
	mavi_on = false;
	Player_SetHp(1);
	Battle_CallSoulEventHurt();
	Camera_Shake(6,6,6,6);
};

F2MaviBitir = function()
{
	mavi_on = false;
	sf_bekle = 50;
	F2SeritDur();
	with (battle_platform1) { instance_destroy(); }
	with (battle_regularbone) { instance_destroy(); }
	with (o_alphys_spear) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
};


can_onceki = -1;
can_alpha = 0;
can_bekle = 0;
can_bekle_max = 45;
can_sonme = 0.03;


F2SinirDuvar = function(_ust,_n,_boy,_sapma)
{
	var _y = _ust ? (20-_boy/2) : (460+_boy/2);
	for (var _i = 0; _i < _n; _i++)
	{
		var _x = (640/_n)*(_i+0.5);
		var _a = (_sapma > 0) ? irandom_range(-_sapma,_sapma) : 0;
		array_push(mavi_sinir,RegularBone(_x,_y,_boy,0,0,_a,0,1,1,0,1,0,0,false));
	}
};

F2SinirlariKur = function()
{
	mavi_sinir = [];
	F2SinirDuvar(true,34,24,30);
	F2SinirDuvar(false,34,24,30);
};


mavi_gecis = -1;

F2MaviKay = function()
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(320,400,320,320,1);

	F2SinirlariKur();
	F2SeritBasla();

	mavi_ilk = makeplatform(battle_board.x,320,160,0,0,1,0);
	mavi_ilk.auto_destroy_dir = DIR.UP;

	if (instance_exists(battle_soul))
	{
		battle_soul.moveable = 0;
		Anim_Create(battle_soul,"x",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.x,battle_board.x-battle_soul.x,40);
		Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.y,292-battle_soul.y,40);
	}
	audio_play_sound(snd_bell,0,false);
	mavi_gecis = 40;
};


mavi_sinir = [];
mavi_final = false;
final_t = 0;
final_beyaz = 0;
final_beyaz_hedef = 0;
final_beyaz_ac = 1/16;
final_beyaz_kapa = 1/30;
final_dus1 = false;
final_kutu = false;
sahte_on = false;
sahte_y = -40;
sahte_hiz = 0;
final_hiz = 0;
final_ivme = 0.15;
final_dip = 375;
final_kay = 0;
final_kay_x = 0;
final_kay_y = 0;
final_bitis = -1;
mavi_son = noone;

F2SinirSondur = function()
{
	for (var _i = 0; _i < array_length(mavi_sinir); _i++)
	{
		var _b = mavi_sinir[_i];
		if (instance_exists(_b))
		{
			Anim_Destroy(_b,"_alpha");
			Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,1,-1,40);
		}
	}
};

F2MaviFinal = function()
{
	mavi_final = true;
	F2SinirSondur();

	with (battle_regularbone)
	{
		if (vspeed != 0) { instance_destroy(); }
	}
	with (o_alphys_spear) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
};

F2FinalKirmizi = function()
{
	Battle_SetSoul(battle_soul_red);
	battle_soul.moveable = 0;

	final_kay = 45;
	final_kay_x = (320-battle_soul.x)/45;
	final_kay_y = (240-battle_soul.y)/45;
};

F2FinalBeyaz = function()
{
	rgb_shake1(10,1,90);
	Camera_Shake(6,6,2,2);
	audio_play_sound(snd_noise,1,false);
	final_beyaz_hedef = 1;
};

F2FinalIn = function()
{
	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = 320;
	battle_soul.y = 240;
	battle_soul.moveable = 0;
	battle_soul.dir = 270;
	battle_soul.jump_state = 2;
	final_dus1 = true;
	final_hiz = 0;
	audio_play_sound(snd_stab,2,false);
};


F2FinalTemizle = function()
{
	with (battle_platform1) { instance_destroy(); }
	with (battle_regularbone) { instance_destroy(); }
	with (o_alphys_spear) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	F2SeritDur();
};

F2FinalSahne = function()
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");

	Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT,0);

	final_kutu = true;

	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = battle_board.x;
	battle_soul.y = final_dip;
	battle_soul.dir = DIR.DOWN;
	battle_soul.moveable = 0;

	sahte_on = true;
	sahte_y = -40;
	sahte_hiz = 0;
};

F2FinalAcil = function()
{
	sahte_on = false;
	battle_soul.moveable = 1;
	Camera_Shake(8,8,1,1,1,1);
	final_beyaz_hedef = 0;
	with (obj_rgb) { instance_destroy(); }
	Camera_Shake(5,5,3,3);
	audio_play_sound(snd_stab,2,false);
	final_bitis = 60;
};


sf_on = false;
sf_t = 0;
sf_bekle = -1;

sf_grad = 1;
sf_grad_hedef = 1;

sfb_on = false;

sf_kay_on = false;
sf_kay_hiz = 9;
sf_kay_uc = 620;
sf_kay_bekle = 0;
sf_kay_dur = 0;

sf_mavi_gorunum = false;

SF_KARE_U = 88;  SF_KARE_D = 66;  SF_KARE_L = 77;  SF_KARE_R = 77;
SF_KOR_U  = 50;  SF_KOR_D  = 43;  SF_KOR_L  = 340; SF_KOR_R  = 340;
SF_KOR_YARIM_R = 85;

sf_cz = 1.2;

sf_ken = [];
for (var _i = 0; _i < 4; _i++)
{
	array_push(sf_ken,{ v0 : 0, v1 : 0, t : 0, sure : 1, on : false });
}

sf_uy = [];
sf_tk = [];

SF_KOR_HIZ = 15.1;
SF_KOR_X = 645;
sf_dalga_i = 0;
sf_huni_i = 0;

sf_bl_on = false;
sf_bl_aci = 350;
SF_BL_R = 190;
SF_BL_DON = 2.7;
SF_BL_DUR = 1775;
SF_BL_BITIS = 1925;

SF_KARA = 25;

sf_slam = [DIR.RIGHT,DIR.DOWN,DIR.LEFT];

sf_dlg = -1;
sf_dlg_bekle = -1;
sf_toz_pap = -1;
sf_toz_alp = -1;

sf_dag = [];

SF_DAG_BLOK = 2;

SF_DAG_SUPUR = 54;
SF_DAG_OMUR = 52;
SF_DAG_TAM = 10;
SF_DAG_YUK = 0.55;
SF_DAG_YAN = 0.40;
SF_DAG_SAL = 1.0;
sf_toz_sure = SF_DAG_SUPUR+SF_DAG_OMUR;

sf_dlg_metin =
[
	"{speaker 0}{font 3}{voice 3}{head 20}*huff*...{pause} *puff*...{pause}{clear}{head 21}Freak...!{pause}{clear}{head 20}W-... What's wrong&with you?!{pause}{clear}{head 21}Why can't I win?!",
	"{speaker 1}{font 4}{voice 4}{pap_head 4}HEY...{pause} SANS...?",
	"{speaker 0}{font 3}{voice 3}{head 25}Papyrus?",
	"{speaker 1}{font 4}{voice 4}{pap_head 1}LOOKS LIKE... I&USED UP ALL MY&MAGIC...{pause}{clear}IN THAT LAST&ATTACK.{pause}{clear}AND FOR GOOD&THIS TIME.{pause}{clear}I CAN'T GO ON&LIKE THIS.{pause}{clear}...{pause}{clear}{pap_head 4}SORRY, PAL...{pause}{clear}IT'S ALL UP TO&YOU NOW.",
	"{speaker 2}{font 2}{voice 2}{alp_head 5}W-... Weakling!{pause}{clear}{alp_head 1}I have... more than&enough magic to...&to...{pause}{clear}{alp_head 0}...",
	"{speaker 0}{font 3}{voice 3}{head 25}Alphys?",
	"{speaker 2}{font 2}{voice 2}{alp_head 0}Dang it...{pause}{clear}Sans...{pause}{clear}{alp_head 1}As your captain...&I have one last&order...{pause}{clear}Don't fail.",
];


F2SfKutu = function(_u,_d,_l,_r)
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	for (var _i = 0; _i < 4; _i++) { sf_ken[_i].on = false; }
	Battle_SetBoardSizeCubic(_u,_d,_l,_r,0);
};

F2SfKen = function(_i,_hedef,_sure)
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	var _k = sf_ken[_i];
	switch (_i)
	{
		case 0: _k.v0 = battle_board.up;    break;
		case 1: _k.v0 = battle_board.down;  break;
		case 2: _k.v0 = battle_board.left;  break;
		case 3: _k.v0 = battle_board.right; break;
	}
	_k.v1 = _hedef;
	_k.t = 0;
	_k.sure = max(1,_sure);
	_k.on = true;
};

F2SfUyari = function(_yon,_kal,_sure)
{
	array_push(sf_uy,{ yon : _yon, kal : _kal, kalan : _sure });
};

F2SfUyKal = function(_yon)
{
	return ((_yon == DIR.UP) or (_yon == DIR.DOWN)) ? 45 : 40;
};

F2SfSlam = function(_yon)
{
	audio_play_sound(snd_impact,2,false);
	if (_yon == DIR.LEFT)  { Battle_SlamLeft();  }
	if (_yon == DIR.RIGHT) { Battle_SlamRight(); }
	if (_yon == DIR.UP)    { Battle_SlamUp();    }
	if (_yon == DIR.DOWN)  { Battle_SlamDown();  }
};

#macro SF_KOSE_PAY 16

F2SfKoseIsin = function(_k1,_k2)
{
	if (!instance_exists(battle_soul)) { return; }
	var _sol = battle_board.x-battle_board.left;
	var _sag = battle_board.x+battle_board.right;
	var _tep = battle_board.y-battle_board.up;
	var _dip = battle_board.y+battle_board.down;
	var _px = battle_soul.x;
	var _py = battle_soul.y;
	var _ke = [_k1,_k2];
	for (var _i = 0; _i < 2; _i++)
	{
		switch (_ke[_i])
		{
			case DIR.LEFT:  _px = _sol+SF_KOSE_PAY; break;
			case DIR.RIGHT: _px = _sag-SF_KOSE_PAY; break;
			case DIR.UP:    _py = _tep+SF_KOSE_PAY; break;
			case DIR.DOWN:  _py = _dip-SF_KOSE_PAY; break;
		}
	}
	battle_soul.x = _px;
	battle_soul.y = _py;
};

F2SfUyariAlan = function(_u)
{
	var _sol = battle_board.x-battle_board.left;
	var _sag = battle_board.x+battle_board.right;
	var _tep = battle_board.y-battle_board.up;
	var _dip = battle_board.y+battle_board.down;
	if (_u.yon == DIR.LEFT)  { _sag = _sol+_u.kal; }
	if (_u.yon == DIR.RIGHT) { _sol = _sag-_u.kal; }
	if (_u.yon == DIR.UP)    { _dip = _tep+_u.kal; }
	if (_u.yon == DIR.DOWN)  { _tep = _dip-_u.kal; }
	_sol = max(_sol,0); _sag = min(_sag,639);
	return { l : _sol, r : _sag, u : _tep, d : _dip };
};

F2SfTarakKemik = function(_yon)
{
	var _sol = battle_board.x-battle_board.left;
	var _sag = battle_board.x+battle_board.right;
	var _tep = battle_board.y-battle_board.up;
	var _dip = battle_board.y+battle_board.down;
	var _dikey = (_yon == DIR.LEFT) or (_yon == DIR.RIGHT);

	var _sx = 0, _sy = 0, _aci = 0;
	if (_yon == DIR.LEFT)  { _sx = _sol; _aci = 270; }
	if (_yon == DIR.RIGHT) { _sx = _sag; _aci = 90; }
	if (_yon == DIR.UP)    { _sy = _tep; _aci = 180; }
	if (_yon == DIR.DOWN)  { _sy = _dip; _aci = 0; }

	if (_dikey) { _tep = max(_tep,-6); _dip = min(_dip,486); }
	else        { _sol = max(_sol,-6); _sag = min(_sag,646); }

	var _uz = _dikey ? (_dip-_tep) : (_sag-_sol);
	var _n = max(2,round(_uz/12)+1);
	var _l = [];
	for (var _i = 0; _i < _n; _i++)
	{
		var _p = _i/(_n-1);
		var _bx = _sx;
		var _by = _sy;
		if (_dikey) { _by = lerp(_tep,_dip,_p); }
		else        { _bx = lerp(_sol,_sag,_p); }
		array_push(_l,RegularBone(_bx,_by,1,0,0,_aci,0,1,1,0,0,0,0,false));
	}
	return _l;
};

F2SfTarak = function(_yon,_derin,_gir,_tut,_cik)
{
	array_push(sf_tk,{
		yon : _yon, derin : _derin, t : 0,
		gir : max(1,_gir), tut : _tut, cik : _cik,
		kemik : F2SfTarakKemik(_yon)
	});
};

F2SfSil = function(_liste)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { instance_destroy(_liste[_i]); }
	}
};

F2SfTarakTemizle = function()
{
	for (var _i = 0; _i < array_length(sf_tk); _i++) { F2SfSil(sf_tk[_i].kemik); }
	sf_tk = [];
	sf_uy = [];
};

F2SfSuzul = function(_mx,_asagi)
{
	var _y = _asagi ? -5 : 485;
	var _v = _asagi ? 5.56 : -5.56;
	return RegularBone(_mx,_y,198*sf_cz,0,_v,90,0,1,1,0,1,0,0,true);
};

F2SfKorCift = function(_tip,_bos)
{
	var _tep = battle_board.y-battle_board.up;
	var _dip = battle_board.y+battle_board.down;
	var _ust = _tip-_tep;
	var _alt = _dip-(_tip+_bos);
	if (_ust > 2) { RegularBone(SF_KOR_X,_tep,_ust*sf_cz,-SF_KOR_HIZ,0,180,0,1,1,0,0,0,0,true); }
	if (_alt > 2) { RegularBone(SF_KOR_X,_dip,_alt*sf_cz,-SF_KOR_HIZ,0,0,0,1,1,0,0,0,0,true); }
};

F2SfKorDalga = function(_i)
{
	F2SfKorCift(299.5+24.5*dcos((_i-3)*(360/13)),36);
};

F2SfKorUclu = function(_ust)
{
	var _y = _ust ? (battle_board.y-battle_board.up) : (battle_board.y+battle_board.down);
	var _a = _ust ? 180 : 0;
	var _boy = _ust ? 49 : 48;
	for (var _i = 0; _i < 3; _i++)
	{
		RegularBone(SF_KOR_X+_i*15,_y,_boy*sf_cz,-SF_KOR_HIZ,0,_a,0,1,1,0,0,0,0,true);
	}
};

F2SfHuni = function(_j)
{
	F2SfKorCift(279+_j,76-2*_j);
};

F2SfSiyah = function()
{
	sf_kay_on = false;
	sf_kay_bekle = 0;
	if (instance_exists(battle_enemy_engage)) { battle_enemy_engage.kay_x = 0; }

	with (battle_regularbone) { instance_destroy(); }
	F2SfTarakTemizle();
	fader.color = c_black;
	Fader_Fade(0,1,1);
	audio_play_sound(snd_noise,1,false);
};

F2SfKara = function(_yon,_k1 = -1,_k2 = -1)
{
	fader.color = c_black;
	Fader_Fade(0,1,1);
	audio_play_sound(snd_noise,1,false);
	F2SfSlam(_yon);
	F2SfKoseIsin(_k1,_k2);
};

F2SfKaraBit = function()
{
	Fader_Fade(1,0,1);
	Camera_Shake(4,4,2,2);
};

F2SfSiyahBit = function()
{
	sf_mavi_gorunum = false;
	F2SfKutu(SF_KARE_U,SF_KARE_D,SF_KARE_L,SF_KARE_R);
	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = battle_board.x;
	battle_soul.y = battle_board.y+battle_board.down-8;
	battle_soul.dir = DIR.DOWN;
	battle_soul.jump_state = 0;
	battle_soul.moveable = 1;
	Fader_Fade(1,0,1);
	Camera_Shake(4,4,2,2);
};

F2SfBlaster = function()
{
	var _cx = battle_board.x;
	var _cy = battle_board.y-battle_board.up+(battle_board.up+battle_board.down)/2;
	var _hx = _cx+lengthdir_x(SF_BL_R,sf_bl_aci);
	var _hy = _cy+lengthdir_y(SF_BL_R,sf_bl_aci);
	var _bx = _cx+lengthdir_x(400,sf_bl_aci);
	var _by = _cy+lengthdir_y(400,sf_bl_aci);
	RegularBlaster(_bx,_by,_hx,_hy,point_direction(_bx,_by,_cx,_cy),
		point_direction(_hx,_hy,_cx,_cy),20,5,0.9,1.5,30);
};

F2SfHalka = function()
{
	sf_bl_on = true;
	sf_bl_aci = 350;
};

F2SfBasla = function()
{
	F2SfKutu(SF_KARE_U,SF_KARE_D,SF_KARE_L,SF_KARE_R);
	Battle_SetSoul(battle_soul_red);
	battle_soul.x = battle_board.x;
	battle_soul.y = battle_board.y;
	battle_soul.moveable = 1;

	sfb_on = false;

	sf_slam = [DIR.UP,DIR.DOWN,DIR.LEFT,DIR.RIGHT];
	for (var _i = array_length(sf_slam)-1; _i > 0; _i--)
	{
		var _j = irandom(_i);
		var _gec = sf_slam[_i];
		sf_slam[_i] = sf_slam[_j];
		sf_slam[_j] = _gec;
	}

	can_alpha = 0;
	can_bekle = 0;

	sf_grad_hedef = 0;
	sf_on = true;
	sf_t = 0;
	sf_dalga_i = 0;
	sf_huni_i = 0;
	audio_play_sound(snd_bell,0,false);
};


F2SfDagHazirla = function(_dg)
{
	for (var _pi = 0; _pi < array_length(_dg.parca); _pi++)
	{
		var _p = _dg.parca[_pi];
		var _w = sprite_get_width(_p.spr);
		var _h = sprite_get_height(_p.spr);

		var _buf = -1;
		var _srf = surface_create(_w,_h);
		if (surface_exists(_srf))
		{
			surface_set_target(_srf);
			draw_clear_alpha(c_black,0);
			draw_sprite(_p.spr,_p.img,sprite_get_xoffset(_p.spr),sprite_get_yoffset(_p.spr));
			surface_reset_target();
			_buf = buffer_create(_w*_h*4,buffer_fixed,1);
			buffer_get_surface(_buf,_srf,0);
			surface_free(_srf);
		}

		var _bx = [], _by = [], _wx = [], _wy = [], _vx = [], _vy = [], _bek = [];
		var _cos = dcos(_p.aci), _sin = dsin(_p.aci);

		for (var _y = 0; _y < _h; _y += SF_DAG_BLOK)
		{
			for (var _x = 0; _x < _w; _x += SF_DAG_BLOK)
			{
				var _dolu = (_buf < 0);
				if (!_dolu)
				{
					var _y2 = min(_y+SF_DAG_BLOK,_h);
					var _x2 = min(_x+SF_DAG_BLOK,_w);
					for (var _jy = _y; (_jy < _y2) and (!_dolu); _jy++)
					{
						for (var _jx = _x; _jx < _x2; _jx++)
						{
							if (buffer_peek(_buf,(_jy*_w+_jx)*4+3,buffer_u8) > 40)
							{
								_dolu = true;
								break;
							}
						}
					}
				}
				if (!_dolu) { continue; }

				var _ox = (_x-_p.xoff)*_p.ex;
				var _oy = (_y-_p.yoff)*_p.ey;
				var _pwx = _p.px+_ox*_cos+_oy*_sin;
				var _pwy = _p.py-_ox*_sin+_oy*_cos;

				var _o = clamp((_pwy-_dg.ust)/_dg.boy,0,1);

				array_push(_bx,_x);
				array_push(_by,_y);
				array_push(_wx,_pwx);
				array_push(_wy,_pwy);
				array_push(_vx,random_range(-SF_DAG_YAN,SF_DAG_YAN)
					+sign(_pwx-_dg.mx)*random_range(0,SF_DAG_YAN*0.6));
				array_push(_vy,-random_range(SF_DAG_YUK*0.35,SF_DAG_YUK*1.5));
				array_push(_bek,_o*SF_DAG_SUPUR);
			}
		}

		if (_buf >= 0) { buffer_delete(_buf); }

		_p.bx = _bx; _p.by = _by;
		_p.wx = _wx; _p.wy = _wy;
		_p.vx = _vx; _p.vy = _vy;
		_p.bek = _bek;
	}
	_dg.hazir = true;
};

F2SfToz = function(_pap)
{
	var _e = battle_enemy_engage;
	var _kay = _e.x-320;
	var _py = _e.y;
	var _bx = _pap ? (_e.pap_draw_x+_e.pap_shake_x+_e.kay_x+_kay)
	               : (_e.alp_draw_x+_e.alp_shake_x+_e.kay_x+_kay);
	var _bob = _pap ? _e.pap_bob : _e.alp_bob;

	var _par = [];
	var _yap = function(_spr,_img,_px,_py,_xo,_yo,_ex,_ey,_aci)
	{
		return { spr:_spr, img:_img, px:_px, py:_py, xoff:_xo, yoff:_yo,
		         ex:_ex, ey:_ey, aci:_aci,
		         bx:[], by:[], wx:[], wy:[], vx:[], vy:[], bek:[] };
	};

	if (_pap)
	{
		var _hs = _e.pap_head_sprite, _bs = _e.pap_body_sprite;
		var _ls = _e.pap_legs_sprite, _as = _e.pap_arm_sprite;
		array_push(_par,_yap(_ls,_e.pap_legs_image,_bx-68,_py-100+_bob,
			0,0,136/sprite_get_width(_ls),100/sprite_get_height(_ls),0));
		array_push(_par,_yap(_as,_e.pap_arm_image,_bx-50,_py-110+_bob,
			sprite_get_xoffset(_as),sprite_get_yoffset(_as),2,2,_e.pap_arm_angle));
		array_push(_par,_yap(_bs,_e.pap_body_image,_bx-8,_py-86+_bob,
			sprite_get_xoffset(_bs),sprite_get_yoffset(_bs),2,2,0));
		array_push(_par,_yap(_hs,_e.pap_head_image,_bx-14,_py-164+_bob,
			sprite_get_xoffset(_hs),sprite_get_yoffset(_hs),2,2,0));
	}
	else
	{
		var _ahs = _e.alp_head_sprite, _abs = _e.alp_body_sprite;
		var _alz = _e.alp_armleft_sprite, _arz = _e.alp_armright_sprite;
		array_push(_par,_yap(_arz,0,_bx+46,_py-74+_bob,
			sprite_get_xoffset(_arz),sprite_get_yoffset(_arz),2,2,_e.alp_armright_angle));
		array_push(_par,_yap(_abs,_e.alp_body_image,_bx-66,_py-122+_bob,
			0,0,134/sprite_get_width(_abs),122/sprite_get_height(_abs),0));
		array_push(_par,_yap(_ahs,_e.alp_head_image,_bx+22,_py-94+_bob,
			sprite_get_xoffset(_ahs),sprite_get_yoffset(_ahs),2,2,0));
		if (_e.alp_eye_visible)
		{
			var _es = _e.alp_eye_sprite;
			array_push(_par,_yap(_es,_e.alp_eye_image,_bx+54,_py-122+_bob,
				sprite_get_xoffset(_es),sprite_get_yoffset(_es),2,2,0));
		}
		array_push(_par,_yap(_alz,0,_bx-2,_py-96+_bob,
			sprite_get_xoffset(_alz),sprite_get_yoffset(_alz),2,2,_e.alp_armleft_angle));
	}

	var _ust = _py;
	for (var _i = 0; _i < array_length(_par); _i++)
	{
		var _p = _par[_i];
		var _pw = sprite_get_width(_p.spr)*_p.ex;
		var _ph = sprite_get_height(_p.spr)*_p.ey;
		var _c = dcos(_p.aci), _s = dsin(_p.aci);
		for (var _k = 0; _k < 4; _k++)
		{
			var _ox = ((_k == 1) or (_k == 2)) ? (_pw-_p.xoff*_p.ex) : (-_p.xoff*_p.ex);
			var _oy = (_k >= 2) ? (_ph-_p.yoff*_p.ey) : (-_p.yoff*_p.ey);
			_ust = min(_ust,_p.py-_ox*_s+_oy*_c);
		}
	}

	array_push(sf_dag,{
		t : 0, hazir : false, parca : _par,
		ust : _ust, boy : max(1,_py-_ust), mx : _bx
	});

	if (_pap) { _e.pap_alpha = 0; sf_toz_pap = sf_toz_sure; }
	else      { _e.alp_alpha = 0; sf_toz_alp = sf_toz_sure; }
	audio_play_sound(snd_vaporize,0,false);
};

F2SfBitir = function()
{
	sf_bl_on = false;
	F2SfTarakTemizle();
	with (battle_regularbone) { instance_destroy(); }
	with (o_alphys_spear) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
	with (battle_blaster_circle_setup) { instance_destroy(); }

	Fader_Fade(-1,0,10);

	F2SfKutu(45,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
	sf_on = false;
	sfb_on = false;
	battle_enemy_engage.p2_legs_alpha = 1;

	battle_enemy_engage.p2_head_sprite = spr_p2_head;
	sf_dlg = 0;
};

#macro T20_YV_BAS      1650
#macro T20_BEYAZ_GIRIS    5
#macro T20_BEYAZ_ACIL  2030
#macro T20_BEYAZ_CIKIS   45
#macro T20_DUSUS_SURE   120
#macro T20_YV_TOPARLA    26
#macro T20_YV_KOL         2
#macro T20_YV_UZUN       74

t20_yv = [
	{ kalk:38, bekle: 8, buyuk:false },
	{ kalk:34, bekle:10, buyuk:false },
	{ kalk:30, bekle:12, buyuk:false },
	{ kalk:52, bekle:78, buyuk:true  },
];

t20_catlak = [
	{ kol: 7, uz:  22, sap:38, don: 0  },
	{ kol: 8, uz:  58, sap:27, don:23  },
	{ kol: 9, uz:  98, sap:21, don:11  },
	{ kol:12, uz:  -1, sap:14, don: 7  },
];

catlak_ox = 0;
catlak_oy = 0;

yv_on = false;
yv_no = 0;
yv_asama = 0;
yv_t = 0;
catlaklar = [];

CatlakKirp = function(_x1,_y1,_x2,_y2,_l,_u,_r,_d)
{
	if (_r <= _l) or (_d <= _u) { return undefined; }
	var _dx = _x2-_x1, _dy = _y2-_y1;
	var _t0 = 0, _t1 = 1;
	var _pp = [-_dx,_dx,-_dy,_dy];
	var _qq = [_x1-_l,_r-_x1,_y1-_u,_d-_y1];
	for (var _i = 0; _i < 4; _i++)
	{
		if (_pp[_i] == 0)
		{
			if (_qq[_i] < 0) { return undefined; }
		}
		else
		{
			var _t = _qq[_i]/_pp[_i];
			if (_pp[_i] < 0)
			{
				if (_t > _t1) { return undefined; }
				if (_t > _t0) { _t0 = _t; }
			}
			else
			{
				if (_t < _t0) { return undefined; }
				if (_t < _t1) { _t1 = _t; }
			}
		}
	}
	return { x1:_x1+_t0*_dx, y1:_y1+_t0*_dy, x2:_x1+_t1*_dx, y2:_y1+_t1*_dy };
};

CatlakMenzil = function(_ox,_oy,_aci)
{
	var _dx = dcos(_aci), _dy = -dsin(_aci);
	var _t = 9999;
	if (_dx >  0.001) { _t = min(_t,( battle_board.right-_ox)/_dx); }
	if (_dx < -0.001) { _t = min(_t,(-battle_board.left -_ox)/_dx); }
	if (_dy >  0.001) { _t = min(_t,( battle_board.down -_oy)/_dy); }
	if (_dy < -0.001) { _t = min(_t,(-battle_board.up   -_oy)/_dy); }
	return _t;
};

CatlakYayil = function(_asama)
{
	var _a = t20_catlak[min(_asama,array_length(t20_catlak)-1)];
	var _ox = catlak_ox, _oy = catlak_oy;

	for (var _k = 0; _k < _a.kol; _k++)
	{
		var _aci = _k*(360/_a.kol)+random_range(-16,16)+_a.don;
		var _uz = (_a.uz > 0) ? _a.uz*random_range(0.75,1.25)
		                      : CatlakMenzil(_ox,_oy,_aci)*random_range(0.88,1.0);

		var _p = [];
		var _x = _ox+random_range(-3,3), _y = _oy+random_range(-3,3);
		array_push(_p,{ x:_x, y:_y });

		var _n = irandom_range(4,7);
		var _ac = _aci;
		for (var _i = 0; _i < _n; _i++)
		{
			_ac += random_range(-_a.sap,_a.sap);
			var _l = (_uz/_n)*random_range(0.7,1.3);
			var _nx = _x+lengthdir_x(_l,_ac);
			var _ny = _y+lengthdir_y(_l,_ac);
			var _disi = (_nx < -battle_board.left+2) or (_nx > battle_board.right-2)
			         or (_ny < -battle_board.up+2)   or (_ny > battle_board.down-2);
			_x = clamp(_nx,-battle_board.left+2,battle_board.right-2);
			_y = clamp(_ny,-battle_board.up+2,battle_board.down-2);
			array_push(_p,{ x:_x, y:_y });
			if (_disi) { break; }
		}
		array_push(catlaklar,{ p:_p, t:0, hiz:random_range(0.10,0.18) });

		var _sonnokta = array_length(_p)-1;
		if (_a.uz != 0) and (irandom(2) == 0) and (_sonnokta >= 2)
		{
			var _d = [];
			var _di = irandom_range(1,_sonnokta);
			var _dx = _p[_di].x, _dy = _p[_di].y;
			var _da = _ac+choose(-1,1)*random_range(40,80);
			array_push(_d,{ x:_dx, y:_dy });
			for (var _j = 0; _j < 2; _j++)
			{
				_da += random_range(-20,20);
				var _dl = abs(_uz)*random_range(0.14,0.26);
				var _ndx = _dx+lengthdir_x(_dl,_da);
				var _ndy = _dy+lengthdir_y(_dl,_da);
				var _ddisi = (_ndx < -battle_board.left+2) or (_ndx > battle_board.right-2)
				          or (_ndy < -battle_board.up+2)   or (_ndy > battle_board.down-2);
				_dx = clamp(_ndx,-battle_board.left+2,battle_board.right-2);
				_dy = clamp(_ndy,-battle_board.up+2,battle_board.down-2);
				array_push(_d,{ x:_dx, y:_dy });
				if (_ddisi) { break; }
			}
			array_push(catlaklar,{ p:_d, t:0, hiz:random_range(0.08,0.14) });
		}
	}
};

YvCarp = function(_buyuk)
{
	CatlakYayil(yv_no);
	if (_buyuk)
	{
		Camera_Shake(9,9,3,3,6,6,0.28,0.28);
		audio_play_sound(snd_bighit,3,false);
		fader.color = c_white;
		Fader_Fade(0,1,T20_BEYAZ_GIRIS);
	}
};

YvAdim = function()
{
	if (!yv_on) { return; }
	if (!instance_exists(o_smaaash)) { return; }

	yv_t += 1;
	var _v = t20_yv[min(yv_no,array_length(t20_yv)-1)];

	switch (yv_asama)
	{
		case 0:
			o_smaaash.image_index = min(6,6*(yv_t/_v.kalk));
			if (yv_t >= _v.kalk) { yv_asama = 1; yv_t = 0; }
			break;

		case 1:
			o_smaaash.image_index = 6;
			if (yv_t >= _v.bekle)
			{
				yv_asama = 2; yv_t = 0;
				o_smaaash.image_index = 7;
				YvCarp(_v.buyuk);
			}
			break;

		case 2:
			o_smaaash.image_index = min(9,7+yv_t/9);
			if (yv_t >= T20_YV_TOPARLA)
			{
				yv_no += 1; yv_asama = 0; yv_t = 0;
				if (yv_no >= array_length(t20_yv)) { yv_on = false; }
			}
			break;
	}
};

CatlakAdim = function()
{
	for (var _i = 0; _i < array_length(catlaklar); _i++)
	{
		catlaklar[_i].t = min(1,catlaklar[_i].t+catlaklar[_i].hiz);
	}
};

#macro T20_VOID_BAS   2016
#macro T20_VOID_SON   5300
#macro T20_SIRA_SLOT     8
#macro T20_SIRA_ARA_A   86
#macro T20_SIRA_ARA_B   54
#macro T20_SIRA_HIZ_A  4.4
#macro T20_SIRA_HIZ_B  7.2
#macro T20_SANS_DUSUS  2110

void_on = false;
void_t = 0;
void_sonraki = 0;
void_bos = floor(T20_SIRA_SLOT/2);
catlak_alpha = 1;

VoidOran = function()
{
	return clamp(void_t/(T20_VOID_SON-T20_VOID_BAS),0,1);
};


VoidKir = function()
{
	Camera_Shake(12,12,4,4,7,7,0.22,0.22);
	audio_play_sound(snd_bighit,3,false);
	audio_play_sound(snd_noise,1,false);
	with (battle_regularbone) { instance_destroy(); }

	Anim_Create(id,"catlak_alpha",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,1,-1,22);

	if (instance_exists(o_bg_gradient))
	{
		Anim_Create(o_bg_gradient,"image_alpha",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,
			o_bg_gradient.image_alpha,-o_bg_gradient.image_alpha,26);
	}

	Battle_SetBoardSizeCubic(battle_board.y+12,492-battle_board.y,
		battle_board.x+12,652-battle_board.x,30);
	battle_board.alpha_bg = 1;
	Anim_Create(battle_board,"alpha_frame",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,
		battle_board.alpha_frame,-battle_board.alpha_frame,22);
	Battle_SetSoul(battle_soul_red);
	F2SeritBasla();

	void_on = true;
	void_t = 0;
	void_sonraki = 40;
};

VoidAdim = function()
{
	if (!void_on) { return; }
	void_t += 1;
	F2SeritAdim(1);
};

VoidBitir = function()
{
	CemberTemizle();
	// Void kapanirken de acilistaki gibi bir ugultu olsun
	audio_play_sound(snd_noise,1,false);
	void_on = false;
	F2SeritDur();
	with (battle_regularbone) { instance_destroy(); }
	Battle_SetBoardSizeCubic(65,65,130,130,54);
	Anim_Create(battle_board,"alpha_frame",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,
		battle_board.alpha_frame,1-battle_board.alpha_frame,28);
	if (instance_exists(o_bg_gradient))
	{
		Anim_Create(o_bg_gradient,"image_alpha",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,
			o_bg_gradient.image_alpha,1-o_bg_gradient.image_alpha,34);
	}
};

#macro T20_GB_GELIS   2380
#macro T20_GB_GOZ     2500
#macro T20_GB_Y         64

GbGelis = function()
{
	with (o_p1final_sansgbfront)
	{
		manuel = true;
		isittimeyet = false;
		sprite_index = s_p1final_sansgbfront;
		image_index = 0;
		x = 224;  y = 608;
		target_x = 224;
		target_y = T20_GB_Y;
		move_speedy = 0.045;
		image_alpha = 1;
	}
	with (o_p1final_gbtop) { manuel = true; }
	audio_play_sound(snd_swift,2,false);
};

GbGoz = function()
{
	with (o_p1final_sansgbfront)
	{
		sprite_index = s_p1final_sansgbfront_1;
		image_index = 0;
		instance_create_layer(x+50,y+43,"Instances_2",o_eyeshine);
	}
	audio_play_sound(snd_eye,2,false);
	Camera_Shake(4,4,2,2);
};

#macro T20_CEM_BAS    2560
#macro T20_CEM_ADET      5
#macro T20_CEM_ARA      144
#macro T20_CEM_KEMIK    11
#macro T20_CEM_R0       46
#macro T20_CEM_HIZ    0.75
#macro T20_CEM_DON     1.1
#macro T20_CEM_BOY      72
#macro T20_CEM_OMUR    760
#macro T20_CEM_SON    3620

cember = [];
cem_no = 0;

CemberMerkez = function()
{
	if (instance_exists(o_p1final_sansgbfront))
	{
		return { x : o_p1final_sansgbfront.x+94, y : o_p1final_sansgbfront.y+150 };
	}
	return { x : 320, y : 184 };
};

CemberEkle = function(_yon)
{
	var _m = CemberMerkez();
	var _c = { kemik : [], r : T20_CEM_R0, aci : random(360), yon : _yon, t : 0 };
	for (var _i = 0; _i < T20_CEM_KEMIK; _i++)
	{
		var _a = _c.aci+_i*(360/T20_CEM_KEMIK);
		var _b = RegularBone(_m.x+lengthdir_x(_c.r,_a),_m.y+lengthdir_y(_c.r,_a),
			0,0,0,_a+90,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,T20_CEM_BOY,18);
		array_push(_c.kemik,_b);
	}
	array_push(cember,_c);
	audio_play_sound(snd_exclamation,0,false);
};

CemberSil = function(_i)
{
	var _c = cember[_i];
	for (var _k = 0; _k < array_length(_c.kemik); _k++)
	{
		if (instance_exists(_c.kemik[_k])) { instance_destroy(_c.kemik[_k]); }
	}
	array_delete(cember,_i,1);
};

CemberTemizle = function()
{
	for (var _i = array_length(cember)-1; _i >= 0; _i--) { CemberSil(_i); }
	cember = [];
};

CemberAdim = function()
{
	if (array_length(cember) == 0) { return; }
	var _m = CemberMerkez();
	for (var _i = array_length(cember)-1; _i >= 0; _i--)
	{
		var _c = cember[_i];
		_c.t += 1;
		_c.r += T20_CEM_HIZ;
		_c.aci += _c.yon*T20_CEM_DON;

		var _n = array_length(_c.kemik);
		for (var _k = 0; _k < _n; _k++)
		{
			var _b = _c.kemik[_k];
			if (!instance_exists(_b)) { continue; }
			var _a = _c.aci+_k*(360/_n);
			_b.x = _m.x+lengthdir_x(_c.r,_a);
			_b.y = _m.y+lengthdir_y(_c.r,_a);
			_b._angle = _a+90;
		}

		if (_c.t >= T20_CEM_OMUR) { CemberSil(_i); }
	}
};

#macro T20_P2_BAS     3620
#macro T20_P2_GECIS     70
#macro T20_P2_SON     4900

#macro T20_P2_YELP_ARA  110
#macro T20_P2_YELP_A1   224
#macro T20_P2_YELP_A2   136
#macro T20_P2_YELP_N      9
#macro T20_P2_YELP_HIZ   10

#macro T20_P2_DIK_ARA   150
#macro T20_P2_DIK_DON   2.6

// --- Kor nokta carki --------------------------------------------------------
// Yelpaze kemikleri 136-224 derece arasina gidiyor, isin da agizdan SOLA; yani
// blasterin sagi/arkasi hicbir atagin ulasamadigi bir kor noktaydi.
//
// Cozum: merkezi kutunun SAG KENARININ DISINDA olan, ici bastan asagi kemik
// dolu, tek parca donen bir cark. Carkin sadece sol hilali kutunun icine
// giriyor; geri kalani disarida sirasini bekliyor. Cark dondukce kemikler
// surekli sagdan girip yine sagdan cikiyor -> kor nokta artik kalabalik.
//
//        kutu                      cark merkezi (kutunun disi)
//   +-----------------+ . . . . . . . . o
//   |          [][][] |  <- sadece bu hilal oyun alaninda
//   +-----------------+ . . . . . . . . .
//
// Kemikler cark ile birlikte donuyor, AYRICA her biri kendi ekseninde donuyor.
//
// Performans: kemikler "slot" olarak tutuluyor; bir slot ancak kutunun icine
// girdiginde gercek instance yaratiliyor, cikinca yok ediliyor. Boylece 40+
// slot olsa da ayni anda ~15 kemik instance'i yasiyor. Bu ayni zamanda
// battle_regularbone'un "ekran disina cikinca kendini yok et" kuralina
// takilmayi da onluyor (cark merkezi x ~712, o kural x > 665'te yok ediyor).
#macro T20_KOR_TASMA     60   // cark merkezi kutunun sag kenarindan kac px disarida
#macro T20_KOR_R0        90   // en ic halka yaricapi (TASMA'dan buyuk olmali)
#macro T20_KOR_R1       277   // en dis halka yaricapi -> hilal x 435'e kadar giriyor
#macro T20_KOR_HALKA      5   // halka sayisi
#macro T20_KOR_ARALIK   135   // halka uzerinde kemikler arasi hedef mesafe (px)
#macro T20_KOR_SAP       16   // yaricap sapmasi (dagiisik dursun diye)
#macro T20_KOR_HIZ     0.54   // carkin donus hizi (derece/kare)
#macro T20_KOR_YON       -1   // 1 = saat yonu tersi, -1 = saat yonu
#macro T20_KOR_BOY       52   // kemik uzunlugu
#macro T20_KOR_KENDI    3.0   // kemigin kendi ekseninde donus hizi
#macro T20_KOR_ACIL      10   // kemigin acilma suresi
#macro T20_KOR_BASLA    150   // Gb2 basladiktan kac kare sonra cark kurulsun

kor = [];
kor_aci = 0;

KorMerkez = function()
{
	if (!instance_exists(battle_board)) { return { x : 712, y : 240 }; }
	return {
		x : battle_board.x+battle_board.right+T20_KOR_TASMA,
		y : battle_board.y+(battle_board.down-battle_board.up)/2
	};
};

KorIcerde = function(_x,_y)
{
	if (!instance_exists(battle_board)) { return false; }
	return (_x >= battle_board.x-battle_board.left)
	   and (_x <= battle_board.x+battle_board.right)
	   and (_y >= battle_board.y-battle_board.up)
	   and (_y <= battle_board.y+battle_board.down);
};

KorTemizle = function()
{
	for (var _i = 0; _i < array_length(kor); _i++)
	{
		if (instance_exists(kor[_i].b)) { instance_destroy(kor[_i].b); }
	}
	kor = [];
};

KorKur = function()
{
	KorTemizle();
	kor_aci = 0;
	var _adim = (T20_KOR_R1-T20_KOR_R0)/max(1,T20_KOR_HALKA-1);
	for (var _h = 0; _h < T20_KOR_HALKA; _h++)
	{
		var _r = T20_KOR_R0+_h*_adim;
		var _n = max(3,round(2*pi*_r/T20_KOR_ARALIK));
		var _kay = random(360);
		for (var _i = 0; _i < _n; _i++)
		{
			array_push(kor,{
				b : noone,
				r : _r+random_range(-T20_KOR_SAP,T20_KOR_SAP),
				a : _kay+_i*(360/_n)+random_range(-1,1)*(360/_n)*0.28
			});
		}
	}
	audio_play_sound(snd_exclamation,0,false);
};

KorAdim = function()
{
	if (array_length(kor) == 0) { return; }
	var _m = KorMerkez();
	kor_aci += T20_KOR_YON*T20_KOR_HIZ;

	for (var _i = 0; _i < array_length(kor); _i++)
	{
		var _s = kor[_i];
		var _a = _s.a+kor_aci;
		var _x = _m.x+lengthdir_x(_s.r,_a);
		var _y = _m.y+lengthdir_y(_s.r,_a);

		if (KorIcerde(_x,_y))
		{
			if (!instance_exists(_s.b))
			{
				_s.b = RegularBone(_x,_y,0,0,0,random(360),0,0,1,0,1,0,
					T20_KOR_YON*T20_KOR_KENDI,false);
				Anim_Create(_s.b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,
					0,T20_KOR_BOY,T20_KOR_ACIL);
			}
			_s.b.x = _x;
			_s.b.y = _y;
		}
		else if (instance_exists(_s.b))
		{
			instance_destroy(_s.b);
			_s.b = noone;
		}
	}
};
p2_on = false;
p2_t = 0;
p2_savur = false;
p2_kesti = false;

Gb2Basla = function()
{
	p2_on = true;
	p2_t = 0;

	with (o_p1final_sansgbfront)
	{
		target_x = 760;
		move_speedx = 0.06;
	}

	with (o_p1final_gbtop)
	{
		manuel = true;
		image_alpha = 1;
		image_index = 0;
		x = 820;  y = 160;
		target_x = 470;  target_y = 160;
		move_speedx = 0.045;
		move_speedy = 0.045;
	}
	with (o_p1final_gbbottom) { image_alpha = 1; }
	with (o_p1final_gbsans)
	{
		image_alpha = 1;
		sprite_index = s_p1final_sans;
		image_index = 0;
		image_speed = 0;
	}
	audio_play_sound(snd_swift,2,false);
};

Gb2Yelpaze = function()
{
	if (!instance_exists(o_p1final_gbtop)) { return; }
	var _adim = (T20_P2_YELP_A1-T20_P2_YELP_A2)/max(1,T20_P2_YELP_N-1);
	for (var _i = 0; _i < T20_P2_YELP_N; _i++)
	{
		var _a = T20_P2_YELP_A1-_i*_adim;
		var _b = RegularBone(o_p1final_gbtop.x,o_p1final_gbtop.y,40,0,0,_a+90,0,1,1,0,0,0,0,true);
		_b.direction = _a;
		_b.speed = T20_P2_YELP_HIZ;
	}
	audio_play_sound(snd_stab,2,false);

	if (!isin_on)
	{
		with (o_p1final_gbtop)
		{
			target_x = random_range(400,560);
			target_y = random_range(100,240);
		}
	}
	with (o_p1final_gbsans)
	{
		sprite_index = s_p1final_sans_slash;
		image_index = 0;
		image_speed = 1;
	}
	p2_savur = true;
	p2_kesti = false;
};

Gb2DikKemik = function()
{
	var _x1 = random_range(40,600);
	var _x2 = random_range(40,600);
	RegularBone(_x1,-30,60,0,3.4,270,0,0,1,0,1,0, T20_P2_DIK_DON,true);
	RegularBone(_x2,510,60,0,-3.4,90,0,0,1,0,1,0,-T20_P2_DIK_DON,true);
	audio_play_sound(snd_exclamation,0,false);
};

Gb2Slash = function()
{
	if (!instance_exists(o_p1final_gbsans)) { return; }
	if (!instance_exists(battle_soul)) { return; }
	var _s = instance_create_depth(o_p1final_gbsans.x-102,o_p1final_gbsans.y+56,-99999,o_p1final_sansslash);
	var _d = point_direction(o_p1final_gbsans.x,o_p1final_gbsans.y,battle_soul.x,battle_soul.y);
	_s.direction = _d;
	_s.speed = 7;
	_s.image_angle = _d+180;
};

Gb2Adim = function()
{
	if (!p2_on) { return; }
	p2_t += 1;

	if (p2_t < T20_P2_GECIS) { IsinAdim(); return; }
	var _t = p2_t-T20_P2_GECIS;

	if ((_t mod T20_P2_YELP_ARA) == 0) { Gb2Yelpaze(); }
	if ((_t mod T20_P2_DIK_ARA) == 40) { Gb2DikKemik(); }
	if ((_t mod T20_P2_ISIN_ARA) == 150) { IsinBasla(); }
	if (_t == T20_KOR_BASLA) { KorKur(); }

	if (p2_savur) and (instance_exists(o_p1final_gbsans))
	{
		var _k = floor(o_p1final_gbsans.image_index);
		if (_k >= 6) and (!p2_kesti) { Gb2Slash(); p2_kesti = true; }
		if (_k >= sprite_get_number(s_p1final_sans_slash)-1)
		{
			with (o_p1final_gbsans)
			{
				sprite_index = s_p1final_sans;
				image_index = 0;
				image_speed = 0;
			}
			p2_savur = false;
		}
	}

	IsinAdim();
	KorAdim();
};

Gb2Bitir = function()
{
	p2_on = false;
	IsinDurdur();
	KorTemizle();
};

#macro T20_P2_ISIN_ARA  340
#macro T20_ISIN_ACIL     22
#macro T20_ISIN_TOPLA    28
#macro T20_ISIN_ATES     46
#macro T20_ISIN_KAPAN    18
#macro T20_ISIN_KALIN    54
#macro T20_ISIN_DAIRE    26
#macro T20_ISIN_AGIZ     16
#macro T20_AGIZ_X       -72
#macro T20_AGIZ_Y        92
#macro T20_AGIZ_KAY      40

isin_on = false;

// --- Buyuk blaster ses efektleri --------------------------------------------
// Normal blasterin sesleri (snd_gb_charge / snd_gb_release) pes perdeden
// calinca dev blastere yakisan agir bir ton veriyor.
#macro T20_ISIN_SARJ_PITCH 0.78
#macro T20_ISIN_ATES_PITCH 0.72

isin_sarj_ses = -1;
isin_faz = 0;
isin_t = 0;
isin_x = 0;
isin_y = 0;

IsinAgiz = function()
{
	if (!instance_exists(o_p1final_gbtop)) { return { x : 400, y : 250 }; }
	var _ac = instance_exists(o_p1final_gbbottom) ? o_p1final_gbbottom.agiz : 0;
	return {
		x : o_p1final_gbtop.x+T20_AGIZ_X,
		y : o_p1final_gbtop.y+T20_AGIZ_Y+dsin(_ac)*T20_AGIZ_KAY
	};
};

IsinBasla = function()
{
	if (isin_on) { return; }
	isin_on = true;
	isin_faz = 0;
	isin_t = 0;
	with (o_p1final_gbtop) { target_x = x; target_y = y; }
	audio_play_sound(snd_pullback,2,false);
	// Buyuk blaster sarj oluyor
	isin_sarj_ses = audio_play_sound(snd_gb_charge,3,false);
	audio_sound_pitch(isin_sarj_ses,T20_ISIN_SARJ_PITCH);
};

IsinAdim = function()
{
	if (!isin_on) { return; }
	isin_t += 1;

	var _a = IsinAgiz();
	isin_x = _a.x;
	isin_y = _a.y;

	switch (isin_faz)
	{
		case 0:
			if (instance_exists(o_p1final_gbbottom))
			{
				o_p1final_gbbottom.agiz = T20_ISIN_AGIZ*(isin_t/T20_ISIN_ACIL);
			}
			if (isin_t >= T20_ISIN_ACIL) { isin_faz = 1; isin_t = 0; }
			break;

		case 1:
			if (isin_t >= T20_ISIN_TOPLA)
			{
				isin_faz = 2; isin_t = 0;
				// Buyuk blaster ates ediyor
				var _isin_ates = audio_play_sound(snd_gb_release,4,false);
				audio_sound_pitch(_isin_ates,T20_ISIN_ATES_PITCH);
				audio_play_sound(snd_bighit,2,false);
			}
			break;

		case 2:
			Camera_Shake(3,3,2,2);
			if (instance_exists(battle_soul))
			{
				if (abs(battle_soul.y-isin_y) < T20_ISIN_KALIN/2)
				and (battle_soul.x < isin_x)
				{
					if (global.kr)
					{
						if (!instance_exists(hurtkr)) { instance_create_depth(0,0,0,hurtkr); }
					}
					else
					{
						Battle_HurtNormal(DMG_BLASTER_BIG);
					}
				}
			}
			if (isin_t >= T20_ISIN_ATES) { isin_faz = 3; isin_t = 0; }
			break;

		case 3:
			if (instance_exists(o_p1final_gbbottom))
			{
				o_p1final_gbbottom.agiz = T20_ISIN_AGIZ*max(0,1-isin_t/T20_ISIN_KAPAN);
			}
			if (isin_t >= T20_ISIN_KAPAN)
			{
				isin_on = false;
				if (instance_exists(o_p1final_gbbottom)) { o_p1final_gbbottom.agiz = 0; }
			}
			break;
	}
};

IsinDurdur = function()
{
	isin_on = false;
	if (audio_is_playing(isin_sarj_ses)) { audio_stop_sound(isin_sarj_ses); }
	if (instance_exists(o_p1final_gbbottom)) { o_p1final_gbbottom.agiz = 0; }
};

#macro T20_SON_GULME    150
#macro T20_SON_SLASH    175
#macro T20_SON_SLASH2   183
#macro T20_SON_KIR      230
#macro T20_SON_POP_ARA   26
#macro T20_SON_POP_SON  340
#macro T20_SON_TEMIZ    350
#macro T20_SON_PERDE    270
#macro T20_SON_PERDE_AC  0.0125
#macro T20_SON_PERDE_KAP 0.0075

son_on = false;
son_t = 0;

SonMerkez = function()
{
	if (instance_exists(o_p1final_gbtop)) { return { x : o_p1final_gbtop.x, y : o_p1final_gbtop.y }; }
	return { x : 470, y : 160 };
};

SonPop = function(_x,_y,_pow,_olcek)
{
	var _o = instance_create_depth(_x-61*_olcek,_y-53*_olcek,0,
		_pow ? o_p1final_explosion_1 : o_p1final_explosion);
	_o.manuel = true;
	_o.depth = -1500000;
	_o.image_xscale = _olcek;
	_o.image_yscale = _olcek;
};

SonKesik = function(_x,_y,_aci,_ox,_oy)
{
	var _o = instance_create_depth(_x,_y,-9999999,o_p1final_sansslash);
	_o.scripted = true;
	_o.anim = true;
	_o.sprite_index = spr_battle_menu_fight_anim_knife;
	_o.image_index = 0;
	_o.image_speed = 1;
	_o.image_angle = _aci;
	_o.image_xscale = _ox;
	_o.image_yscale = _oy;
	_o.image_alpha = 1;
	_o.sure = 60;
};

SonBasla = function()
{
	son_on = true;
	son_t = 0;
	with (battle_regularbone) { instance_destroy(); }

	with (o_p1final_gbtop) { target_x = x; target_y = y; image_index = 0; }
	with (o_p1final_gbbottom) { agiz = 0; }

	with (o_p1final_gbsans)
	{
		sprite_index = s_p1final_sans_laugh;
		image_index = 0;
		image_speed = 1;
	}
	audio_play_sound(snd_sans_laugh,3,false);
};

SonSlash = function(_ikinci)
{
	var _m = SonMerkez();
	if (!_ikinci)
	{
		SonKesik(_m.x-8,_m.y+8,26,4.2,3.4);
		audio_play_sound(snd_slice,4,false);
		Camera_Shake(7,7,3,3);
		with (o_p1final_gbtop) { image_index = 1; }
		with (o_p1final_gbbottom) { agiz = 7; }
		with (o_p1final_gbsans)
		{
			sprite_index = s_p1final_sans;
			image_index = 0;
			image_speed = 0;
		}
	}
	else
	{
		SonKesik(_m.x+16,_m.y,-26,4.2,3.4);
		audio_play_sound(snd_slice,4,false);
		Camera_Shake(9,9,4,4);
		SonPop(_m.x-30,_m.y+10,false,1.3);
	}
};

SonKir = function()
{
	var _m = SonMerkez();
	audio_play_sound(snd_slash_boom,4,false);
	audio_play_sound(snd_break_0,4,false);
	Camera_Shake(12,12,5,5);
	SonPop(_m.x-20,_m.y-10,false,1.7);
	SonPop(_m.x+70,_m.y+60,true,1.2);

	with (o_p1final_gbtop)
	{
		image_index = 2;
		serbest = true;
		vx = 1.3;  vy = -3.4;  vd = -1.5;
	}
	with (o_p1final_gbbottom)
	{
		serbest = true;
		vx = -2.7;  vy = -2.2;  vd = 3.6;
	}
	with (o_p1final_gbsans)
	{
		serbest = true;
		vx = -0.9;  vy = -5.6;
		sal = 9;  sal_hiz = 3.2;
	}
	with (o_p1final_gbsans_expressions) { instance_destroy(); }
};

SonPerdeAc = function()
{
	with (o_p1_shine)
	{
		image_alpha = max(0,image_alpha);
		fade_speed = T20_SON_PERDE_AC;
		target_alpha = 1;
	}
};

SonPerdeKapat = function()
{
	with (o_p1_shine)
	{
		fade_speed = T20_SON_PERDE_KAP;
		target_alpha = 0;
	}
};

SonTemizle = function()
{
	with (o_p1final_gbtop) { instance_destroy(); }
	with (o_p1final_gbbottom) { instance_destroy(); }
	with (o_p1final_gbsans) { instance_destroy(); }
	with (o_p1final_explosion) { instance_destroy(); }
	with (o_p1final_explosion_1) { instance_destroy(); }
	with (o_p1final_sansslash) { instance_destroy(); }
	son_on = false;
};

SonAdim = function()
{
	if (!son_on) { return; }
	son_t += 1;

	if (son_t == T20_SON_GULME)
	{
		with (o_p1final_gbsans)
		{
			sprite_index = s_p1final_sans_serious;
			image_index = 0;
			image_speed = 0;
		}
		audio_play_sound(snd_warning_slash,3,false);
	}
	if (son_t == T20_SON_SLASH)  { SonSlash(false); }
	if (son_t == T20_SON_SLASH2) { SonSlash(true); }
	if (son_t == T20_SON_KIR)    { SonKir(); }

	if (son_t == T20_SON_PERDE) { SonPerdeAc(); }

	if (son_t > T20_SON_KIR) and (son_t < T20_SON_POP_SON)
	and (((son_t-T20_SON_KIR) mod T20_SON_POP_ARA) == 0)
	{
		var _hedef = noone;
		var _s = irandom(2);
		if (_s == 0) and (instance_exists(o_p1final_gbsans))  { _hedef = o_p1final_gbsans; }
		if (_s == 1) and (instance_exists(o_p1final_gbtop))   { _hedef = o_p1final_gbtop; }
		if (_s == 2) and (instance_exists(o_p1final_gbbottom)){ _hedef = o_p1final_gbbottom; }
		if (_hedef == noone) and (instance_exists(o_p1final_gbtop)) { _hedef = o_p1final_gbtop; }
		if (_hedef != noone)
		{
			SonPop(_hedef.x+irandom_range(-70,70),_hedef.y+irandom_range(-50,50),
				(irandom(1) == 0),random_range(0.8,1.4));
			audio_play_sound(snd_bighit,3,false);
			Camera_Shake(4,4,2,2);
		}
	}

	if (son_t == T20_SON_TEMIZ) { SonTemizle(); }
};

#macro T20_FIN_DUS_BAS  5500
#macro T20_FIN_DUS_SURE  105
#macro T20_FIN_DUS_Y    -234
#macro T20_FIN_DUS_EGRI  2.2
#macro FIN_DUS_CIK        14

// --- Dusus ses efektleri ----------------------------------------------------
// Ruzgar sesi = snd_swift pes perdeden; carpma oncesi yukselen ton snd_smash_rise
// (0.49 sn ~= 29 kare) oyle ki tam vurusla bitsin.
#macro T20_DUS_RUZGAR_PITCH 0.62
#macro T20_DUS_CARP_PITCH   0.80
#macro T20_DUS_GORUN          38
#macro T20_DUS_YUKSEL         29

fin_dus = false;
fin_dus_t = 0;
fin_dus_y0 = -608;

FinDusAdim = function()
{
	if (!fin_dus) { return; }
	fin_dus_t += 1;
	if (fin_dus_t == 1)
	{
		var _fd_ruzgar = audio_play_sound(snd_swift,2,false);
		audio_sound_pitch(_fd_ruzgar,T20_DUS_RUZGAR_PITCH);
	}
	if (fin_dus_t == T20_FIN_DUS_SURE-T20_DUS_YUKSEL)
	{
		audio_play_sound(snd_smash_rise,2,false);
	}
	var _o = min(1,fin_dus_t/T20_FIN_DUS_SURE);
	var _f = 1-power(1-_o,T20_FIN_DUS_EGRI);
	with (o_p1final_fall_1)
	{
		y = other.fin_dus_y0+(T20_FIN_DUS_Y-other.fin_dus_y0)*_f;
		target_y = y;
	}
	if (fin_dus_t >= T20_FIN_DUS_SURE)
	{
		fin_dus = false;
		Camera_Shake(4,5,2,2);
		audio_play_sound(snd_impact,2,false);
		audio_play_sound(snd_smash_impact,3,false);
	}
};
