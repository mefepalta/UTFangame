_timer=0;
_start=false;
cang=false;
canga=0;

arm_reset = -1;

fan = [];

FanAdd = function(_a,_spd,_dist)
{
	var _b = RegularBone(battle_board.x+lengthdir_x(_dist,_a),battle_board.y+lengthdir_y(_dist,_a),0,0,0,_a+90,0,0,1,0,0,0,0,false);
	Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_dist,34);
	array_push(fan,{ b:_b, a:_a, spd:_spd, d:_dist });
};

FanSet = function(_count,_spd,_dist)
{
	fan = [];
	for (var _i = 0; _i < _count; _i++)
	{
		FanAdd(_i*(360/_count),_spd,_dist);
	}
};

FanStep = function()
{
	var _n = array_length(fan);
	for (var _i = 0; _i < _n; _i++)
	{
		var _f = fan[_i];
		if (!instance_exists(_f.b)) { continue; }
		_f.a += _f.spd;
		_f.b.x = battle_board.x + lengthdir_x(_f.d,_f.a);
		_f.b.y = battle_board.y + lengthdir_y(_f.d,_f.a);
		_f.b._angle = _f.a + 90;
	}
};

FanRetract = function(_time)
{
	var _n = array_length(fan);
	for (var _i = 0; _i < _n; _i++)
	{
		var _f = fan[_i];
		if (!instance_exists(_f.b)) { continue; }
		Anim_Create(_f.b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,_f.d,-_f.d,_time);
		Anim_Create(_f.b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,1,-1,_time);
	}
};

FanClear = function()
{
	var _n = array_length(fan);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(fan[_i].b)) { instance_destroy(fan[_i].b); }
	}
	fan = [];
};

wallbones = [];

LeftWall = function(_count,_len,_warn)
{
	wallbones = [];
	var _ty = battle_board.y-battle_board.up+2;
	var _sp = (battle_board.up+battle_board.down)/_count;
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < _count; _i++)
	{
		var _b = RegularBone(battle_board.x-battle_board.left,_ty+_i*_sp,0,0,0,-90,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_len,5,_warn);
		array_push(wallbones,_b);
	}
};

WallStep = function()
{
	var _lx = battle_board.x-battle_board.left;
	var _n = array_length(wallbones);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(wallbones[_i])) { wallbones[_i].x = _lx; }
	}
};

WallClear = function()
{
	var _n = array_length(wallbones);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(wallbones[_i])) { instance_destroy(wallbones[_i]); }
	}
	wallbones = [];
};

Carpet = function()
{
	return RegularBone(battle_board.x+battle_board.right+12,battle_board.y+battle_board.down-2,26,-3,0,0,0,0,1,0,0,0,0,true);
};
