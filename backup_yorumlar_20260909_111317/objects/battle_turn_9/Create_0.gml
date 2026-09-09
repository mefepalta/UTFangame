_timer=0;
_start=false;
cang=false;
canga=0;

arm_reset = -1;
board_prev_x = 320;

Dagger = function(_dx,_dy,_len,_hsp,_vsp,_ang)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,_ang-110,0,1,0,0,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,18);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,22);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,8,20);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,8,20);
	return _b;
};

orbit = [];

OrbitPoint = function(_L,_R,_A,_s)
{
	var _P = 2*_L + 2*pi*_R;
	var _t = _s - floor(_s/_P)*_P;
	var _u = 0;
	var _v = 0;

	if (_t < _L)
	{
		_u = _R;
		_v = _L*0.5 - _t;
	}
	else if (_t < _L + pi*_R)
	{
		var _th = (_t - _L)/_R;
		_u = _R*cos(_th);
		_v = -_L*0.5 - _R*sin(_th);
	}
	else if (_t < 2*_L + pi*_R)
	{
		_u = -_R;
		_v = -_L*0.5 + (_t - _L - pi*_R);
	}
	else
	{
		var _th2 = (_t - 2*_L - pi*_R)/_R;
		_u = -_R*cos(_th2);
		_v = _L*0.5 + _R*sin(_th2);
	}

	return [_u*dcos(_A) - _v*dsin(_A), _u*dsin(_A) + _v*dcos(_A)];
};

OrbitAngle = function(_L,_R,_A,_s)
{
	var _p1 = OrbitPoint(_L,_R,_A,_s);
	var _p2 = OrbitPoint(_L,_R,_A,_s+2);
	return point_direction(_p1[0],_p1[1],_p2[0],_p2[1]) + 90;
};

OrbitAdd = function(_L,_R,_A,_s0,_spd,_len)
{
	var _p = OrbitPoint(_L,_R,_A,_s0);
	var _ang = OrbitAngle(_L,_R,_A,_s0);
	var _b = RegularBone(battle_board.x+_p[0],battle_board.y+_p[1],_len,0,0,_ang-110,0,1,0,0,1,0,0,false);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,18);
	array_push(orbit,{ b:_b, L:_L, R:_R, A:_A, s:_s0, spd:_spd, w:24, w0:24 });
};

OrbitSet = function(_L,_R,_spd,_len,_angles)
{
	var _P = 2*_L + 2*pi*_R;
	var _top = _L + pi*_R*0.5;
	var _n = array_length(_angles);
	for (var _i = 0; _i < _n; _i++)
	{
		var _A = _angles[_i];
		OrbitAdd(_L,_R,_A,_top,_spd,_len);
		OrbitAdd(_L,_R,_A,_top+_P*0.5,_spd,_len);
	}
};

OrbitStep = function()
{
	var _n = array_length(orbit);
	for (var _i = 0; _i < _n; _i++)
	{
		var _o = orbit[_i];
		if (!instance_exists(_o.b)) { continue; }
		_o.s += _o.spd;
		var _p = OrbitPoint(_o.L,_o.R,_o.A,_o.s);
		_o.b.x = battle_board.x + _p[0];
		_o.b.y = battle_board.y + _p[1];

		var _base = OrbitAngle(_o.L,_o.R,_o.A,_o.s);
		if (_o.w > 0)
		{
			var _k = _o.w/_o.w0;
			_o.b._angle = _base - 110*_k*_k;
			_o.w -= 1;
		}
		else
		{
			_o.b._angle = _base;
		}
	}
};

Gate = function(_from_left,_top,_bot,_spd)
{
	var _gx = (_from_left ? (battle_board.x-battle_board.left-5) : (battle_board.x+battle_board.right+5));
	var _gs = (_from_left ? _spd : -_spd);
	var _ty = battle_board.y-battle_board.up+2;
	var _by = battle_board.y+battle_board.down-2;
	RegularBone(_gx,_ty,_top,_gs,0,180,0,0,1,0,0,0,0,true);
	RegularBone(_gx,_by,_bot,_gs,0,0,0,0,1,0,0,0,0,true);
};
