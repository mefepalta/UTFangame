var _prevcol = draw_get_colour();

var _intro = clamp((menu_t - 6) / 34, 0, 1);
_intro = 1 - power(1 - _intro, 3);
var _pulse = 0.72 + 0.28 * sin(menu_t * 0.09);

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

		var _st = clamp((menu_t - 6 - (3 - _i) * 7) / 30, 0, 1);
		_st = 1 - power(1 - _st, 3);

		var _dx = item_dx[_i] - (1 - _st) * 34;
		var _dy = _iy;

		if (_i == menucounter)
		{
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

if (extras_a > 0.004)
{
	var _ea = extras_a;
	var _ep = 0.72 + 0.28 * sin(extras_t * 0.09);
	var _eun = variable_global_exists("phase2_unlocked") and global.phase2_unlocked;

	var _ex0 = 320 - 128, _ex1 = 320 + 128;
	var _ey0 = 130, _ey1 = 350;

	var _epadx = 30, _epady = 20;
	var _epa = 0.72 * _ea;
	var _erowy = [_ey0, _ey0 + _epady, _ey1 - _epady, _ey1];
	var _erowa = [0, 1, 1, 0];
	for (var _er = 0; _er < 3; _er++)
	{
		draw_primitive_begin(pr_trianglestrip);
		for (var _ec = 0; _ec <= 32; _ec++)
		{
			var _epx = _ex0 + (_ex1 - _ex0) * (_ec / 32);
			var _ehf = 1;
			if (_epx < _ex0 + _epadx)      { _ehf = (_epx - _ex0) / _epadx; }
			else if (_epx > _ex1 - _epadx) { _ehf = (_ex1 - _epx) / _epadx; }
			_ehf = clamp(_ehf, 0, 1);
			_ehf = _ehf * _ehf * (3 - 2 * _ehf);
			draw_vertex_colour(_epx, _erowy[_er],     c_black, _epa * _erowa[_er]     * _ehf);
			draw_vertex_colour(_epx, _erowy[_er + 1], c_black, _epa * _erowa[_er + 1] * _ehf);
		}
		draw_primitive_end();
	}

	draw_set_alpha(_ea * 0.30);
	draw_set_colour(make_colour_rgb(170, 190, 245));
	draw_roundrect_ext(_ex0 + 10, _ey0 + 8, _ex1 - 10, _ey1 - 8, 6, 6, true);

	draw_set_font(font_determination_mono_2);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_set_alpha(_ea);
	draw_set_colour(make_colour_rgb(225, 232, 255));
	draw_text(320, _ey0 + 12, "EXTRAS");
	draw_set_alpha(_ea * 0.28);
	draw_line(_ex0 + 34, _ey0 + 30, _ex1 - 34, _ey0 + 30);

	var _tw = 68, _th = 105, _tgap = 26;
	var _tx0 = 320 - (_tw * 2 + _tgap) * 0.5;
	var _ty  = _ey0 + 46;

	for (var _ti = 0; _ti < 2; _ti++)
	{
		var _tx   = _tx0 + _ti * (_tw + _tgap);
		var _tsel = (_ti == extras_index);
		var _tlck = (_ti == 1) and (!_eun);
		var _tsub = _ti * 2 + ((_tsel and !_tlck) ? 1 : 0);
		var _tsh  = (_tsel and extras_deny > 0) ? round(sin(extras_deny * 1.7) * 3) : 0;

		if (_tsel)
		{
			gpu_set_blendmode(bm_add);
			var _tgc = _tlck ? make_colour_rgb(200, 80, 80) : make_colour_rgb(110, 145, 240);
			draw_primitive_begin(pr_trianglefan);
			draw_vertex_colour(_tx + _tw * 0.5 + _tsh, _ty + _th * 0.5, _tgc, (_tlck ? 0.20 : 0.34) * _ea * _ep);
			for (var _tq = 0; _tq <= 24; _tq++)
			{
				var _tqa = _tq / 24 * 2 * pi;
				draw_vertex_colour(_tx + _tw * 0.5 + _tsh + cos(_tqa) * 52,
				                   _ty + _th * 0.5 + sin(_tqa) * 72, _tgc, 0);
			}
			draw_primitive_end();
			gpu_set_blendmode(bm_normal);
		}

		var _tcol = make_colour_rgb(150, 155, 180);
		if (_tlck)     { _tcol = make_colour_rgb(74, 74, 96); }
		else if (_tsel){ _tcol = c_white; }

		draw_sprite_ext(s_phasetile, _tsub, _tx + _tsh, _ty, 1, 1, 0, _tcol, _ea * (_tsel ? 1 : 0.85));
	}

	var _ehint = "[Z] START     [C] BACK";
	var _ehcol = make_colour_rgb(190, 200, 235);
	if (extras_index == 1) and (!_eun)
	{
		_ehint = "BEAT PHASE 1 TO UNLOCK";
		_ehcol = make_colour_rgb(235, 120, 120);
	}
	draw_set_alpha(_ea * 0.9);
	draw_set_colour(_ehcol);
	draw_text(320, _ey1 - 40, _ehint);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}

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
    draw_set_alpha(1);
}

draw_set_alpha(1);
draw_set_colour(_prevcol);
