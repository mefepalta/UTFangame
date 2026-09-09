
#macro CYF_HIZ   0.5
#macro CYF_IVME  0.25
#macro CYF_BOY   1.2

function Cyf_X(_cx) { return battle_board.x + _cx; }

function Cyf_Y(_cy) { return battle_board.y - _cy; }

function Cyf_AX(_ax) { return _ax; }

function Cyf_AY(_ay) { return 480 - _ay; }

function Cyf_Aci(_a) { return ((270 + _a) mod 360 + 360) mod 360; }

function Cyf_Kemik(_boy,_cx,_cy,_xv,_yv,_xcx,_ycy,_rot,_rots,_renk,_omur)
{
	var _b = RegularBone(
		Cyf_X(_cx), Cyf_Y(_cy),
		_boy*CYF_BOY,
		_xv*CYF_HIZ, -_yv*CYF_HIZ,
		_rot, _renk,
		0,
		1,
		1,
		1,
		0,
		_rots*CYF_HIZ,
		false);

	if ((_xcx != 0) or (_ycy != 0))
	{
		var _ax = _xcx*CYF_IVME;
		var _ay = -_ycy*CYF_IVME;
		_b.gravity = point_distance(0,0,_ax,_ay);
		_b.gravity_direction = point_direction(0,0,_ax,_ay);
	}

	_b._uzun = true;

	if (_omur > 0) { _b.cyf_omur = _omur*2; }
	return _b;
}

function Cyf_MaviRuh(_yon)
{
	instance_create_depth(0,0,0,battle_soul_blue_effect);
	Battle_SetSoul(battle_soul_blue);
	if (instance_exists(battle_soul)) { battle_soul.dir = _yon; }
	audio_play_sound(snd_ding,2,false);
}

function Cyf_KirmiziRuh()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}

function Cyf_Hareket(_b,_dx,_dy)
{
	if (instance_exists(_b)) { _b.x += _dx*CYF_HIZ; _b.y -= _dy*CYF_HIZ; }
}

function Cyf_Don(_b,_d)
{
	if (instance_exists(_b)) { _b._angle += _d*CYF_HIZ; }
}

function Cyf_OmurAdim()
{
	with (battle_regularbone)
	{
		if (variable_instance_exists(id,"cyf_omur"))
		{
			cyf_omur -= 1;
			if (cyf_omur <= 0) { instance_destroy(); }
		}
	}
}

function Cyf_Targ(_cx,_cy,_rot)
{
	var _liste = [];
	var _x0 = Cyf_X(_cx);
	var _y0 = Cyf_Y(_cy);

	for (var _i = 0; _i < 44; _i++)
	{
		var _lx = -235.5 + _i*11;
		var _px = _x0 + lengthdir_x(_lx,-_rot);
		var _py = _y0 + lengthdir_y(_lx,-_rot);

		var _b = RegularBone(_px,_py,300*CYF_BOY,0,0,_rot,0,0,1,1,1,0,0,false);
		_b._uzun = true;
		array_push(_liste,_b);
	}
	return _liste;
}

function Cyf_TargHareket(_liste,_dx,_dy)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		var _b = _liste[_i];
		if (instance_exists(_b)) { _b.x += _dx*CYF_HIZ; _b.y -= _dy*CYF_HIZ; }
	}
}

function Cyf_TargSil(_liste)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { instance_destroy(_liste[_i]); }
	}
}

function Cyf_TargRenk(_liste,_renk)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { _liste[_i]._color = _renk; }
	}
}

function Cyf_Blaster(_x,_y,_x1,_y1,_ang,_ang1,_ates,_s1,_s2,_kal)
{
	var _ucus = _ates*2 - 21;
	if (_ucus < 1) { _ucus = 1; }

	var _b = RegularBlaster(
		Cyf_AX(_x),  Cyf_AY(_y),
		Cyf_AX(_x1), Cyf_AY(_y1),
		Cyf_Aci(_ang1), Cyf_Aci(_ang),
		max(_kal*2,30),
		1,
		_s2, _s1,
		_ucus);
	return _b;
}
