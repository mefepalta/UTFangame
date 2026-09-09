
#macro SPEAR_THRUST 0
#macro SPEAR_SPIRAL 1
#macro SPEAR_DIVE 2
#macro SPEAR_AIM 3


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
		Battle_SetBoardSizeCubic(50,50,37.5,37.5,_time);
	}
	else if (_wave == 5)
	{
		Battle_SetBoardSizeCubic(37.5,37.5,150,150,_time);
	}
	else if (_wave == 3)
	{
		Battle_SetBoardSizeCubic(75,75,75,75,_time);
	}
	else if (_wave == 41)
	{
		Battle_SetBoardSizeCubic(50,50,57.5,57.5,_time);
	}
	else
	{
		Battle_SetBoardSizeCubic(260,65,282.5,282.5,_time);
	}
}


function Spear4()
{
	var _lane = irandom(2);
	if (argument_count >= 1) { _lane = argument[0]; }

	var _s = instance_create_depth(battle_board.x+(-25+_lane*25),battle_board.y+68,
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_s.kind = SPEAR_THRUST;
	_s.dir = 90;
	_s.warn_time = 60;
	_s.drift = 0.3;
	_s.drift_max = 10;
	_s.fade_in = 0.05;
	_s.spd = 5;
	_s.run_len = 73;
	_s.run_stop = true;
	_s.fade_out = 0.05;
	_s.dmg_alpha = 0.9;
	audio_play_sound(snd_spear_spawn,0,false);
	return _s;
}


function Spear5()
{
	var _luy = [-25,0,25];

	var _a = instance_create_depth(battle_board.x-177,battle_board.y-_luy[irandom(2)],
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_a.kind = SPEAR_THRUST;
	_a.dir = 0;
	_a.warn_time = 60;
	_a.drift = 0.3;
	_a.drift_max = 0;
	_a.fade_in = 0;
	_a.spd = 8;
	_a.run_len = 229;
	_a.run_stop = false;
	_a.fade_out = 0.1;
	_a.dmg_alpha = 0.05;

	var _b = instance_create_depth(battle_board.x+181,battle_board.y-_luy[irandom(2)],
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_b.kind = SPEAR_THRUST;
	_b.dir = 180;
	_b.warn_time = 60;
	_b.drift = 0.3;
	_b.drift_max = 0;
	_b.fade_in = 0;
	_b.spd = 8;
	_b.run_len = 233;
	_b.run_stop = false;
	_b.fade_out = 0.1;
	_b.dmg_alpha = 0.05;

	audio_play_sound(snd_spear_spawn,0,false);
}


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
		_s.orb_shrink = _hard ? 1 : 1.2;
		_s.ang = _a;
		_s.ang_step = 2.35;
		_s.ang_floor = 1;
		_s.ang_tick = 0.015;
		_s.orb_dir = _d;
		_s.fade_in = 0.05;
		_s.fade_out = 0.125;
		_s.dmg_alpha = 0.9;
		_s.dir = _a+180;
	}
}


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


function Spear0(_addAngle)
{
	var _hard = false;
	if (argument_count >= 2) { _hard = argument[1]; }
	var _bs = _hard ? 5.5 : 5;
	var _bd = _hard ? 140 : 150;

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
		_s.dir = _addAngle+180;
		_s.spd = _bs;
		_s.dive_life = -150;
		_s.dive_step = _bs;
		_s.dive_fade = 0.85*_bd*_bs;
		_s.dive_kill = 1.10*_bd*_bs;
		_s.fade_in = 1;
		_s.fade_out = 0.05;
		_s.dmg_alpha = 0.05;
	}
}


function Spear0Gap(_n)
{
	return ceil(max(20,50-4*_n)/3);
}


function Spear1(_addAngle)
{
	var _hard = false;
	if (argument_count >= 2) { _hard = argument[1]; }
	var _n = _hard ? 8 : 6;

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
		_s.dir = _a+180;
		_s.spd = 5;
		_s.dive_life = -150;
		_s.dive_step = 5;
		_s.dive_fade = 175;
		_s.dive_kill = 262.5;
		_s.fade_in = 0.05;
		_s.fade_out = 0.05;
		_s.dmg_alpha = 0.9;
		_s.dmg_kill = true;
		_s.free_angle = true;
		_s.spin = 9.3;
		_s.image_angle = (_a+180)-90+90;
	}
}


function Spear1Gap(_n)
{
	return max(25,50-4*_n);
}


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
	_s.aim_to = _s.dir-90;
	_s.aim_now = _s.aim_to+180;
	_s.image_angle = _s.aim_now;
	_s.aim_ease = 10;
	var _k = _hard ? 5 : 4;
	_s.aim_sx = lengthdir_x(_k,_s.dir);
	_s.aim_sy = lengthdir_y(_k,_s.dir);
	_s.aim_vel = 1;
	_s.aim_acc = 0.125;
	_s.aim_out = 160;
	_s.aim_toss = 20;
	_s.fade_in = 0.05;
	_s.fade_out = 0.1;
	_s.dmg_alpha = 0.05;
	audio_play_sound(snd_spear_spawn,0,false);
	return _s;
}


function Spear4Hard()
{
	var _posx = 23;

	var _a = instance_create_depth(battle_board.x+(-_posx+(irandom_range(1,5)-2)*_posx),battle_board.y+68,
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_a.kind = SPEAR_THRUST;
	_a.dir = 90;
	_a.warn_time = 60;
	_a.drift = 0.3;
	_a.drift_max = 10;
	_a.fade_in = 0.05;
	_a.spd = 5;
	_a.run_len = 73;
	_a.run_stop = true;
	_a.fade_out = 0.05;
	_a.dmg_alpha = 0.9;

	var _b = instance_create_depth(battle_board.x+(-_posx+(irandom_range(1,5)-2)*_posx),battle_board.y-64,
		DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_spear);
	_b.kind = SPEAR_THRUST;
	_b.dir = 270;
	_b.warn_time = 60;
	_b.drift = 0.3;
	_b.drift_max = 10;
	_b.fade_in = 0.05;
	_b.spd = 5;
	_b.run_len = 69;
	_b.run_stop = true;
	_b.fade_out = 0.05;
	_b.dmg_alpha = 0.9;

	audio_play_sound(snd_spear_spawn,0,false);
}

function SpearSound(_snd)
{
	if (!variable_global_exists("spear_snd_last")) { global.spear_snd_last = -9999; }
	if (current_time-global.spear_snd_last < 40) { return; }
	global.spear_snd_last = current_time;
	audio_play_sound(_snd,0,false);
}
