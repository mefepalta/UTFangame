// Siyah zemin
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Baslik (sabit)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_determination_mono_1);
draw_set_color(c_white);
draw_text_transformed(320, 40, baslik, 1.4, 1.4, 0);

// --- Metin alani (viewport ile kirpilmis) ---
// GameMaker'da basit kirpma icin: satiri sadece viewport icindeyse ciz.
draw_set_font(font_body);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var _i = 0; _i < array_length(metin); _i++)
{
	var _ly = VP_UST + _i*LINE_H - kaydir;
	if (_ly + LINE_H < VP_UST) continue;
	if (_ly > VP_ALT) break;
	draw_set_color(c_white);
	draw_text(KENAR_SOL, _ly, metin[_i]);
}

// CONTINUE dugmesi (viewport icindeyse)
if (btn_y1 < VP_ALT) and (btn_y2 > VP_UST)
{
	var _c = btn_hover ? c_yellow : c_white;
	draw_set_color(_c);
	draw_rectangle(btn_x1, btn_y1, btn_x2, btn_y2, true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed((btn_x1+btn_x2)*0.5, (btn_y1+btn_y2)*0.5, "CONTINUE", 1.2, 1.2, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

// Viewport disini maskele (ust/alt siyah seritler -- kirpma yerine ustune ciz)
draw_set_color(c_black);
draw_rectangle(0, VP_UST-1, room_width, 0, false);       // ust
draw_rectangle(0, room_height, room_width, VP_ALT+1, false); // alt

// --- Scrollbar (sag kenar) ---
var _max = max(0, _icerik_h - (VP_ALT-VP_UST) + btn_h + 30);
var _bar_x  = KENAR_SAG + 14;
var _bar_h  = VP_ALT - VP_UST;
var _orani  = (_max > 0) ? ((VP_ALT-VP_UST) / ((VP_ALT-VP_UST) + _max)) : 1;
var _thumb_h = max(24, _bar_h * _orani);
var _thumb_y = VP_UST + ((_max > 0) ? (kaydir / _max) * (_bar_h - _thumb_h) : 0);

draw_set_color(c_gray);
draw_rectangle(_bar_x-4, VP_UST, _bar_x+4, VP_ALT, true);
draw_set_color(bar_tutuluyor ? c_yellow : c_white);
draw_rectangle(_bar_x-4, _thumb_y, _bar_x+4, _thumb_y+_thumb_h, false);

// Alt ipucu
draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_text(320, 452, "scroll down and click CONTINUE");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
