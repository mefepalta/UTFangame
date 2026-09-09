/// Ciziim sirasi onemli: once govde, sonra govdeyi kirpan siyah seritler,
/// EN SON baslik/alt serit. (Eski surumde baslik seritlerden once ciziliyordu
/// ve ustteki serit basligi tamamen siliyordu.)

var _a = min(1, yanip / 25);          // odaya girerken kisa bir acilis

// Zemin
draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(_a);

// --- Govde (viewport disindaki satirlar hic cizilmiyor) -----------------
draw_set_font(font_body);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var _i = 0; _i < array_length(satir); _i++)
{
	var _ly = VP_UST + _i * LINE_H - kaydir;
	if (_ly + LINE_H < VP_UST) continue;
	if (_ly > VP_ALT) break;
	draw_text(KENAR_SOL, _ly, satir[_i]);
}

// --- CONTINUE dugmesi ---------------------------------------------------
if (btn_y2 > VP_UST) and (btn_y1 < VP_ALT)
{
	var _aktif = dibe_indi;
	var _col   = _aktif ? (btn_hover ? c_yellow : c_white) : c_gray;

	draw_set_color(_col);
	draw_rectangle(btn_x1, btn_y1, btn_x2, btn_y2, true);
	draw_rectangle(btn_x1 + 1, btn_y1 + 1, btn_x2 - 1, btn_y2 - 1, true);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text((btn_x1 + btn_x2) * 0.5, (btn_y1 + btn_y2) * 0.5,
	          _aktif ? "CONTINUE" : "KEEP SCROLLING");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

// --- Govdeyi kirpan siyah seritler --------------------------------------
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, VP_UST - 1, false);
draw_rectangle(0, VP_ALT + 1, room_width, room_height, false);

draw_set_alpha(_a);

// --- Baslik -------------------------------------------------------------
draw_set_font(font_title);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(320, 20, baslik);

draw_set_color(c_gray);
draw_line(KENAR_SOL, VP_UST - 12, room_width - KENAR_SOL, VP_UST - 12);
draw_line(KENAR_SOL, VP_ALT + 12, room_width - KENAR_SOL, VP_ALT + 12);

// --- Scrollbar ----------------------------------------------------------
if (kaydir_max > 0)
{
	var _bar_h   = VP_ALT - VP_UST;
	var _orani   = vp_h / (vp_h + kaydir_max);
	var _thumb_h = max(28, _bar_h * _orani);
	var _thumb_y = VP_UST + (kaydir / kaydir_max) * (_bar_h - _thumb_h);

	draw_set_color(c_gray);
	draw_rectangle(BAR_X - 5, VP_UST, BAR_X + 5, VP_ALT, true);
	draw_set_color(bar_tutuluyor ? c_yellow : c_white);
	draw_rectangle(BAR_X - 4, _thumb_y, BAR_X + 4, _thumb_y + _thumb_h, false);
}

// --- Alt ipucu ----------------------------------------------------------
draw_set_font(font_body);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (dibe_indi)
{
	// Yanip sonen onay istemi: gorundugu an gercekten basilabilir durumda.
	draw_set_alpha(_a * (0.35 + 0.65 * (0.5 + 0.5 * dsin(yanip * 2.4))));
	draw_set_color(c_white);
	draw_text(320, 450, "PRESS  Z  TO ACCEPT");
}
else
{
	var _yuzde = (kaydir_max > 0) ? floor((kaydir / kaydir_max) * 100) : 100;
	draw_set_color(c_gray);
	draw_text(320, 450, "SCROLL DOWN TO THE END   -   " + string(_yuzde) + "%");
}

// Ciziim durumunu geri birak
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
