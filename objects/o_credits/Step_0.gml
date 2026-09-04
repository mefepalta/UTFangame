creditstimer++;
fx_t++;

var _spr     = -1;
var _index   = -1;
var _local   = 0;
var _dur     = panel_length;
var _fadeout = 130;

if (creditstimer >= panel_start) and (creditstimer < panel_start + array_length(panel_list) * panel_length)
{
	_index = (creditstimer - panel_start) div panel_length;
	_local = (creditstimer - panel_start) mod panel_length;
	_spr   = panel_list[_index];
}
else if (creditstimer >= last_start)
{
	_index   = array_length(panel_list);
	_local   = creditstimer - last_start;
	_dur     = last_length;
	_fadeout = 500;
	_spr     = s_credits_8;
}

panel_sprite = _spr;

if (_spr != -1)
{
	if (_index != panel_current)
	{
		panel_current = _index;
		panel_flash = 1;
	}

	var _fadein = 80;
	var _a = 1;
	if (_local < _fadein)
	{
		_a = _local / _fadein;
	}
	else if (_local > _dur - _fadeout)
	{
		_a = (_dur - _local) / _fadeout;
	}
	_a = clamp(_a, 0, 1);
	panel_alpha = _a * _a * (3 - 2 * _a);

	var _ease = 1 - power(1 - clamp(_local / _fadein, 0, 1), 3);
	var _life = clamp(_local / _dur, 0, 1);

	panel_x     = lerp(320 + 70, 320, _ease) - _life * 22;
	panel_y     = 300 - sprite_get_height(_spr) * 0.5
	            + (1 - _ease) * 14
	            + sin((fx_t + _index * 37) * 0.021) * 3;
	panel_scale = lerp(0.96, 1, _ease);
	panel_glow  = 0.30 + 0.12 * sin(fx_t * 0.055) + panel_flash * 1.2;
}
else
{
	panel_alpha = 0;
}

panel_flash = max(0, panel_flash - 0.02);

for (var _i = 0; _i < array_length(stars); _i++)
{
	var _s = stars[_i];
	_s.px -= _s.vx;
	_s.py -= _s.vy;
	_s.phase += _s.blink;
	if (_s.py < -10)
	{
		_s.py = 490;
		_s.px = random(660) - 10;
	}
	if (_s.px < -10)
	{
		_s.px = 650;
		_s.py = random(500) - 10;
	}
}

shot_timer--;
if (shot_timer <= 0)
{
	shot_timer = irandom_range(260, 620);
	array_push(shots, {
		px   : 260 + random(440),
		py   : -30 + random(140),
		vx   : -(5 + random(3)),
		vy   : 1.8 + random(1.6),
		life : 0
	});
}
for (var _j = array_length(shots) - 1; _j >= 0; _j--)
{
	var _sh = shots[_j];
	_sh.px += _sh.vx;
	_sh.py += _sh.vy;
	_sh.life++;
	if (_sh.life > 110) or (_sh.px < -140)
	{
		array_delete(shots, _j, 1);
	}
}

if (global.p1sanshp == true)
{
	global.death_count = 0;
	global.p1sanshp = false;
}
