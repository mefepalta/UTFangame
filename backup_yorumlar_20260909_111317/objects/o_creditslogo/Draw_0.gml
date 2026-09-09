var _dy = y + sin(glow * 0.028) * 4;
var _br = 1 + sin(glow * 0.045) * 0.014;
var _xs = image_xscale * _br;
var _ys = image_yscale * _br;

var _prevcol = draw_get_colour();

gpu_set_blendmode(bm_add);

var _hcol = make_colour_rgb(90, 60, 190);
var _hr   = 250 * image_xscale;
var _ha   = (0.22 + 0.06 * sin(glow * 0.05)) * image_alpha;
draw_primitive_begin(pr_trianglefan);
draw_vertex_colour(x, _dy, _hcol, _ha);
for (var _p = 0; _p <= 28; _p++)
{
	var _ang = _p / 28 * 2 * pi;
	draw_vertex_colour(x + cos(_ang) * _hr, _dy + sin(_ang) * _hr * 0.62, _hcol, 0);
}
draw_primitive_end();

draw_sprite_ext(sprite_index, image_index, x, _dy, _xs * 1.02, _ys * 1.02, image_angle,
                c_white, image_alpha * 0.10);

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_colour(c_white);

draw_sprite_ext(sprite_index, image_index, x, _dy, _xs, _ys, image_angle, image_blend, image_alpha);

draw_set_colour(_prevcol);
