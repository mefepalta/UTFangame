
yanip++;

var _mx = mouse_x;
var _my = mouse_y;
var _fare = mouse_check_button(mb_left);
var _tik  = (_fare) and (!fare_onceki);

var _hiz = LINE_H * 0.45;
if (keyboard_check(vk_down))  or (keyboard_check(ord("S"))) { kaydir_hedef += _hiz; }
if (keyboard_check(vk_up))    or (keyboard_check(ord("W"))) { kaydir_hedef -= _hiz; }
if (keyboard_check_pressed(vk_pagedown)) { kaydir_hedef += vp_h * 0.85; }
if (keyboard_check_pressed(vk_pageup))   { kaydir_hedef -= vp_h * 0.85; }

if (mouse_wheel_up())   { kaydir_hedef -= LINE_H * 3; }
if (mouse_wheel_down()) { kaydir_hedef += LINE_H * 3; }

var _bar_h   = vp_h;
var _orani   = (kaydir_max > 0) ? (vp_h / (vp_h + kaydir_max)) : 1;
var _thumb_h = max(28, _bar_h * _orani);
var _thumb_y = VP_UST + ((kaydir_max > 0) ? (kaydir_hedef / kaydir_max) * (_bar_h - _thumb_h) : 0);

if (_tik) and (kaydir_max > 0)
{
	if (_mx >= BAR_X - 10) and (_mx <= BAR_X + 10) and (_my >= VP_UST) and (_my <= VP_ALT)
	{
		if (_my >= _thumb_y) and (_my <= _thumb_y + _thumb_h)
		{
			bar_tutuluyor = true;
			bar_tut_ofs   = _my - _thumb_y;
		}
		else
		{
			bar_tutuluyor = true;
			bar_tut_ofs   = _thumb_h * 0.5;
		}
	}
}
if (!_fare) { bar_tutuluyor = false; }

if (bar_tutuluyor) and (kaydir_max > 0)
{
	var _t = (_my - bar_tut_ofs - VP_UST) / max(1, (_bar_h - _thumb_h));
	kaydir_hedef = clamp(_t, 0, 1) * kaydir_max;
}

kaydir_hedef = clamp(kaydir_hedef, 0, kaydir_max);

if (bar_tutuluyor) { kaydir = kaydir_hedef; }
else               { kaydir += (kaydir_hedef - kaydir) * 0.35; }
if (abs(kaydir_hedef - kaydir) < 0.5) { kaydir = kaydir_hedef; }

if (kaydir_hedef >= kaydir_max - 0.5) { dibe_indi = true; }

var _btn_cx = KENAR_SOL + METIN_GEN * 0.5;
var _btn_y  = VP_UST + icerik_h + BTN_UST_BOSLUK - kaydir;
btn_x1 = _btn_cx - btn_w * 0.5;
btn_x2 = _btn_cx + btn_w * 0.5;
btn_y1 = _btn_y;
btn_y2 = _btn_y + btn_h;

btn_hover = (dibe_indi)
        and (_mx >= btn_x1) and (_mx <= btn_x2)
        and (_my >= btn_y1) and (_my <= btn_y2)
        and (_my >= VP_UST) and (_my <= VP_ALT);

var _onay = false;
if (_tik) and (btn_hover) { _onay = true; }
if (dibe_indi) and (Input_IsPressed(INPUT.CONFIRM)) { _onay = true; }

if (_onay)
{
	audio_play_sound(snd_menu_confirm, 2, false);
	room_goto(hedef_oda);
}

fare_onceki = _fare;

