_timer=0;
_start=false;
cang=false;
canga=0;

depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

yol=0;
bolum=0;
atak_yol=11700;
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

#macro T18_TEP_MESAFE  70
#macro T18_TEP_ITME    10
#macro T18_TEP_DONUS   22

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

SigaraBasla = function()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(65,65,125,125,30);
	Battle_SetSoul(battle_soul_red);
	sahne = 1;
	sahne_kare = _timer;
};

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


kir_on=false;
kir_t=0;

KirmiziBasla = function()
{
	kir_on = true;
	kir_t = 0;
};

KirSol = function() { return (battle_board.x-battle_board.left)-5; };
KirSag = function() { return (battle_board.x+battle_board.right)+5; };
KirDip = function() { return (battle_board.y+battle_board.down)-2; };
KirTep = function() { return (battle_board.y-battle_board.up)+2; };

KemikDinamik = function(_bone,_hspd,_omur)
{
	_bone._dynamic = true;
	_bone._dynamic_lifetime = _omur;
	_bone._base_hspeed = _hspd;
	_bone._base_vspeed = 0;
	_bone._dynamic_rate = 0.015;
	return _bone;
};

YelpazeKemik = function(_yon,_hiz,_renk)
{
	var _x = (_yon > 0) ? KirSol()-10 : KirSag()+10;
	var _h = _hiz*_yon;
	var _b = RegularBone(_x,KirDip(),152,_h,0,0,_renk,0,1,1,0,0,0,true);
	KemikDinamik(_b,_h,180);
	audio_play_sound(snd_stab,2,false);
	return _b;
};

MaviKemik = function(_yon)
{
	var _x = (_yon > 0) ? KirSol()-10 : KirSag()+10;
	var _h = 6*_yon;
	RegularBone(_x,KirDip(),152,_h,0,0,1,0,1,1,0,0,0,true);
	RegularBone(_x-36*_yon,KirDip(),152,_h,0,0,1,0,1,1,0,0,0,true);
	audio_play_sound(snd_swift,2,false);
};

TuruncuKemik = function(_yon)
{
	var _x = (_yon > 0) ? KirSol()-10 : KirSag()+10;
	var _h = 18*_yon;
	var _b = RegularBone(_x,KirDip(),152,_h,0,0,2,0,1,1,0,0,0,true);
	KemikDinamik(_b,_h,38);
	audio_play_sound(snd_swift,2,false);
	return _b;
};

BosluklKemik = function(_nere)
{
	var _x = KirSag()+10;
	var _t = KirTep();
	var _d = KirDip();
	switch (_nere)
	{
		case 0:
			RegularBone(_x,_t,96,-4,0,180,0,0,1,1,0,0,0,true);
		break;
		case 1:
			RegularBone(_x,_t,50,-4,0,180,0,0,1,1,0,0,0,true);
			RegularBone(_x,_d,50,-4,0,0,0,0,1,1,0,0,0,true);
		break;
		default:
			RegularBone(_x,_d,96,-4,0,0,0,0,1,1,0,0,0,true);
		break;
	}
	audio_play_sound(snd_stab,2,false);
};

DipDuvar = function()
{
	var _gen = battle_board.left+battle_board.right+20;
	RegularBoneWall(DIR.DOWN,_gen,14,58,KirSol(),KirDip(),50,900,1,false);
};

SticikPlatform = function()
{
	var _p = instance_create_depth(battle_board.x,KirDip()-62,DEPTH_BATTLE.BULLET,battle_platform1);
	_p.width = 48;
	_p.sticky = 1;
	_p.move_x = 1.2;
	_p.bounce_x = false;
	_p.auto_destroy = false;
	return _p;
};

Hancer = function(_dx,_dy,_len,_hsp,_vsp,_ang,_wait)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,_ang-110,0,1,0,1,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,12);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,18);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,5,_wait);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,5,_wait);
	return _b;
};

HancerYatay = function(_yon)
{
	var _x = battle_board.x-_yon*(battle_board.left+26);
	var _y = KirDip()-70;
	return Hancer(_x,_y,58,16*_yon,0,(_yon > 0) ? 270 : 90,26);
};

HancerNisan = function()
{
	var _x = battle_board.x+irandom_range(-150,150);
	var _y = battle_board.y-battle_board.up-irandom_range(30,110);
	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul))
	{
		_cx = battle_soul.x;
		_cy = battle_soul.y;
	}
	var _d = point_direction(_x,_y,_cx,_cy);
	return Hancer(_x,_y,58,lengthdir_x(13,_d),lengthdir_y(13,_d),_d-90,30);
};
