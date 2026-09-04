if (image_alpha <= 0.004)
{
	exit;
}

var _p = 0.55 + 0.45 * (0.5 + 0.5 * sin(pulse * 0.06));

gpu_set_blendmode(bm_add);
for (var _g = 1; _g <= 2; _g++)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1 + _g * 0.02, 1 + _g * 0.02, 0,
	                make_colour_rgb(200, 220, 255), image_alpha * _p * 0.42 / _g);
}

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, image_alpha * (0.82 + 0.18 * _p));
