if (_state == 0)
{
	// Yon belirteci: boltun uzerinden (gosterge_yer 0) ya da tahmini patlama
	// noktasindan (1), o_alphys_bolt'un Step_0'daki hareketini
	// (direction += curve; curve *= decay) ayni sirayla simule ederek her
	// boltun ilk gosterge_adim karelik yolunu ve ucuna ok cizer.
	if (gosterge) and (image_alpha > 0)
	{
		var _p = (gosterge_yer == 0) ? [x,y] : PatlamaNoktasi();
		if (!is_undefined(_p))
		{
			var _f = FanAyar();
			var _ga = image_alpha*(0.45+0.4*abs(dsin(_t*6)));
			draw_set_color(gosterge_col);
			draw_set_alpha(_ga);
			if (gosterge_yer != 0) { draw_circle(_p[0],_p[1],3,false); }
			for (var _i = 0; _i < _f.adet; _i++)
			{
				var _d = fan_base + _i*(360/_f.adet);
				var _c = _f.curve;
				var _lx = _p[0];
				var _ly = _p[1];
				for (var _k = 0; _k < gosterge_adim; _k++)
				{
					_d += _c;
					_c *= _f.decay;
					var _nx = _lx+lengthdir_x(fan_speed,_d);
					var _ny = _ly+lengthdir_y(fan_speed,_d);
					draw_line_width(_lx,_ly,_nx,_ny,gosterge_kalin);
					_lx = _nx;
					_ly = _ny;
				}
				draw_line_width(_lx,_ly,_lx+lengthdir_x(6,_d+150),_ly+lengthdir_y(6,_d+150),gosterge_kalin);
				draw_line_width(_lx,_ly,_lx+lengthdir_x(6,_d-150),_ly+lengthdir_y(6,_d-150),gosterge_kalin);
			}
			draw_set_alpha(1);
			draw_set_color(c_white);
		}
	}

	draw_self();
	if (image_alpha >= 1)
	{
		if (place_meeting(x,y,battle_soul))
		{
			Battle_CallSoulEventBulletCollision();
		}
	}
}
else
{
	var _a = 1 - (_t/boom_time);
	draw_sprite_ext(spr_boom,0,x,y,boom_scale,boom_scale,0,c_white,_a);
}
