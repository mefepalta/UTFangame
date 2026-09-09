var _max = max(0, _icerik_h - _vp_h + btn_h + 30);

// --- Fare tekerlegi ---
if (mouse_wheel_up())   { kaydir -= LINE_H*3; }
if (mouse_wheel_down()) { kaydir += LINE_H*3; }

// --- Scrollbar surukleme (sag kenar) ---
var _bar_x  = KENAR_SAG + 14;
var _bar_y0 = VP_UST;
var _bar_h  = _vp_h;
var _orani  = (_max > 0) ? (_vp_h / (_vp_h + _max)) : 1;
var _thumb_h = max(24, _bar_h * _orani);
var _thumb_y = _bar_y0 + ((_max > 0) ? (kaydir / _max) * (_bar_h - _thumb_h) : 0);

var _mx = mouse_x;
var _my = mouse_y;
var _fare = (mouse_check_button(mb_left));

if (_fare) and (!_fare_onceki)
{
	// thumb'a bastiysa surukleme baslat
	if (_mx >= _bar_x-8) and (_mx <= _bar_x+8) and (_my >= _thumb_y) and (_my <= _thumb_y+_thumb_h)
	{
		bar_tutuluyor = true;
		bar_tut_ofs = _my - _thumb_y;
	}
}
if (!_fare) { bar_tutuluyor = false; }

if (bar_tutuluyor) and (_max > 0)
{
	var _yeni = (_my - bar_tut_ofs - _bar_y0) / max(1,(_bar_h - _thumb_h));
	kaydir = clamp(_yeni,0,1) * _max;
}

kaydir = clamp(kaydir, 0, _max);

// --- CONTINUE dugmesi (icerik sonunda) ---
var _btn_cx = (KENAR_SOL + KENAR_SAG) * 0.5;
var _btn_y  = VP_UST + _icerik_h + 8 - kaydir;   // icerikle beraber kayiyor
btn_x1 = _btn_cx - btn_w*0.5;  btn_x2 = _btn_cx + btn_w*0.5;
btn_y1 = _btn_y;               btn_y2 = _btn_y + btn_h;

btn_hover = (_mx >= btn_x1) and (_mx <= btn_x2) and (_my >= btn_y1) and (_my <= btn_y2)
            and (_my >= VP_UST) and (_my <= VP_ALT);

if (_fare) and (!_fare_onceki) and (btn_hover)
{
	audio_play_sound(snd_menu_confirm, 2, false);
	room_goto(hedef_oda);
}

_fare_onceki = _fare;
