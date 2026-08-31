var _prevcol = draw_get_colour();

var _intro = clamp((menu_t - 6) / 34, 0, 1);
_intro = 1 - power(1 - _intro, 3);
var _pulse = 0.72 + 0.28 * sin(menu_t * 0.09);

// ---------------------------------------------------------------------
// Drifting snow
// ---------------------------------------------------------------------
draw_set_colour(c_white);
for (var _k = 0; _k < array_length(snow); _k++)
{
	var _f = snow[_k];
	draw_set_alpha(_f.a * 0.30);
	draw_circle(_f.px, _f.py, _f.r * 2.2, false);
	draw_set_alpha(_f.a);
	draw_circle(_f.px, _f.py, _f.r, false);
}
draw_set_alpha(1);

// ---------------------------------------------------------------------
// Work out where the menu column sits (driven by the room instances)
// ---------------------------------------------------------------------
var _minx = 99999, _maxx = -99999, _miny = 99999, _maxy = -99999;
var _any  = false;
for (var _m = 0; _m < 4; _m++)
{
	var _ob = menu_objs[_m];
	if (!instance_exists(_ob)) { continue; }
	_any = true;
	with (_ob)
	{
		_minx = min(_minx, x);
		_maxx = max(_maxx, x + sprite_width);
		_miny = min(_miny, y);
		_maxy = max(_maxy, y + sprite_height);
	}
}

if (_any)
{
	// ------------------------------------------------------------------
	// Soft dark plate behind the column so the white text reads against
	// the snowy background. Flat in the middle, feathered at the edges.
	// ------------------------------------------------------------------
	var _x0 = _minx - 32, _x1 = _maxx + 36;
	var _y0 = _miny - 20, _y1 = _maxy + 20;
	var _padx = 34, _pady = 18;
	var _pa   = 0.58 * _intro * col_a;

	var _rows = [_y0, _y0 + _pady, _y1 - _pady, _y1];
	var _rowa = [0, 1, 1, 0];
	for (var _r = 0; _r < 3; _r++)
	{
		draw_primitive_begin(pr_trianglestrip);
		for (var _c = 0; _c <= 32; _c++)
		{
			var _px = _x0 + (_x1 - _x0) * (_c / 32);
			var _hf = 1;
			if (_px < _x0 + _padx)      { _hf = (_px - _x0) / _padx; }
			else if (_px > _x1 - _padx) { _hf = (_x1 - _px) / _padx; }
			_hf = clamp(_hf, 0, 1);
			_hf = _hf * _hf * (3 - 2 * _hf);
			draw_vertex_colour(_px, _rows[_r],     c_black, _pa * _rowa[_r]     * _hf);
			draw_vertex_colour(_px, _rows[_r + 1], c_black, _pa * _rowa[_r + 1] * _hf);
		}
		draw_primitive_end();
	}

	// ------------------------------------------------------------------
	// Band of light on the selected row
	// ------------------------------------------------------------------
	var _selob = menu_objs[clamp(menucounter, 0, 3)];
	if (instance_exists(_selob))
	{
		var _scx = 0, _scy = 0, _shw = 0, _shh = 0;
		with (_selob)
		{
			_scx = x + sprite_width * 0.5 + 4;
			_scy = y + sprite_height * 0.5;
			_shw = sprite_width * 0.5 + 62;
			_shh = sprite_height * 0.5 + 9;
		}

		gpu_set_blendmode(bm_add);
		var _bcol = make_colour_rgb(110, 140, 235);
		for (var _bh = 0; _bh <= 1; _bh++)
		{
			var _bedge = (_bh == 0) ? _scy - _shh : _scy + _shh;
			draw_primitive_begin(pr_trianglestrip);
			for (var _bc = 0; _bc <= 14; _bc++)
			{
				var _bfx = _bc / 14;
				var _bpx = _scx - _shw + _bfx * _shw * 2;
				var _bfd = power(sin(_bfx * pi), 1.4);
				draw_vertex_colour(_bpx, _bedge, _bcol, 0);
				draw_vertex_colour(_bpx, _scy,   _bcol, 0.38 * _bfd * _intro * _pulse * col_a);
			}
			draw_primitive_end();
		}
		gpu_set_blendmode(bm_normal);
	}

	// ------------------------------------------------------------------
	// The entries themselves: selected one glows, the rest sit back
	// ------------------------------------------------------------------
	for (var _i = 0; _i < 4; _i++)
	{
		var _ob2 = menu_objs[_i];
		if (!instance_exists(_ob2)) { continue; }

		var _ix = 0, _iy = 0, _isp = -1;
		with (_ob2)
		{
			_ix  = x;
			_iy  = y;
			_isp = sprite_index;
		}
		if (_isp == -1) { continue; }

		// staggered slide-in when the room opens (top entry first)
		var _st = clamp((menu_t - 6 - (3 - _i) * 7) / 30, 0, 1);
		_st = 1 - power(1 - _st, 3);

		var _dx = item_dx[_i] - (1 - _st) * 34;
		var _dy = _iy;

		if (_i == menucounter)
		{
			// crisp halo around the pixel letters
			gpu_set_blendmode(bm_add);
			var _gcol = make_colour_rgb(200, 220, 255);
			for (var _o = 0; _o < 8; _o++)
			{
				var _oa = _o / 8 * 2 * pi;
				draw_sprite_ext(_isp, 0, _ix + _dx + round(cos(_oa)), _dy + round(sin(_oa)),
				                1, 1, 0, _gcol, _st * 0.22 * _pulse * col_a);
			}
			for (var _o2 = 0; _o2 < 8; _o2++)
			{
				var _oa2 = _o2 / 8 * 2 * pi;
				draw_sprite_ext(_isp, 0, _ix + _dx + round(cos(_oa2) * 2), _dy + round(sin(_oa2) * 2),
				                1, 1, 0, _gcol, _st * 0.10 * _pulse * col_a);
			}
			gpu_set_blendmode(bm_normal);
			draw_sprite_ext(_isp, 0, _ix + _dx, _dy, 1, 1, 0, c_white, _st * col_a);
		}
		else
		{
			draw_sprite_ext(_isp, 0, _ix + _dx, _dy, 1, 1, 0,
			                make_colour_rgb(155, 160, 185), _st * 0.88 * col_a);
		}
	}
}

// ---------------------------------------------------------------------
// The soul, with a pulse and a red glow pool
// ---------------------------------------------------------------------
if (instance_exists(o_heart))
{
	var _hx = 0, _hy = 0, _hsp = -1;
	with (o_heart)
	{
		_hx  = x;
		_hy  = y;
		_hsp = sprite_index;
	}

	if (_hsp != -1)
	{
		var _hcw = sprite_get_width(_hsp) * 0.5;
		var _hch = sprite_get_height(_hsp) * 0.5;
		var _hp  = 1 + 0.09 * sin(menu_t * 0.10);
		var _hcol = make_colour_rgb(230, 40, 70);

		gpu_set_blendmode(bm_add);
		draw_primitive_begin(pr_trianglefan);
		draw_vertex_colour(_hx + _hcw, _hy + _hch, _hcol, 0.42 * _intro * _pulse * col_a);
		for (var _p = 0; _p <= 20; _p++)
		{
			var _pa = _p / 20 * 2 * pi;
			draw_vertex_colour(_hx + _hcw + cos(_pa) * 22, _hy + _hch + sin(_pa) * 22, _hcol, 0);
		}
		draw_primitive_end();
		gpu_set_blendmode(bm_normal);

		draw_sprite_ext(_hsp, 0, _hx - _hcw * (_hp - 1), _hy - _hch * (_hp - 1),
		                _hp, _hp, 0, c_white, _intro * col_a);
	}
}

// ---------------------------------------------------------------------
// Gentle vignette over the visible area
// ---------------------------------------------------------------------
draw_set_colour(c_black);
var _vn = 42;
for (var _v = 0; _v < _vn; _v++)
{
	var _vf = 1 - (_v / _vn);
	draw_set_alpha(0.075 * _vf * _vf);
	draw_rectangle(vx_ + _v, vy_ + _v, vx_ + vw_ - 1 - _v, vy_ + vh_ - 1 - _v, true);
}
draw_set_alpha(1);

if (global.transition_alpha > 0) {
    draw_set_alpha(global.transition_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1); // reset alpha
}

draw_set_alpha(1);
draw_set_colour(_prevcol);
