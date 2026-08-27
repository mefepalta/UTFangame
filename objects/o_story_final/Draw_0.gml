draw_set_color(c_black);
draw_rectangle(0,0,640,480,false);
draw_set_alpha(1);
draw_set_color(c_white);

///Bir 1078x593 paneli cerceveye oturtur.
var _panel = function(_spr,_a)
{
	if (_a <= 0) { return; }
	draw_sprite_ext(_spr,0,PN_X,PN_Y,PN_OL,PN_OL,0,c_white,_a);
};

///0'dan 1'e yumusak acilma (kare sayisi cinsinden).
var _ac = function(_t,_sure) { return clamp(_t/max(1,_sure),0,1); };

switch (bolum)
{
	//---------------------------------------------------------------- 1
	// Once manzara, sonra sag alta denk gelen ayak.
	case 1:
		_panel(end_frame_1,1);
		// end_frame_1_5 AYNI cerceveye ciziliyor: arka plani kaldirilmis
		// hali zaten sag altta duruyor, ayri konum hesabi gerekmiyor.
		_panel(end_frame_1_5,_ac(bt-180,40));
		break;

	//---------------------------------------------------------------- 2
	// Patikada iki figur; ikincisi gelirken ilki soluyor.
	case 2:
		_panel(end_frame_2,1);
		var _a1 = _ac(bt-140,45)*(1-_ac(bt-380,70));
		var _a2 = _ac(bt-380,60);
		for (var _fi = 0; _fi < 2; _fi++)
		{
			var _f = f25[_fi];
			var _fa = (_fi == 0) ? _a1 : _a2;
			if (_fa <= 0) { continue; }
			draw_sprite_part_ext(end_frame_2_5,0,_f.sx,_f.sy,_f.sw,_f.sh,
				PN_X+_f.sx*F25_OL,PN_Y+_f.sy*F25_OL,F25_OL,F25_OL,c_white,_fa);
		}
		break;

	//---------------------------------------------------------------- 3
	// unknown 703x384; ayni cerceve genisligine oturtuluyor.
	case 3:
		var _uo = PN_GEN/703;
		draw_sprite_ext(unknown,0,PN_X,PN_Y+(PN_YUK-384*_uo)/2,_uo,_uo,0,c_white,1);
		break;

	//---------------------------------------------------------------- 4
	// Agaclar X ekseninde tekrarlanip SAGA kayiyor. Sadece govdeler
	// arasindaki bosluk Sans'in uzerine gelene kadar (AGAC_KAY kaynak
	// pikseli) kayiyorlar -- daha fazlasi bir sonraki govdeyi getiriyor.
	case 4:
		_panel(end_frame_3,1);
		var _kay = _ac(bt-150,320)*AGAC_KAY*PN_OL;
		var _tw = 1078*PN_OL;
		for (var _ti = -1; _ti <= 1; _ti++)
		{
			draw_sprite_ext(end_frame_3_5,0,PN_X+_kay+_ti*_tw,PN_Y,PN_OL,PN_OL,0,c_white,1);
		}
		break;

	//---------------------------------------------------------------- 5
	// Dikey paneller: ekran yuksekligini tam dolduruyor ve SAG KENARA
	// yaslaniyor (taslaktaki gibi). 4_2 en altta duruyor; 4_4 uzerine
	// aciliyor, nefes (4_6) buyuyup saydamlasiyor ve nefes tamamen
	// kaybolunca 4_4 soluyarak 4_2'yi geri getiriyor.
	case 5:
		draw_sprite_ext(big_long_ending_panel4_2,0,B4_X,B4_Y,B4_OL,B4_OL,0,c_white,1);

		var _nt = bt-320;
		var _np = clamp(_nt/130,0,1);		// nefesin ilerlemesi (1 = yok oldu)

		// Nefes bittikten sonra 4_4 soluyor -> altindaki 4_2 geri geliyor.
		var _a44 = _ac(bt-180,45)*(1-_ac(bt-470,70));
		if (_a44 > 0)
		{
			draw_sprite_ext(big_long_ending_panel4_4,0,B4_X,B4_Y,B4_OL,B4_OL,0,c_white,_a44);
		}

		if (_nt > 0) and (_np < 1)
		{
			// Nefes Sans'in agzindan cikip buyuyerek saydamlasiyor;
			// buyume icerigin merkezinden oluyor.
			var _no = B4_OL*(1+_np*1.6);
			draw_sprite_ext(big_long_ending_panel4_6,0,
				B4_X+NEFES_MX*B4_OL-NEFES_MX*_no,
				B4_Y+NEFES_MY*B4_OL-NEFES_MY*_no,
				_no,_no,0,c_white,1-_np);
		}
		break;

	//---------------------------------------------------------------- 6
	// Alt paneller arasindaki gecisi siyah perde yapiyor; burada yalnizca
	// o anki panel duruyor, boylece paneller birbirinin icinden gorunmuyor.
	case 6:
		_panel(b6[alt].spr,1);
		break;

	//---------------------------------------------------------------- 7
	// "a short pause" -- ekranda hicbir sey yok, dumduz siyah.
	case 7:
		break;

	//---------------------------------------------------------------- 8
	case 8:
		_panel(b8[alt].spr,1);
		break;
}

//------------------------------------------------------ panel disi karartma
// Panelle ekran kenari arasinda kalan her yer siyah kalmali; 4. bolumdeki
// kayan agaclar disari tasmamali. 5. bolumdeki dikey paneller ekranin
// sagina tam oturdugu icin alan onlara gore hesaplaniyor.
var _al = PanelAlan();
draw_set_color(c_black);
draw_set_alpha(1);
if (_al.y > 0) { draw_rectangle(0,0,640,_al.y-1,false); }
if (_al.y+_al.h < 480) { draw_rectangle(0,_al.y+_al.h,640,480,false); }
if (_al.x > 0) { draw_rectangle(0,0,_al.x-1,480,false); }
if (_al.x+_al.w < 640) { draw_rectangle(_al.x+_al.w,0,640,480,false); }

//----------------------------------------------------------------- metin
// Daktilo gibi akiyor; oyuncu girdisi yok.
if (mt_on) and (mt_i < array_length(mt_liste))
{
	var _s = mt_liste[mt_i];
	var _n = min(string_length(_s),floor(mt_t/MT_HIZ));
	draw_set_font(font_sans);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(320,PN_Y+PN_YUK+42,string_copy(_s,1,_n));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

//------------------------------------------------------------------ perde
// Butun gecisler bunun altinda oluyor.
if (perde > 0)
{
	draw_set_color(c_black);
	draw_set_alpha(perde);
	draw_rectangle(0,0,640,480,false);
	draw_set_alpha(1);
}

draw_set_alpha(1);
draw_set_color(c_white);
