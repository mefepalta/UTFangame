_timer=0;
_start=false;
cang=false;
canga=0;

// Tur nesneleri varsayilan olarak depth 0'da; savas tahtasi -600'de cizildigi
// icin oraya cizilen her sey arkada kaliyordu.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

// --- Phase 2: turuncu ruh koridoru + devir teslim diyalogu ---
// Atak once, diyalog sonra. atak_son atagin bittigi kare.
atak_son=2700;
phase2_text="";
dialog_started=false;


//==========================================================================
// PATTERN 1 -- kemik bilekligi (carousel)
//==========================================================================
// Halka yatay duruyor, ekranda basik bir elips olarak goruluyor. Kemikler
// halkanin uzerinde ARDISIK aci araliklarini kapliyor: i. kemik
// [aci_i, aci_i+1] arasini dolduruyor. Bir kemigin ucu bir sonrakinin ucuyla
// ayni noktada, yani arada hic bosluk yok ve donerken uclar kaymiyor --
// her uc halkanin uzerindeki bir noktaya cakili, kayan sey o noktanin
// kendisi. Kemikler daima yatay; perspektifi uzunluk kisalmasi veriyor.
// Elipsin basik olmasi sart: dik bir halkanin yan taraflari dikey olurdu ve
// yatay kemikler orayi bosluksuz kaplayamazdi.
//
// Bileklikler diger her sey gibi dunya hiziyla asagi kayiyor.
// Kalbin USTUNDEN geciyorlar: yerdeyken zararsizlar, ama ZIPLAYAN kalp
// iceri girip carpiyor. Yani bileklik "simdi ziplama" diyor.
// Beyaz barlar ise tam tersi: yerdeki kalbi vuruyor, havadakine degmiyor,
// yani "simdi zipla" diyor. Ikisi sirayla gelerek bolumun ritmini kuruyor.
car_on=false;
cars=[];				// { y }
car_ang=0;				// halkalarin ortak donusu
car_spin=1.1;			// derece/kare
car_n=14;				// bir bileklikteki kemik sayisi
car_rx=145;				// yatay yaricap
car_ry=28;				// dikey yaricap (basiklik)

///Bir bilekligin i. kemiginin ekrandaki geometrisi.
///x1/x2 iki ucun x i, y kemigin cizildigi yukseklik, on derinlik (-1..1),
///sc kalinlik carpani.
///@arg i		kemik sirasi
///@arg cy		bilekligin merkez y si
CarSeg = function(_i,_cy)
{
	var _adim = 360/car_n;
	var _a1 = car_ang+_i*_adim;
	var _a2 = _a1+_adim;
	return {
		x1: battle_board.x+car_rx*dcos(_a1),
		x2: battle_board.x+car_rx*dcos(_a2),
		y: _cy+car_ry*(dsin(_a1)+dsin(_a2))/2,
		on: dsin(_a1+_adim/2),
		sc: 1.0+1.2*(0.5+0.5*dsin(_a1+_adim/2))
	};
};

///Kemik ucu. Sprite dikey duruyor: +90 sola, -90 saga cevirir.
CarCap = function(_cx,_cy,_ang,_sc,_col,_al)
{
	var _sw = sprite_get_width(spr_paps_bonetop);
	var _sh = sprite_get_height(spr_paps_bonetop);
	var _dx = (_sw/2-sprite_get_xoffset(spr_paps_bonetop))*_sc;
	var _dy = (_sh/2-sprite_get_yoffset(spr_paps_bonetop))*_sc;
	var _rx = _dx*dcos(_ang)+_dy*dsin(_ang);
	var _ry = -_dx*dsin(_ang)+_dy*dcos(_ang);
	draw_sprite_ext(spr_paps_bonetop,0,_cx-_rx,_cy-_ry,_sc,_sc,_ang,_col,_al);
};

///Yatay kemik: iki ucu ve arasini dolduran sap.
CarBone = function(_x1,_x2,_y,_sc,_col,_al)
{
	var _l = min(_x1,_x2);
	var _r = max(_x1,_x2);
	if (_r-_l < 1) { return; }
	var _cap = sprite_get_height(spr_paps_bonetop)*_sc;
	var _kal = 5*_sc;
	// Halkanin en solunda ve saginda kemik tam yandan goruluyor: boyu neredeyse
	// sifira iniyor ve iki uc ust uste binip capraz bir lekeye donusuyordu.
	// Orada tek uc birakiyoruz, kemik kesitmis gibi duruyor.
	if (_r-_l < _cap*1.7)
	{
		CarCap((_l+_r)/2,_y,90,_sc,_col,_al);
		return;
	}
	var _sl = _l+_cap;
	var _sr = _r-_cap;
	if (_sr > _sl)
	{
		draw_set_alpha(_al);
		draw_set_color(_col);
		draw_rectangle(_sl,_y-_kal/2,_sr,_y+_kal/2,false);
		draw_set_alpha(1);
	}
	CarCap(_l+_cap/2,_y,90,_sc,_col,_al);
	CarCap(_r-_cap/2,_y,-90,_sc,_col,_al);
};

///Bileklikleri ve her birinin 130 px altindaki zicrama halkasini dogurur.
///@arg count	kac bileklik
///@arg gap		bileklikler arasi dunya mesafesi
CarRun = function(_count,_gap)
{
	cars = [];
	for (var _i = 0; _i < _count; _i++)
	{
		array_push(cars,{ y: -210-_i*_gap });
	}
	car_on = true;
	car_ang = 0;
	audio_play_sound(snd_exclamation,0,false);
};

CarStop = function()
{
	car_on = false;
	cars = [];
};


//==========================================================================
// PATTERN 2 -- Beklenmedik Konuk (mini-boss)
//==========================================================================
// Konuk uzakta, koridorun tepesinde bekliyor. Birkac saniyede bir kalbi
// nisan alip kendini hizla ustune atiyor; atilirken dunya da hizlaniyor.
// Dash tutturulunca savruluyor. Guc dash i hazirlik boyunca sarj edilip
// tam zamaninda birakilabildigi icin kolay; ufak dash basar basmaz ciktigi
// icin zamanlamasi zor.
// 0 = uzakta bekliyor, 1 = hazirlik, 2 = atilis, 3 = savrulma / geri donus
gst_state=0;
gst_on=false;
gst_x=320;
gst_y=120;
gst_home_y=120;		// bekleme yuksekligi
gst_bekle=70;		// atilislar arasi bekleme (kare)
gst_hazir=22;		// hazirlik suresi (kare)
gst_vx=1.4;			// beklerken yatay suruklenme
gst_t=0;
gst_cycle=0;
gst_max=4;
gst_alpha=0;
gst_flash=0;
gst_bob=0;
gst_scale=2.2;
gst_tx=320;			// atilisin kilitlendigi hedef
gst_ty=400;
gst_spd=19;			// atilis hizi
gst_rvx=0;			// savrulma hizi
gst_rvy=0;

///@arg max	kac kez savrulduktan sonra kaciyor
GuestStart = function(_max)
{
	gst_max = _max;
	gst_cycle = 0;
	gst_on = true;
	gst_state = 0;
	gst_t = 0;
	gst_x = battle_board.x;
	gst_y = -60;
	gst_vx = 1.4;
	gst_flash = 0;
	Anim_Destroy(id,"gst_alpha");
	Anim_Create(id,"gst_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,25);
	audio_play_sound(snd_exclamation,0,false);
};

GuestStop = function()
{
	gst_on = false;
	Anim_Destroy(id,"gst_alpha");
	Anim_Create(id,"gst_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,gst_alpha,-gst_alpha,25);
};


//==========================================================================
// PATTERN 3 -- kucuk kutular
//==========================================================================
// Deltarune deki bolumun 90 derece dondurulmus hali: kutular gidis yonunde
// (yani dikeyde) art arda diziliyor, mavi kenarlar kutunun ALT ve UST
// duvarlari oluyor. Duvarlar zaten var olan bar nesnesiyle yapiliyor
// (battle_dr_obstacle): mavi pencere tam kutu genisligi, gerisi beyaz.
// Boylece dunyayla birlikte kayma ve dash ile kirilma bedavaya geliyor.
// Kutunun YAN duvarlari kati: kalp kutunun icindeyken oraya hapis.
// Kutu boyu dash menzilinden kisa tutuluyor: kalp kutunun ortasindayken
// iki duvar da 50 px otede, yani ufak dash (52) bile ikisini birden kiriyor.
// Kutular arasindaki bosluga yandan blaster geliyor; blasterlar da diger
// her sey gibi asagi kayiyor, dash olunca kayma hizlaniyor.
box_on=false;
boxes=[];			// { ox, w, h, y }
blasts=[];			// { y, side }
box_gap=260;

// Blasterlar oyunun kendi blaster nesnesi (battle_gasterblaster), sadece
// dr_mode acik: ateslendikten sonra geri tepmiyor, nisan aldigi yerde kalip
// dunyayla birlikte asagi kayiyor. Cizimi, sesi, isini ve hasari kendi
// yapiyor -- burada sadece dogus ani belirleniyor.
//
// Isin bastan sona uzuyor, yani yandan kacis yok. Kacis hiz: dogumdan 37
// kare sonra atesliyor, o sirada normal hizda 148 px inmis oluyor ve tam
// kalbin hizasinda patliyor. Dash atip dunyayi hizlandiran oyuncu blasteri
// daha ates etmeden gecmis oluyor.
blast_warn=232;		// blaster bu y de doguyor
blast_len=20000;	// isin uzunlugu (px); kisaltmak istenirse buradan

///@arg side	-1 sol kenar, +1 sag kenar
///@arg y		dogdugu yukseklik
DrBlaster = function(_side,_y)
{
	var _hx = (_side < 0) ? (battle_board.x-battle_board.left-42) : (battle_board.x+battle_board.right+42);
	var _ang = (_side < 0) ? 0 : 180;
	// Son arg 1: giris animasyonu yok, blaster dogrudan yerinde doguyor.
	// BlastCooldown 16 + agiz animasyonunun 20 karesi = 37. karede ates.
	var _b = RegularBlaster(_hx,_y,_hx,_y,_ang,_ang,26,16,2,2,1);
	_b.dr_mode = true;
	_b.dr_len = blast_len;
	// Bir anda belirmesin: seffaf doguyor, 30 karede opaklasiyor. Ates 37.
	// karede oldugu icin agzini acmaya basladiginda coktan tam gorunur.
	// Blasterin kendi kodu image_alpha ya hic dokunmuyor, cakisma yok.
	_b.image_alpha = 0;
	Anim_Create(_b,"image_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,30);
	return _b;
};

///@arg count	kac kutu
///@arg w		kutu genisligi
///@arg h		kutu yuksekligi
///@arg gap		kutular arasi bosluk
///@arg off		merkeze gore sapma
BoxRun = function(_count,_w,_h,_gap,_off)
{
	boxes = [];
	blasts = [];
	box_gap = _gap;
	var _adim = _h+_gap;
	for (var _i = 0; _i < _count; _i++)
	{
		var _ox = (_i % 2 == 0) ? -_off : _off;
		var _y = 150-_i*_adim;
		array_push(boxes,{ ox:_ox, w:_w, h:_h, y:_y });

		// Alt ve ust duvar. Mavi pencere tam kutu genisligi: kalp kutunun
		// icindeyken sadece maviye denk geliyor, yani gecmenin tek yolu dash.
		var _b1 = DrBone(_ox,_w);
		_b1.y = _y+_h/2;
		var _b2 = DrBone(_ox,_w);
		_b2.y = _y-_h/2;

		// Boslugun tam ortasina bir blaster, terk edilen kutunun tarafindan.
		// Duvar dash i ile blaster dash i arasinda 130 px (32 kare) var,
		// ufak dash in 24 karelik beklemesine rahat siginiyor.
		if (_i < _count-1)
		{
			array_push(blasts,{
				y: _y-_h/2-_gap/2,
				side: (_ox < 0) ? -1 : 1,
				dogdu: false
			});
		}
	}
	box_on = true;
	audio_play_sound(snd_exclamation,0,false);
};

BoxStop = function()
{
	box_on = false;
	boxes = [];
	blasts = [];
	with (battle_dr_obstacle) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
};


//==========================================================================
// PATTERN 4 -- ziplama bolumu yardimcilari
//==========================================================================
// Halkalar ve barlar hepsi ayni anda, ekranin cok yukarisinda dogup
// aralarindaki mesafeyi koruyarak birlikte iniyorlar. Kare araligiyla
// dogursaydik, zincir sirasinda dunya hizlandigi icin aralar bozulurdu.

///@arg off	kutu merkezine gore x ofseti
///@arg dy	ilk halkaya gore kac px yukarida
JumpRing = function(_off,_dy)
{
	var _r = DrRing(_off);
	_r.y -= _dy;
	return _r;
};

///Bastan sona beyaz, kirilamaz bar. Havadaki kalbe degmiyor: tek gecis
///yolu ziplamayi tutturmak.
///@arg dy	ilk halkaya gore kac px yukarida
JumpBar = function(_dy)
{
	// Mavi pencere barin cok disina itiliyor: geriye tek parca, bastan sona
	// beyaz bir kemik kaliyor. blue_w=0 verilseydi pencere tam ortada kalip
	// bari iki ayri kemige bolerdi.
	var _b = DrBone(-9999,2);
	_b.y -= _dy;
	return _b;
};
