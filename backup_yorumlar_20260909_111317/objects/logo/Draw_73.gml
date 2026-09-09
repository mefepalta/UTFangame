var _prevcol = draw_get_colour();

if (impact_t >= 0)
{
	gpu_set_blendmode(bm_add);

	for (var _i = 0; _i < array_length(sparks); _i++)
	{
		var _sp = sparks[_i];
		var _l  = 1 - (_sp.life / _sp.max);
		draw_set_colour(_sp.col);
		draw_set_alpha(_l * 0.9);
		draw_line_width(_sp.px, _sp.py, _sp.px - _sp.vx * 1.8, _sp.py - _sp.vy * 1.8, max(1, 2.4 * _l));
	}

	if (impact_t < 34)
	{
		var _w   = impact_t / 34;
		var _rr  = 14 + power(_w, 0.55) * 210;
		var _wa  = power(1 - _w, 1.7) * 0.60;
		var _th  = 3 + 11 * (1 - _w);
		var _rc  = make_colour_rgb(215, 205, 255);
		var _seg = 44;

		for (var _half = 0; _half <= 1; _half++)
		{
			var _edge = (_half == 0) ? _rr - _th : _rr + _th;
			draw_primitive_begin(pr_trianglestrip);
			for (var _s = 0; _s <= _seg; _s++)
			{
				var _ang = _s / _seg * 2 * pi;
				var _cs = cos(_ang), _sn = sin(_ang);
				draw_vertex_colour(impact_x + _cs * _edge, impact_y + _sn * _edge, _rc, 0);
				draw_vertex_colour(impact_x + _cs * _rr,   impact_y + _sn * _rr,   _rc, _wa);
			}
			draw_primitive_end();
		}
	}

	if (impact_t < 20)
	{
		var _sa = power(1 - impact_t / 20, 2) * 0.55;
		var _sl = 60 + impact_t * 11;
		var _lc = make_colour_rgb(230, 220, 255);
		for (var _r = 0; _r < 10; _r++)
		{
			var _rang = _r / 10 * 2 * pi + 0.18;
			draw_primitive_begin(pr_trianglelist);
			draw_vertex_colour(impact_x, impact_y, _lc, _sa);
			draw_vertex_colour(impact_x + cos(_rang - 0.05) * _sl, impact_y + sin(_rang - 0.05) * _sl * 0.7, _lc, 0);
			draw_vertex_colour(impact_x + cos(_rang + 0.05) * _sl, impact_y + sin(_rang + 0.05) * _sl * 0.7, _lc, 0);
			draw_primitive_end();
		}
	}

	gpu_set_blendmode(bm_normal);
}

draw_set_colour(c_black);
var _vn = 44;
for (var _v = 0; _v < _vn; _v++)
{
	var _vf = 1 - (_v / _vn);
	draw_set_alpha(0.09 * _vf * _vf);
	draw_rectangle(vx_ + _v, vy_ + _v, vx_ + vw_ - 1 - _v, vy_ + vh_ - 1 - _v, true);
}

if (impact_t >= 0) and (impact_t < 10)
{
	draw_set_colour(make_colour_rgb(238, 232, 255));
	draw_set_alpha(power(1 - impact_t / 10, 2) * 0.42);
	draw_rectangle(vx_, vy_, vx_ + vw_, vy_ + vh_, false);
}

draw_set_alpha(1);
draw_set_colour(_prevcol);
