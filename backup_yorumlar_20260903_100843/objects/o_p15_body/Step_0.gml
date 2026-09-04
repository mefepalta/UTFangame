if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p15_sx"))    { global.p15_sx = 0; global.p15_sy = 0; }

global.bob_timer += 0.02;

// Muzik vurusunda gogus kafesi bir zonkluyor
var _beat = instance_exists(o_textcontroller_p15) ? o_textcontroller_p15.beat : 0;

pure_y = base_y + sin(global.bob_timer) * 0.7 - _beat * 1.6;

// Govde sprite'i ve x'i bacaklardan geliyor:
//   legs.image_index 1 = kambur duruş, 0 = dik duruş
with (o_p15_legs)
{
	other.sprite_index = (image_index == 1) ? s_p15sanssheet_6 : s_p15sanssheet_1;
	other.pure_x = pure_x;
}

image_xscale = 2 + _beat * 0.05;
image_yscale = 2 - _beat * 0.04;

x = pure_x + global.p15_sx;
y = pure_y + global.p15_sy;
