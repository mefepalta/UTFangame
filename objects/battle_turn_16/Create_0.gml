_timer=0;
_start=false;
cang=false;
canga=0;

depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

yol=0;
bolum=0;
bitis_kare=-1;
atak_yol=6860;

sari_on=false;
sari_t=0;
sari_son=900;

kir_on=false;
kir_t=0;
kir_son=650;
phase2_text="";
dialog_started=false;


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


SariBasla = function()
{
	CarStop();
	BoxStop();
	with (battle_regularbone) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
	DrCorridorStop();

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


BlasterRing = function(_ang,_rad,_cool)
{
	var _cx = battle_board.x;
	var _cy = battle_board.y;
	var _tx = _cx+lengthdir_x(_rad,_ang);
	var _ty = _cy+lengthdir_y(_rad,_ang);
	var _sx = _cx+lengthdir_x(_rad+150,_ang);
	var _sy = _cy+lengthdir_y(_rad+150,_ang);
	var _bak = _ang+180;
	return RegularBlaster(_sx,_sy,_tx,_ty,_bak,_bak,14,_cool,1.5,1.5,26);
};

BlasterCircle = function(_count,_rad,_ang0,_gap)
{
	for (var _i = 0; _i < _count; _i++)
	{
		BlasterRing(_ang0+_i*(360/_count),_rad,_i*_gap);
	}
};

Yildirim = function(_ox,_fan,_curve)
{
	return AlphysBigBolt(battle_board.x+_ox,-60,270,6,_fan,_curve);
};

KirmiziBasla = function()
{
	with (battle_dr_target) { instance_destroy(); }
	with (battle_dr_shot) { instance_destroy(); }
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Anim_Destroy(battle_board,"y");
	var _mrk = BATTLE_BOARD.Y-25;
	Anim_Create(battle_board,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.OUT,battle_board.y,_mrk-battle_board.y,45);
	Battle_SetBoardSizeCubic(90,90,90,90,45);
	Battle_SetSoul(battle_soul_red);
	battle_soul.x = battle_board.x;
	battle_soul.y = _mrk;
	with (battle_soul) { moveable = true; }
	Camera_Shake(4,4,3,3);

	kir_on = true;
	kir_t = 0;
};
