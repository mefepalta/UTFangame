if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p15_sx"))    { global.p15_sx = 0; global.p15_sy = 0; }

var _p    = 0;
var _line = -1;
var _beat = 0;
if (instance_exists(o_textcontroller_p15)) {
    _p    = o_textcontroller_p15.p15;
    _line = o_textcontroller_p15.current_line;
    _beat = o_textcontroller_p15.beat;
}

pure_y = base_y + sin(global.bob_timer) * 1 - _beat * 2.2;

with (o_p15_legs) { other.pure_x = pure_x; }

with (o_p15_body)
{
	if (sprite_index == s_p15sanssheet_6) { other.pure_y = pure_y - 36; }
}

x = pure_x + global.p15_sx;
y = pure_y + global.p15_sy;

if (_p > 335 && _line >= 1)
{
	sprite_index = s_p15_headraise_2;
	switch (_line)
	{
		case  1: image_index = 7; break;
		case  2: image_index = 7; break;
		case  3: image_index = 8; break;
		case  4: image_index = 8; break;
		case  5: image_index = 8; break;
		case  6: image_index = 7; break;
		case  7: image_index = 7; break;
		case  8: image_index = 8; break;
		case  9: image_index = 3; break;
		case 10: image_index = 3; break;
		case 11: image_index = 8; break;
		case 12: image_index = 3; break;
		case 13: image_index = 3; break;
		case 14: image_index = 6; break;
		case 15: image_index = 7; break;
		case 16: image_index = 8; break;
		case 17: image_index = 8; break;
		case 18: image_index = 3; break;
		case 19: image_index = 8; break;
		case 20: image_index = 3; break;
	}
}
