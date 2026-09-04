var _prevcol = draw_get_colour();
var _cx = vx_ + vw_ * 0.5;
var _cy = vy_ + vh_ * 0.5;

gpu_set_blendmode(bm_add);

var _gc = make_colour_rgb(70, 40, 150);
var _ga = (0.28 + 0.045 * sin(fx_t * 0.020)) * clamp(fx_t / 60, 0, 1);
if (impact_t >= 0)
{
	_ga += clamp(1 - impact_t / 50, 0, 1) * 0.22;
}
var _gy = 210;
if (instance_exists(o_logo)) { _gy = o_logo.y; }

draw_primitive_begin(pr_trianglefan);
draw_vertex_colour(_cx, _gy, _gc, _ga);
for (var _p = 0; _p <= 30; _p++)
{
	var _pa = _p / 30 * 2 * pi;
	draw_vertex_colour(_cx + cos(_pa) * 200, _gy + sin(_pa) * 110, _gc, 0);
}
draw_primitive_end();

for (var _j = 0; _j < array_length(stars); _j++)
{
	var _st = stars[_j];
	var _tw = 0.30 + 0.70 * (0.5 + 0.5 * sin(_st.phase));
	draw_set_colour(make_colour_rgb(190, 200, 255));
	draw_set_alpha(_tw * 0.45);
	draw_circle(_st.px, _st.py, _st.r, false);
}

for (var _i = 0; _i < array_length(dust); _i++)
{
	var _f = dust[_i];
	draw_set_colour(make_colour_rgb(215, 195, 255));
	draw_set_alpha(_f.a * 0.30);
	draw_circle(_f.px, _f.py, _f.r * 2.4, false);
	draw_set_alpha(_f.a);
	draw_circle(_f.px, _f.py, _f.r, false);
}

if (_spear == true) and (!impacted) and (instance_exists(o_spear))
{
	var _sx = o_spear.x, _sy = o_spear.y;
	draw_set_colour(make_colour_rgb(190, 200, 255));
	for (var _tr = 1; _tr <= 8; _tr++)
	{
		draw_set_alpha(0.22 * (1 - _tr / 9));
		draw_line_width(_sx - o_spear.xspd * (_tr - 1) * 0.9, _sy - o_spear.yspd * (_tr - 1) * 0.9,
		                _sx - o_spear.xspd * _tr * 0.9,       _sy - o_spear.yspd * _tr * 0.9,
		                max(1, 7 - _tr));
	}
}

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_colour(_prevcol);
