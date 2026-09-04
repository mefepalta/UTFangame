if (global.fade_alpha <= 0.004)
{
	exit;
}

var _a       = global.fade_alpha;
var _prevcol = draw_get_colour();
var _pulse   = 0.70 + 0.30 * sin(optt * 0.09);

var _x0 = panel_cx - panel_w * 0.5;
var _x1 = panel_cx + panel_w * 0.5;
var _y0 = panel_top;
var _y1 = panel_bot;

// ---------------------------------------------------------------------
// Panel plate: flat in the middle, feathered at every edge
// ---------------------------------------------------------------------
var _padx = 30, _pady = 20;
var _pa   = 0.70 * _a;
var _rowsy = [_y0, _y0 + _pady, _y1 - _pady, _y1];
var _rowsa = [0, 1, 1, 0];

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
		draw_vertex_colour(_px, _rowsy[_r],     c_black, _pa * _rowsa[_r]     * _hf);
		draw_vertex_colour(_px, _rowsy[_r + 1], c_black, _pa * _rowsa[_r + 1] * _hf);
	}
	draw_primitive_end();
}

// thin frame
draw_set_alpha(_a * 0.30);
draw_set_colour(make_colour_rgb(170, 190, 245));
draw_roundrect_ext(_x0 + 10, _y0 + 8, _x1 - 10, _y1 - 8, 6, 6, true);

// ---------------------------------------------------------------------
// Title
// ---------------------------------------------------------------------
draw_set_font(font_determination_mono_2);
line_h = string_height("Mg");
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_alpha(_a);
draw_set_colour(make_colour_rgb(225, 232, 255));
draw_text(panel_cx, title_y, "OPTIONS");

draw_set_alpha(_a * 0.28);
draw_line(_x0 + 34, title_y + 17, _x1 - 34, title_y + 17);

// ---------------------------------------------------------------------
// Rows
// ---------------------------------------------------------------------
var _n = array_length(menu_items);
for (var _i = 0; _i < _n; _i++)
{
	var _ry  = rows_y + _i * row_sp;
	var _sel = (_i == menu_index);

	if (_sel)
	{
		// soft band of light under the selected row
		var _bcy = _ry + line_h * 0.5;
		var _bhh = 11;
		gpu_set_blendmode(bm_add);
		var _bcol = make_colour_rgb(110, 145, 240);
		for (var _bh = 0; _bh <= 1; _bh++)
		{
			var _bedge = (_bh == 0) ? _bcy - _bhh : _bcy + _bhh;
			draw_primitive_begin(pr_trianglestrip);
			for (var _bc = 0; _bc <= 16; _bc++)
			{
				var _bfx = _bc / 16;
				var _bpx = (_x0 + 20) + ((_x1 - 20) - (_x0 + 20)) * _bfx;
				var _bfd = power(sin(_bfx * pi), 1.3);
				draw_vertex_colour(_bpx, _bedge, _bcol, 0);
				draw_vertex_colour(_bpx, _bcy,   _bcol, 0.32 * _bfd * _a * _pulse);
			}
			draw_primitive_end();
		}
		gpu_set_blendmode(bm_normal);
	}

	// label
	draw_set_halign(fa_left);
	draw_set_alpha(_a * (_sel ? 1 : 0.70));
	draw_set_colour(_sel ? c_white : make_colour_rgb(168, 174, 198));
	draw_text(text_left, _ry, menu_items[_i]);

	if (_i == 5)
	{
		// ---- volume slider -------------------------------------------
		var _bw = 74, _bhgt = 6;
		var _bx1 = text_right;
		var _bx0 = _bx1 - _bw;
		var _by  = _ry + line_h * 0.5 - 3;

		draw_set_alpha(_a * 0.85);
		draw_set_colour(make_colour_rgb(38, 40, 62));
		draw_roundrect_ext(_bx0, _by, _bx1, _by + _bhgt, 3, 3, false);

		draw_set_alpha(_a * (_sel ? 1 : 0.8));
		draw_set_colour(make_colour_rgb(255, 205, 70));
		draw_roundrect_ext(_bx0, _by, _bx0 + max(4, _bw * global.display_volume), _by + _bhgt, 3, 3, false);

		draw_set_alpha(_a * 0.45);
		draw_set_colour(make_colour_rgb(160, 170, 210));
		draw_roundrect_ext(_bx0, _by, _bx1, _by + _bhgt, 3, 3, true);

		if (_sel)
		{
			draw_set_alpha(_a * _pulse);
			draw_set_colour(make_colour_rgb(255, 225, 130));
			draw_set_halign(fa_right);
			draw_text(_bx0 - 6, _ry, "<");
			draw_set_halign(fa_left);
			draw_text(_bx1 + 6, _ry, ">");
		}
	}
	else
	{
		// ---- value ---------------------------------------------------
		var _on  = false;
		var _lbl = "";
		switch (_i)
		{
			case 0: _on = global.fullscreen;     _lbl = _on ? "ON" : "OFF"; break;
			case 1: _on = global.border_enabled; _lbl = _on ? "ON" : "OFF"; break;
			case 2: _on = true;                  _lbl = window_scale_labels[global.window_scale_index]; break;
			case 3: _on = global.no_heal;        _lbl = _on ? "ON" : "OFF"; break;
			case 4: _on = global.no_hit;         _lbl = _on ? "ON" : "OFF"; break;
		}

		draw_set_halign(fa_right);
		draw_set_alpha(_a * (_sel ? 1 : 0.78));
		draw_set_colour(_on ? make_colour_rgb(255, 212, 88) : make_colour_rgb(126, 132, 156));
		draw_text(text_right, _ry, _lbl);

		if (_sel) and (_i == 2)
		{
			var _vw2 = string_width(_lbl);
			draw_set_alpha(_a * _pulse);
			draw_set_colour(make_colour_rgb(255, 225, 130));
			draw_set_halign(fa_right);
			draw_text(text_right - _vw2 - 6, _ry, "<");
			draw_set_halign(fa_left);
			draw_text(text_right + 6, _ry, ">");
		}
	}
}

// ---------------------------------------------------------------------
// Control hint
// ---------------------------------------------------------------------
draw_set_halign(fa_center);
draw_set_alpha(_a * 0.62);
draw_set_colour(make_colour_rgb(160, 166, 192));
draw_text(panel_cx, hint_y, "Z Toggle    X Back");

// ---------------------------------------------------------------------
// Restore draw state
// ---------------------------------------------------------------------
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_colour(_prevcol);
