
if (instance_exists(battle_board)) and (array_length(sf_uy) > 0)
{
	draw_set_alpha(1);
	draw_set_color(c_red);
	for (var _uyi = 0; _uyi < array_length(sf_uy); _uyi++)
	{
		var _uy = F2SfUyariAlan(sf_uy[_uyi]);
		draw_rectangle(_uy.l,_uy.u,_uy.r,_uy.d,true);
	}
	draw_set_color(c_white);
}

for (var _dgi = 0; _dgi < array_length(sf_dag); _dgi++)
{
	var _dg = sf_dag[_dgi];
	if (!_dg.hazir) { F2SfDagHazirla(_dg); }

	for (var _pi = 0; _pi < array_length(_dg.parca); _pi++)
	{
		var _p = _dg.parca[_pi];
		var _ex = (_p.aci == 0) ? _p.ex : _p.ex*1.25;
		var _ey = (_p.aci == 0) ? _p.ey : _p.ey*1.25;
		var _n = array_length(_p.bx);
		for (var _k = 0; _k < _n; _k++)
		{
			var _s = _dg.t-_p.bek[_k];
			var _ox = 0, _oy = 0, _oa = 1;
			if (_s > 0)
			{
				_ox = _p.vx[_k]*_s+dsin(_s*2.6+_k*37)*SF_DAG_SAL;
				_oy = _p.vy[_k]*_s;
				if (_s > SF_DAG_TAM) { _oa = 1-((_s-SF_DAG_TAM)/(SF_DAG_OMUR-SF_DAG_TAM)); }
			}
			if (_oa <= 0) { continue; }
			draw_sprite_part_ext(_p.spr,_p.img,_p.bx[_k],_p.by[_k],SF_DAG_BLOK,SF_DAG_BLOK,
				_p.wx[_k]+_ox,_p.wy[_k]+_oy,_ex,_ey,c_white,_oa);
		}
	}
}
draw_set_alpha(1);

if (sfb_on) and (instance_exists(battle_enemy_engage))
{
	var _bx, _by, _bnefes, _bimg;
	with (battle_enemy_engage)
	{
		_bx = x + p2_off_x + p2_shake_x + kay_x + (x-320);
		_by = y;
		_bnefes = p2_body_y*2;
		_bimg = p2_legs_image;
	}
	var _bl = _bx-46;
	var _br = _bx+48;
	var _bt = _by-52+_bnefes;
	draw_sprite_pos(spr_p2_legs,_bimg,
		_bl,_bt,
		_br,_bt,
		_br,_by,
		_bl,_by,1);
}

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

if (serit_on)
{
	var _sn = array_length(seritler);
	for (var _i = 0; _i < _sn; _i++)
	{
		var _sr = seritler[_i];
		draw_sprite_ext(spr_pixel,0,_sr.x,_sr.y,2,_sr.boy,0,c_white,_sr.a);
	}
}

if (can_alpha > 0) and (instance_exists(battle_soul))
{
	draw_set_font(font_determination_sans);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	var _yz = string(Player_GetHp())+" / "+string(Player_GetHpMax());
	draw_text_transformed_color(battle_soul.x+1,battle_soul.y-15,_yz,0.5,0.5,0,c_black,c_black,c_black,c_black,can_alpha);
	draw_text_transformed_color(battle_soul.x,battle_soul.y-16,_yz,0.5,0.5,0,c_white,c_white,c_white,c_white,can_alpha);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if (array_length(catlaklar) > 0) and (catlak_alpha > 0) and (instance_exists(battle_board))
{
	var _zx = battle_board.x;
	var _zy = battle_board.y;
	var _kl = battle_board.x-battle_board.left;
	var _ku = battle_board.y-battle_board.up;
	var _kr = battle_board.x+battle_board.right;
	var _kd = battle_board.y+battle_board.down;
	draw_set_color(c_white);
	draw_set_alpha(catlak_alpha);
	for (var _ci = 0; _ci < array_length(catlaklar); _ci++)
	{
		var _ct = catlaklar[_ci];
		var _seg = array_length(_ct.p)-1;
		var _ilerle = _ct.t*_seg;
		for (var _i = 0; _i < _seg; _i++)
		{
			if (_ilerle <= _i) { break; }
			var _o = min(1,_ilerle-_i);
			var _a = _ct.p[_i], _b = _ct.p[_i+1];
			var _kp = CatlakKirp(_zx+_a.x,_zy+_a.y,
				_zx+_a.x+(_b.x-_a.x)*_o,_zy+_a.y+(_b.y-_a.y)*_o,
				_kl,_ku,_kr,_kd);
			if (!is_undefined(_kp))
			{
				draw_line_width(_kp.x1,_kp.y1,_kp.x2,_kp.y2,2);
			}
		}
	}
	draw_set_color(c_white);
	draw_set_alpha(1);
}

if (isin_on)
{
	var _o = 0;
	var _kal = 0;
	if (isin_faz == 1) { _o = min(1,isin_t/T20_ISIN_TOPLA); }
	else if (isin_faz == 2) { _o = 1; _kal = T20_ISIN_KALIN; }
	else if (isin_faz == 3)
	{
		_o = max(0,1-isin_t/T20_ISIN_KAPAN);
		_kal = T20_ISIN_KALIN*_o;
	}

	if (_kal > 1)
	{
		draw_set_alpha(0.35);
		draw_sprite_ext(spr_pixel,0,-20,isin_y-_kal/2,isin_x+20,_kal,0,c_white,1);
		draw_set_alpha(1);
		draw_sprite_ext(spr_pixel,0,-20,isin_y-_kal*0.28,isin_x+20,_kal*0.56,0,c_white,1);
	}

	if (_o > 0)
	{
		var _r = T20_ISIN_DAIRE*_o+((isin_faz == 1) ? irandom_range(-2,2) : 0);
		draw_set_alpha(0.4);
		draw_set_color(c_white);
		draw_circle(isin_x,isin_y,_r*1.5,false);
		draw_set_alpha(1);
		draw_circle(isin_x,isin_y,_r,false);
	}
	draw_set_alpha(1);
	draw_set_color(c_white);
}

if (final_beyaz > 0)
{
	draw_sprite_ext(spr_pixel,0,0,0,640,480,0,c_white,final_beyaz);
	if (sahte_on) and (instance_exists(battle_soul))
	{
		draw_sprite_ext(battle_soul.sprite_index,battle_soul.image_index,
			battle_board.x,sahte_y,
			battle_soul.image_xscale,battle_soul.image_yscale,
			battle_soul.image_angle,c_white,1);
	}
	else if (instance_exists(battle_soul)) and (!final_kutu)
	{
		draw_sprite_ext(battle_soul.sprite_index,battle_soul.image_index,
			battle_soul.x,battle_soul.y,
			battle_soul.image_xscale,battle_soul.image_yscale,
			battle_soul.image_angle,c_white,1);
	}
}
