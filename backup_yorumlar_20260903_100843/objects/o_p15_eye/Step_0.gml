if (!variable_global_exists("p15_sx")) { global.p15_sx = 0; global.p15_sy = 0; }

// Acildigi an bir kez buyuyup yerine oturuyor, sonra yavasca nefes aliyor
if (image_alpha > 0)
{
	pop = min(pop + 1, 999);
	var _punch = 0.55 * exp(-pop / 9);
	var _breath = sin(pop * 0.045) * 0.05;
	image_xscale = 1 + _punch + _breath;
	image_yscale = 1 + _punch * 1.4 + _breath;
}

x = base_x + global.p15_sx;
y = base_y + global.p15_sy;
