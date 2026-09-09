if (!active) { exit; }

var _w = room_width;
var _h = room_height;

var _sx = soul_x + soul_shake_x;
var _sy = soul_y + soul_shake_y;

if (black_alpha > 0)
{
	draw_set_colour(c_black);
	draw_set_alpha(black_alpha);
	draw_rectangle(0,0,_w,_h,false);
	draw_set_alpha(1);
}

if (piece_p > 0) and (piece_p < 1)
{
	for (var i = 0; i < PIECE_N; i++)
	{
		var _pp = (piece_p - piece_delay[i]) / (1 - piece_delay[i]);
		if (_pp > 0)
		{
			_pp = min(_pp,1);
			var _e = _pp*_pp;
			var _ix = _sx + piece_ox[i]*(1-_e);
			var _iy = _sy + piece_oy[i]*(1-_e);
			draw_sprite_ext(spr_battle_soul_slice_white,piece_img[i],_ix,_iy,2,2,piece_ang[i]+piece_spin[i]*t,c_white,1);
		}
	}
}

if (beam_alpha > 0) and (beam_len > 0)
{
	draw_set_colour(c_white);
	draw_set_alpha(beam_alpha);
	var _half = 9;
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

if (circle_r > 0)
{
	draw_set_colour(c_white);
	draw_circle(_sx,_sy,circle_r,false);
}

if (soul_alpha > 0)
{
	var _v = 60 + soul_bright*195;
	var _col = make_colour_rgb(_v,_v,_v);
	var _sc = 2 * soul_scale;

	draw_sprite_ext(s_monster_soul,0,_sx,_sy,_sc,_sc,0,_col,soul_alpha);
}


if (flash_alpha > 0)
{
	draw_set_colour(c_white);
	draw_set_alpha(flash_alpha);
	draw_rectangle(0,0,_w,_h,false);
	draw_set_alpha(1);
}

if (debris_on) and (debris_alpha > 0)
{
	for (var i = 0; i < DEBRIS_N; i++)
	{
		draw_sprite_ext(spr_battle_soul_slice_white,deb_img[i],_sx+deb_x[i],_sy+deb_y[i],2,2,deb_ang[i],c_white,debris_alpha);
	}
}

if (ring_alpha > 0) and (ring_r > 0)
{
	draw_set_colour(c_white);
	draw_set_alpha(ring_alpha);
	draw_circle(_sx,_sy,ring_r,false);
	draw_set_alpha(1);
}

draw_set_colour(c_white);
