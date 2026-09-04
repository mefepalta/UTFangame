event_inherited();

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

wall  = 0;
along = 1;

hit_x = battle_board.x;
hit_y = battle_board.y + battle_board.down;

hammer_scale  = 1.4;
head_corner_x = 103;
head_corner_y = 39;

start_angle = 90;
pull_angle  = 125;
ready_time  = 14;
pull_time   = 34;
strike_time = 9;
hold_time   = 30;
leave_time  = 18;

wave_count  = 3;
wave_delay  = 14;
wave_bolts  = 1;
bolt_lean   = 25;
bolt_fan    = 32;
bolt_spread = 9;
spd_first   = 7.5;
spd_last    = 2.5;
bolt_spin   = 0;

_state = 0;
_t = 0;
_wave = 0;
_angle = start_angle;
_alpha = 0;

WallAngle = function()
{
	switch (wall)
	{
		case 1:  return 180;
		case 2:  return 270;
		case 3:  return 90;
		default: return 0;
	}
};

NormalDir = function()
{
	switch (wall)
	{
		case 1:  return 270;
		case 2:  return 0;
		case 3:  return 180;
		default: return 90;
	}
};

TravelDir = function()
{
	return ((along >= 0) ? WallAngle() : WallAngle()+180);
};

ShootWave = function(_w)
{
	var _spd = spd_first;
	if (wave_count > 1)
	{
		_spd = lerp(spd_first,spd_last,_w/(wave_count-1));
	}

	var _nd = NormalDir();
	var _turn = sign(angle_difference(TravelDir(),_nd));
	if (_turn == 0) { _turn = 1; }
	var _center = _nd + _turn*bolt_lean;

	for (var _s = -1; _s <= 1; _s++)
	{
		for (var _b = 0; _b < wave_bolts; _b++)
		{
			var _off = (_b-(wave_bolts-1)/2)*bolt_spread;
			var _bl = instance_create_depth(hit_x,hit_y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_bolt);
			_bl.direction = _center + _s*bolt_fan + _off;
			_bl.speed = _spd;
			_bl.spin = bolt_spin;
		}
	}
	audio_play_sound(snd_noise,2,false);
};
