if (!variable_global_exists("p15_sx")) { global.p15_sx = 0; global.p15_sy = 0; }

var _beat = instance_exists(o_textcontroller_p15) ? o_textcontroller_p15.beat : 0;

with (o_p15_body)
{
	if (sprite_index == s_p15sanssheet_1) { other.pure_x = pure_x - 13; other.pure_y = pure_y - 48; }
	if (sprite_index == s_p15sanssheet_6) { other.pure_x = pure_x - 13; other.pure_y = pure_y - 36; }
}

// Sag kanadin aynasi: ayni egri, ters isaret
flutter += 0.05;
image_angle = -(sin(flutter) * 2.0 + sin(flutter * 0.37) * 1.0 - _beat * 9);

var _pop = _beat * 0.09;
image_xscale = -2 * (1 + _pop);
image_yscale =  2 * (1 + _pop);

x = pure_x + global.p15_sx;
y = pure_y + global.p15_sy;
