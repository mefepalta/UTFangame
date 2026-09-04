/// @desc Canlandirma sahnesi
// Draw GUI'de degil, dunya katmaninda ciziliyor: border nesnesi Draw GUI End'de
// display_set_gui_maximize cagirip GUI'yi yeniden olcekliyor ve Post-Draw'da
// application_surface'i kendisi kompozitliyor. Bu yuzden GUI koordinatlari
// guvenilir degildi. depth = -9000000 oldugu icin tum savas nesnelerinin
// (en dusugu DEPTH_BATTLE.BULLET_OUTSIDE_HIGH = -1000) uzerine cizilir.
if (!active) { exit; }

var _w = room_width;
var _h = room_height;

// soul_x / soul_y zaten dunya koordinati
var _sx = soul_x + soul_shake_x;
var _sy = soul_y + soul_shake_y;

//--------------------------------------------------------------------------
// Ekrani karart (ruh haric her sey kaybolur)
//--------------------------------------------------------------------------
if (black_alpha > 0)
{
	draw_set_colour(c_black);
	draw_set_alpha(black_alpha);
	draw_rectangle(0,0,_w,_h,false);
	draw_set_alpha(1);
}

//--------------------------------------------------------------------------
// Kalp parcalari: ekranin cesitli yerlerinden gelip ruhun yerinde birlesir.
// spr_battle_soul_slice_white, kirmizi orijinalin beyaza boyanmis kopyasi.
// Once gpu_set_fog ile boyamayi denemistim ama surucuye bagli calisiyor ve
// parcalar oyunda kirmizi kaliyordu; hazir beyaz sprite kesin cozum.
//--------------------------------------------------------------------------
if (piece_p > 0) and (piece_p < 1)
{
	for (var i = 0; i < PIECE_N; i++)
	{
		var _pp = (piece_p - piece_delay[i]) / (1 - piece_delay[i]);
		if (_pp > 0)
		{
			_pp = min(_pp,1);
			// hizlanarak gelsinler: sonda kalbe carpiyor hissi
			var _e = _pp*_pp;
			var _ix = _sx + piece_ox[i]*(1-_e);
			var _iy = _sy + piece_oy[i]*(1-_e);
			draw_sprite_ext(spr_battle_soul_slice_white,piece_img[i],_ix,_iy,2,2,piece_ang[i]+piece_spin[i]*t,c_white,1);
		}
	}
}

//--------------------------------------------------------------------------
// Isinlar: ruhtan disari firlayan konik huzmeler
//--------------------------------------------------------------------------
if (beam_alpha > 0) and (beam_len > 0)
{
	draw_set_colour(c_white);
	draw_set_alpha(beam_alpha);
	var _half = 9;						// isinin dis ucundaki yari genislik
	for (var i = 0; i < beam_n; i++)
	{
		var _a = beam_spin + i*(360/beam_n);
		var _ex = _sx + lengthdir_x(beam_len,_a);
		var _ey = _sy + lengthdir_y(beam_len,_a);
		var _px = lengthdir_x(_half,_a+90);
		var _py = lengthdir_y(_half,_a+90);
		draw_triangle(_sx,_sy,_ex+_px,_ey+_py,_ex-_px,_ey-_py,false);
	}
	draw_set_alpha(1);
}

//--------------------------------------------------------------------------
// Merkezden buyuyen beyaz daire
//--------------------------------------------------------------------------
if (circle_r > 0)
{
	draw_set_colour(c_white);
	draw_circle(_sx,_sy,circle_r,false);
}

//--------------------------------------------------------------------------
// Ruh: koyu griden bembeyaza.
//--------------------------------------------------------------------------
if (soul_alpha > 0)
{
	var _v = 60 + soul_bright*195;					// 60 -> 255
	var _col = make_colour_rgb(_v,_v,_v);
	var _sc = 2 * soul_scale;

	draw_sprite_ext(s_monster_soul,0,_sx,_sy,_sc,_sc,0,_col,soul_alpha);
}


//--------------------------------------------------------------------------
// Tam beyaz parlama
//--------------------------------------------------------------------------
if (flash_alpha > 0)
{
	draw_set_colour(c_white);
	draw_set_alpha(flash_alpha);
	draw_rectangle(0,0,_w,_h,false);
	draw_set_alpha(1);
}

//--------------------------------------------------------------------------
// Patlamada savrulan parcalar: ayni noktadan firlayip duserler
//--------------------------------------------------------------------------
if (debris_on) and (debris_alpha > 0)
{
	for (var i = 0; i < DEBRIS_N; i++)
	{
		draw_sprite_ext(spr_battle_soul_slice_white,deb_img[i],_sx+deb_x[i],_sy+deb_y[i],2,2,deb_ang[i],c_white,debris_alpha);
	}
}

//--------------------------------------------------------------------------
// Karakter belirdikten sonra uzerinde buyuyup saydamlasan beyaz daire
//--------------------------------------------------------------------------
if (ring_alpha > 0) and (ring_r > 0)
{
	draw_set_colour(c_white);
	draw_set_alpha(ring_alpha);
	draw_circle(_sx,_sy,ring_r,false);
	draw_set_alpha(1);
}

draw_set_colour(c_white);
