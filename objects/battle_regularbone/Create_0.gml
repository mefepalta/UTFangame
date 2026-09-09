depth = DEPTH_BATTLE.BULLET

_sprite=spr_bone_origin_down
_length=20
_angle=0
_color=0
_papyrus=0
_center=0
_alpha=1
_inside=0
_angle_speed=0
_bottom = 0
_dynamic = false
_dynamic_speed = 1.0
_dynamic_dir = 1
_dynamic_rate = 0.03
_dynamic_lifetime = 120
_dynamic_scale = false
_scale_offset = 0
_snake_time = random(100);
_snake_freq_x = random_range(0.05, 0.12);
_snake_freq_y = random_range(0.03, 0.09);
_snake_amp_x = random_range(1.5, 3.0);
_snake_amp_y = random_range(0.8, 2.0);
_snake_jolt_timer = irandom(60);
_snake_jolt_x = 0;
_snake_jolt_y = 0;
_snake = false
_scale_speed = random_range(0.05, 0.15)
_base_hspeed = 0
_base_vspeed = 0
_angle_option = false;

_uzun = false;

CizUzun = function()
{
	var _L = _length*15/18;
	if (_L < 24) { return false; }

	var _vx = dsin(_angle);
	var _vy = dcos(_angle);
	var _nx = dcos(_angle);
	var _ny = -dsin(_angle);

	var _ax, _ay, _bx, _by;
	if (_center == 1)
	{
		_ax = x - _vx*_L*0.5; _ay = y - _vy*_L*0.5;
		_bx = x + _vx*_L*0.5; _by = y + _vy*_L*0.5;
	}
	else
	{
		_ax = x - _vx*_L; _ay = y - _vy*_L;
		_bx = x;          _by = y;
	}

	var _UC = sprite_get_height(spr_paps_bonetop);
	var _YW = 3.5;

	var _g1x = _ax + _vx*(_UC-2), _g1y = _ay + _vy*(_UC-2);
	var _g2x = _bx - _vx*(_UC-2), _g2y = _by - _vy*(_UC-2);
	draw_set_color(real_color);
	draw_set_alpha(_alpha);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(_g1x+_nx*_YW,_g1y+_ny*_YW);
	draw_vertex(_g1x-_nx*_YW,_g1y-_ny*_YW);
	draw_vertex(_g2x+_nx*_YW,_g2y+_ny*_YW);
	draw_vertex(_g2x-_nx*_YW,_g2y-_ny*_YW);
	draw_primitive_end();
	draw_set_alpha(1);

	var _dx = sprite_get_width(spr_paps_bonetop)/2  - sprite_get_xoffset(spr_paps_bonetop);
	var _dy = sprite_get_height(spr_paps_bonetop)/2 - sprite_get_yoffset(spr_paps_bonetop);

	var _uca = _angle;
	var _rx = _dx*dcos(_uca)+_dy*dsin(_uca);
	var _ry = -_dx*dsin(_uca)+_dy*dcos(_uca);
	draw_sprite_ext(spr_paps_bonetop,0,
		(_ax+_vx*_UC*0.5)-_rx,(_ay+_vy*_UC*0.5)-_ry,1,1,_uca,real_color,_alpha);

	if (_bottom == 0)
	{
		var _ucb = _angle+180;
		_rx = _dx*dcos(_ucb)+_dy*dsin(_ucb);
		_ry = -_dx*dsin(_ucb)+_dy*dcos(_ucb);
		draw_sprite_ext(spr_paps_bonetop,0,
			(_bx-_vx*_UC*0.5)-_rx,(_by-_vy*_UC*0.5)-_ry,1,1,_ucb,real_color,_alpha);
	}

	image_yscale = _length/20;
	image_angle  = _angle;
	return true;
};

autoDestroy=true

real_color=c_white

count=0

frequency_damage=2


image_blend=c_green