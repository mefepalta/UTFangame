
function AlphysHammer(wall,hitX,hitY,along,waveCount,waveBolts)
{
	var _h = instance_create_depth(0,0,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_hammer);
	_h.wall = wall;
	_h.hit_x = hitX;
	_h.hit_y = hitY;
	_h.along = along;
	_h.wave_count = waveCount;
	_h.wave_bolts = waveBolts;
	if (argument_count >= 7) { _h.spd_first  = argument[6]; }
	if (argument_count >= 8) { _h.spd_last   = argument[7]; }
	if (argument_count >= 9) { _h.wave_delay = argument[8]; }
	return _h;
}

function AlphysBigBolt(startX,startY,dir,spd)
{
	var _b = instance_create_depth(startX,startY,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_bigbolt);
	_b.direction = dir;
	_b.speed = spd;
	if (argument_count >= 5) { _b.fan_count = argument[4]; }
	if (argument_count >= 6) { _b.fan_curve = argument[5]; }
	if (argument_count >= 7) { _b.fan_speed = argument[6]; }
	return _b;
}

function AlphysShocker(boltX)
{
	var _s = instance_create_depth(0,0,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_shocker);
	_s.bolt_x = boltX;
	if (argument_count >= 2)
	{
		_s.strike_y = argument[1];
		_s.warn_y = _s.strike_y - 14;
	}
	if (argument_count >= 3) { _s.warn_time   = argument[2]; }
	if (argument_count >= 4) { _s.strike_time = argument[3]; }
	return _s;
}
