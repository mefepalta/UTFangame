///@desc Pattern cizimleri

//--------------------------------------------------------------------------
// Kemik bileklikleri
//--------------------------------------------------------------------------
// Her bileklik icin once arka yari, sonra on yari ciziliyor ki ust uste
// binme dogru olsun. Arkadakiler hem soluk hem ince hem yari saydam: tur
// nesnesi kutunun onune cizdigi icin uzaklik hissini bunlar veriyor.
if (car_on) and (instance_exists(battle_board))
{
	var _uzak = make_color_rgb(70,70,110);
	for (var _c = 0; _c < array_length(cars); _c++)
	{
		var _cy = cars[_c].y;
		if (_cy < -90) or (_cy > 570) { continue; }
		for (var _pas = 0; _pas < 2; _pas++)
		{
			for (var _i = 0; _i < car_n; _i++)
			{
				var _sg = CarSeg(_i,_cy);
				if ((_pas == 0) != (_sg.on <= 0)) { continue; }
				var _t = 0.5+0.5*_sg.on;
				CarBone(_sg.x1,_sg.x2,_sg.y,_sg.sc,merge_color(_uzak,c_white,_t),0.45+0.55*_t);
			}
		}
	}
	draw_set_color(c_white);
	draw_set_alpha(1);
}

//--------------------------------------------------------------------------
// Kucuk kutular
//--------------------------------------------------------------------------
// Alt/ust duvarlar barlarin kendisi (battle_dr_obstacle) tarafindan
// ciziliyor. Burada sadece kati yan duvarlar var.
if (box_on) and (instance_exists(battle_board))
{
	draw_set_alpha(1);
	draw_set_color(make_color_rgb(0,255,0));
	for (var _i = 0; _i < array_length(boxes); _i++)
	{
		var _kb = boxes[_i];
		var _kcx = battle_board.x+_kb.ox;
		var _kt = _kb.y-_kb.h/2;
		var _kd = _kb.y+_kb.h/2;
		draw_rectangle(_kcx-_kb.w/2,_kt,_kcx-_kb.w/2+3,_kd,false);
		draw_rectangle(_kcx+_kb.w/2-3,_kt,_kcx+_kb.w/2,_kd,false);
	}
	draw_set_color(c_white);
}

//--------------------------------------------------------------------------
// Beklenmedik Konuk
//--------------------------------------------------------------------------
// Hazirlik ve atilis sirasinda mavi: o an SADECE guc dash isliyor demek.
// Savrulunca bir an beyaz parliyor. Beklerken hafifce inip cikiyor.
if (gst_alpha > 0)
{
	var _gc = c_white;
	if (gst_state == 1) or (gst_state == 2) { _gc = make_color_rgb(30,55,175); }
	if (gst_flash > 0) { _gc = c_white; }
	var _sars = (gst_state == 1) ? irandom_range(-3,3) : 0;
	var _gy = gst_y+((gst_state == 0) ? dsin(gst_bob*3)*4 : 0);
	draw_sprite_ext(spr_dr_guest,0,gst_x+_sars,_gy,gst_scale,gst_scale,0,_gc,gst_alpha);
	draw_set_color(c_white);
	draw_set_alpha(1);
}

// Blasterlar oyunun kendi nesnesi oldugu icin cizimleri kendilerine ait;
// burada bir sey yapmiyoruz.

//--------------------------------------------------------------------------
// Sigara dumani
//--------------------------------------------------------------------------
// Her kume yukseldikce buyuyup soluyor. Alfa once hizla aciliyor, sonra
// karesel sonuyor: duman boyle dagiliyor.
// spr_papyrus_smoke'un origin'i SAG-ALT kosede (28,24), o yuzden gorsel
// merkezin kume noktasina denk gelmesi icin cizim yeri kaydiriliyor.
if (array_length(duman) > 0)
{
	for (var _i = 0; _i < array_length(duman); _i++)
	{
		var _dm = duman[_i];
		var _o = _dm.t/_dm.omur;
		var _sc = 0.5+1.3*_o;
		var _al = 0.55*min(1,_o*6)*(1-_o)*(1-_o);
		draw_sprite_ext(spr_papyrus_smoke,0,_dm.x+14*_sc,_dm.y+12*_sc,_sc,_sc,0,c_white,_al);
	}
	draw_set_alpha(1);
}
