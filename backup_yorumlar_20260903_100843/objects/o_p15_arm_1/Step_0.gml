if (!variable_global_exists("p15_sx")) { global.p15_sx = 0; global.p15_sy = 0; }

var _beat = instance_exists(o_textcontroller_p15) ? o_textcontroller_p15.beat : 0;

with (o_p15_body)
{
	if (sprite_index == s_p15sanssheet_1) { other.pure_x = pure_x - 30; other.pure_y = pure_y - 48; }
	if (sprite_index == s_p15sanssheet_6) { other.pure_x = pure_x - 30; other.pure_y = pure_y - 32; }
}

angle_timer += 0.04;
// Sag kolun aynasi
image_angle = base_angle + sin(angle_timer) * -2 + _beat * 5;

x = pure_x + global.p15_sx;
y = pure_y + global.p15_sy;
