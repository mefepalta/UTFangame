var _prevcol = draw_get_colour();

draw_set_colour(c_black);
var _vn = 90;
for (var _v = 0; _v < _vn; _v++)
{
	var _f = 1 - (_v / _vn);
	draw_set_alpha(0.11 * _f * _f);
	draw_rectangle(_v, _v, 639 - _v, 479 - _v, true);
}

draw_set_alpha(0.05);
for (var _y = 0; _y < 480; _y += 3)
{
	draw_line(0, _y, 640, _y);
}

gpu_set_blendmode(bm_add);
draw_set_colour(make_colour_rgb(120, 150, 255));
var _sy = (sweep mod 760) - 80;
for (var _s = 8; _s >= 1; _s--)
{
	draw_set_alpha(0.010);
	draw_rectangle(0, _sy - _s * 5, 640, _sy + _s * 5, false);
}
gpu_set_blendmode(bm_normal);

if (image_alpha > 0)
{
	draw_set_colour(c_black);
	draw_set_alpha(image_alpha);
	draw_rectangle(0, 0, 640, 480, false);
}

draw_set_alpha(1);
draw_set_colour(_prevcol);
