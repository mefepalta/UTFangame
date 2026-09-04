var _prevcol = draw_get_colour();

// ---------------------------------------------------------------------
// Nebula pools + starfield, drawn additively on top of s_creditsbg.
// The clouds are triangle fans (bright centre -> transparent rim) so they
// fade out smoothly instead of showing a circle edge.
// ---------------------------------------------------------------------
gpu_set_blendmode(bm_add);

for (var _n = 0; _n < array_length(nebula); _n++)
{
	var _cl = nebula[_n];
	var _nx = _cl.px + sin(fx_t * 0.0021 + _cl.phase) * 95;
	var _ny = _cl.py + cos(fx_t * 0.0016 + _cl.phase) * 45;

	draw_primitive_begin(pr_trianglefan);
	draw_vertex_colour(_nx, _ny, _cl.col, 0.16);
	for (var _p = 0; _p <= 26; _p++)
	{
		var _ang = _p / 26 * 2 * pi;
		draw_vertex_colour(_nx + cos(_ang) * _cl.r, _ny + sin(_ang) * _cl.r * 0.72, _cl.col, 0);
	}
	draw_primitive_end();
}

for (var _i = 0; _i < array_length(stars); _i++)
{
	var _s  = stars[_i];
	var _tw = 0.35 + 0.65 * (0.5 + 0.5 * sin(_s.phase));
	draw_set_colour(_s.tint);
	draw_set_alpha(_tw * 0.20);
	draw_circle(_s.px, _s.py, _s.size * 3.0, false);
	draw_set_alpha(_tw * 0.85);
	draw_circle(_s.px, _s.py, _s.size, false);
}

draw_set_colour(c_white);
for (var _j = 0; _j < array_length(shots); _j++)
{
	var _sh = shots[_j];
	var _l  = 1 - (_sh.life / 110);
	for (var _t = 1; _t <= 7; _t++)
	{
		draw_set_alpha(_l * (1 - _t / 7) * 0.45);
		draw_line_width(_sh.px - _sh.vx * (_t - 1) * 1.6, _sh.py - _sh.vy * (_t - 1) * 1.6,
		                _sh.px - _sh.vx * _t * 1.6,       _sh.py - _sh.vy * _t * 1.6,
		                max(1, 3 - _t * 0.4));
	}
}

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_colour(c_white);

// ---------------------------------------------------------------------
// The credits board: a soft pool of light with the text blooming on top
// ---------------------------------------------------------------------
if (panel_sprite != -1) and (panel_alpha > 0.004)
{
	var _w    = sprite_get_width(panel_sprite);
	var _h    = sprite_get_height(panel_sprite);
	var _glow = clamp(panel_glow, 0, 1.6);

	gpu_set_blendmode(bm_add);

	// soft horizontal lens of light behind the text - built from two
	// triangle strips so it has no visible edges at all
	var _bcol = make_colour_rgb(80, 110, 210);
	var _cx   = panel_x;
	var _cy   = panel_y + _h * 0.5;
	var _hw   = _w * 0.5 + 110;
	var _hh   = _h * 0.5 + 34;
	var _peak = panel_alpha * (0.16 + panel_flash * 0.10);
	var _cols = 14;

	for (var _half = 0; _half <= 1; _half++)
	{
		var _edge = (_half == 0) ? _cy - _hh : _cy + _hh;
		draw_primitive_begin(pr_trianglestrip);
		for (var _c = 0; _c <= _cols; _c++)
		{
			var _fx   = _c / _cols;
			var _px   = _cx - _hw + _fx * _hw * 2;
			var _fade = power(sin(_fx * pi), 1.5);
			draw_vertex_colour(_px, _edge, _bcol, 0);
			draw_vertex_colour(_px, _cy,   _bcol, _peak * _fade);
		}
		draw_primitive_end();
	}

	// bloom copies of the text itself
	for (var _g = 1; _g <= 3; _g++)
	{
		var _sc = panel_scale * (1 + _g * 0.014);
		var _oy = panel_y - _h * (_sc - panel_scale) * 0.5;
		draw_sprite_ext(panel_sprite, 0, panel_x, _oy, _sc, _sc, 0,
		                make_colour_rgb(200, 220, 255), panel_alpha * _glow * 0.30 / _g);
	}

	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	draw_sprite_ext(panel_sprite, 0, panel_x, panel_y, panel_scale, panel_scale, 0, c_white, panel_alpha);
}

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_colour(_prevcol);
