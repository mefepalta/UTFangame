///@desc Turuncu koridor cizimleri (battle_turn_18'den portlandi)

//--------------------------------------------------------------------------
// Gelen kemik duvarinin UYARISI
//--------------------------------------------------------------------------
// GIF'te tarak gelmeden once kutunun icinde ince kirmizi bir dikdortgen
// beliriyor: duvarin kaplayacagi alanin tam ayak izi. Cerceve, tur nesnesi
// kutunun onunde cizdigi icin burada duruyor.
//
// Atagin ikinci yarisinda GIF'te AYNI ANDA IKI kenarda birden serit
// cikiyor (ust+alt, sol+ust, sag+alt), o yuzden tek bir serit degil liste
// ciziliyor.
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

//--------------------------------------------------------------------------
// Dagilma -- yenilen Papyrus / Alphys
//--------------------------------------------------------------------------
// Karakter kucuk kare parcaciklara bolunmus durumda (bkz. Create_0'daki
// F2SfToz / F2SfDagHazirla). Her parcacik kendi gecikmesiyle kopuyor,
// kopma cizgisi tepeden ayaklara iniyor; kopan parcacik agir agir
// yukselip hafifce salinarak soluyor. Motorun kendi cizimi kapali oldugu
// icin karakteri BU BLOK gosteriyor -- yani kopmamis parcaciklar da
// burada, kendi yerlerinde ciziliyor.
//
// Parcacik listesi ilk cizim karesinde hazirlaniyor: tarama surface
// kullandigi icin Step'te degil, burada yapilmasi gerekiyor.
for (var _dgi = 0; _dgi < array_length(sf_dag); _dgi++)
{
	var _dg = sf_dag[_dgi];
	if (!_dg.hazir) { F2SfDagHazirla(_dg); }

	for (var _pi = 0; _pi < array_length(_dg.parca); _pi++)
	{
		var _p = _dg.parca[_pi];
		// Donmus parcalarda blok izgarasi de donuyor; aralarinda sac teli
		// kadar bosluk kalmasin diye o parcalarda bloklar bir tik buyuk.
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

//--------------------------------------------------------------------------
// Sans'in SAHTE bacaklari
//--------------------------------------------------------------------------
// Motorun kendi bacaklari gizli (F2SfBasla: p2_legs_alpha = 0). Salinim
// motorun surface zincirinden gecmedigi icin bacaklari burada kendimiz
// ciziyoruz -- sahte kalpteki yontemin aynisi.
//
// KONUM: motor Sans'i surface'e cizip sonra ekrana (x-320) kadar kaydirarak
// birlestiriyor (battle_enemy_engage/Draw_0). Yani surface icindeki bir
// nokta ekranda (nokta + x - 320) oluyor; asagidaki hesap o kaydirmayi da
// iceriyor. kay_x panel 2'deki kaymayi, p2_off_x/p2_shake_x ise yer
// degistirme ve hasar titremesini takip ediyor.
//
// HAREKET: motorun kendi hareketinin AYNISI. Ust kenar p2_body_y kadar
// inip cikiyor, alt iki kose ayakta sabit -- yani sadece dikey bir nefes,
// yatay salinim YOK. Deger motordan okunuyor (p2_body_y'yi Step_0 suruyor),
// boylece hiz ve genlik motorun orijinaliyle birebir ayni kaliyor.
// Onceki halinde buraya kendi uydurdugum yatay salinimi koymustum, garip
// duruyordu.
if (sfb_on) and (instance_exists(battle_enemy_engage))
{
	var _bx, _by, _bnefes, _bimg;
	with (battle_enemy_engage)
	{
		_bx = x + p2_off_x + p2_shake_x + kay_x + (x-320);
		_by = y;			// spr_p2_legs'in origin'i ayaklarda: y = ayak hizasi
		_bnefes = p2_body_y*2;
		_bimg = p2_legs_image;
	}
	var _bl = _bx-46;			// 23 (origin.x) * 2
	var _br = _bx+48;			// (47-23) * 2
	var _bt = _by-52+_bnefes;	// 26 (yukseklik) * 2, uzerine nefes
	draw_sprite_pos(spr_p2_legs,_bimg,
		_bl,_bt,
		_br,_bt,
		_br,_by,
		_bl,_by,1);
}

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

//--------------------------------------------------------------------------
// Koridor seritleri
//--------------------------------------------------------------------------
// Ince dikey cizgiler. Engeller asagi akarken bunlar yukari gidiyor ve
// "yukari kosuyoruz" hissini veriyorlar. Alfalari dusuk: patternlerin
// onune gecmemeleri gerekiyor.
if (serit_on)
{
	var _sn = array_length(seritler);
	for (var _i = 0; _i < _sn; _i++)
	{
		var _sr = seritler[_i];
		draw_sprite_ext(spr_pixel,0,_sr.x,_sr.y,2,_sr.boy,0,c_white,_sr.a);
	}
}

//--------------------------------------------------------------------------
// Can gostergesi
//--------------------------------------------------------------------------
// Kalbin hemen ustunde (Can / Max Can). Normalde gorunmez; can azalinca
// beliriyor, kisa sure durup saydamlasiyor (bkz. Create_0 ve Step_0).
if (can_alpha > 0) and (instance_exists(battle_soul))
{
	draw_set_font(font_determination_sans);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	var _yz = string(Player_GetHp())+" / "+string(Player_GetHpMax());
	// Once koyu golge, sonra beyaz yazi: siyah zeminde de platformlarin
	// uzerinde de okunuyor.
	draw_text_transformed_color(battle_soul.x+1,battle_soul.y-15,_yz,0.5,0.5,0,c_black,c_black,c_black,c_black,can_alpha);
	draw_text_transformed_color(battle_soul.x,battle_soul.y-16,_yz,0.5,0.5,0,c_white,c_white,c_white,c_white,can_alpha);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

//--------------------------------------------------------------------------
// Finalin beyaz perdesi
//--------------------------------------------------------------------------
// Motorun fader'i Draw GUI katmaninda cizildigi icin kalbin de onune
// geciyor. Burada perdeyi kendimiz ciziyoruz ve HEMEN ARDINDAN kalbi
// tekrar cizip onde tutuyoruz. Tur nesnesi savas tahtasinin onunde
// (depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH), yani perde platformlari
// ve zemini kapatiyor.
if (final_beyaz > 0)
{
	draw_sprite_ext(spr_pixel,0,0,0,640,480,0,c_white,final_beyaz);
	// Sahte kalp dusuyorsa onu, yoksa gercek ruhu ciziyoruz. Ikisi de
	// perdeden SONRA cizildigi icin beyazin onunde kaliyorlar.
	if (sahte_on) and (instance_exists(battle_soul))
	{
		draw_sprite_ext(battle_soul.sprite_index,battle_soul.image_index,
			battle_board.x,sahte_y,
			battle_soul.image_xscale,battle_soul.image_yscale,
			battle_soul.image_angle,c_white,1);
	}
	else if (instance_exists(battle_soul)) and (!final_kutu)
	{
		// Sahne kurulduktan sonra gercek ruhu perdenin uzerine
		// cizmiyoruz: o an sadece SAHTE kalp gorunmeli, yoksa dipte
		// ikinci bir kalp beliriyor.
		draw_sprite_ext(battle_soul.sprite_index,battle_soul.image_index,
			battle_soul.x,battle_soul.y,
			battle_soul.image_xscale,battle_soul.image_yscale,
			battle_soul.image_angle,c_white,1);
	}
}
