
function DrTarget(kind,angle)
{
	var _spd = 0;
	var _d = 360;
	if (argument_count >= 3) { _spd = argument[2]; }
	if (argument_count >= 4) { _d = argument[3]; }

	var _a = round(angle/45)*45;
	var _t = instance_create_depth(battle_board.x+lengthdir_x(_d,_a),battle_board.y+lengthdir_y(_d,_a),DEPTH_BATTLE.BULLET_OUTSIDE_LOW,battle_dr_target);
	_t.setup(kind);
	_t.dir = _a+180;
	if (_spd > 0) { _t.spd = _spd; }
	return _t;
}


function DrCorridor()
{
	var _auto = false;
	var _base = 5;
	if (argument_count >= 1) { _auto = argument[0]; }
	if (argument_count >= 2) { _base = argument[1]; }

	var _c = instance_create_depth(0,0,DEPTH_BATTLE.BULLET+10,battle_dr_corridor);
	_c.scroll_base = _base;
	_c.scroll_spd = _base;
	_c.spawn_on = _auto;
	_c.ring_on = _auto;
	return _c;
}

function DrCorridorStop()
{
	with(battle_dr_obstacle) { instance_destroy(); }
	with(battle_dr_jumpring) { instance_destroy(); }
	with(battle_dr_corridor) { instance_destroy(); }
}

function DrBone(blueOff,blueW)
{
	var _spd = 5;
	if (instance_exists(battle_dr_corridor)) { _spd = battle_dr_corridor.scroll_base; }
	if (argument_count >= 3) { _spd = argument[2]; }

	var _b = instance_create_depth(battle_board.x,battle_board.y-battle_board.up-24,DEPTH_BATTLE.BULLET,battle_dr_obstacle);
	_b.spd_y = _spd;
	_b.blue_off = blueOff;
	_b.blue_w = blueW;
	return _b;
}

function DrRing(off)
{
	var _spd = 5;
	if (instance_exists(battle_dr_corridor)) { _spd = battle_dr_corridor.scroll_base; }
	if (argument_count >= 2) { _spd = argument[1]; }

	var _r = instance_create_depth(battle_board.x+off,battle_board.y-battle_board.up-20,DEPTH_BATTLE.BULLET,battle_dr_jumpring);
	_r.spd_y = _spd;
	return _r;
}

function DrBoneWall(count,gap,bottomY,time)
{
	var _bas = -30;
	for (var _i = 0; _i < count; _i++)
	{
		var _b = instance_create_depth(battle_board.x,_bas-_i*gap,DEPTH_BATTLE.BULLET,battle_dr_obstacle);
		_b.depth = DEPTH_BATTLE.BULLET_OUTSIDE_LOW;
		_b.spd_y = 0;
		_b.outside = true;
		Anim_Create(_b,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.OUT,_b.y,bottomY-_bas,time);
	}
}
