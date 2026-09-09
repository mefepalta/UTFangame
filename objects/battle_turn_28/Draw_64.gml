if (!ara_kilit) { exit; }

var _mx = window_mouse_get_x();
var _my = window_mouse_get_y();

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
if (window_get_width()  > 0) { _mx = _mx*(_gw/window_get_width());  }
if (window_get_height() > 0) { _my = _my*(_gh/window_get_height()); }

if (_mx < -32) or (_my < -32) or (_mx > _gw+32) or (_my > _gh+32) { exit; }

var _a = (ara_t*2.5) mod 360;
for (var _i = 0; _i < 3; _i++)
{
	var _aa = _a + _i*120;
	draw_sprite_ext(spr_bone_origin_center,1,
		_mx+lengthdir_x(11,_aa), _my+lengthdir_y(11,_aa),
		1, 1.6, _aa+90, c_aqua, 1);
}
