_timer=0;
_start=false;
cang=false;
canga=0;

// Tur nesneleri varsayilan olarak depth 0'da; savas tahtasi -600'de cizildigi
// icin oraya cizilen her sey arkada kaliyordu.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

// --- Phase 2: turuncu ruh koridoru + devir teslim diyalogu ---
// Atak once, diyalog sonra.
//
// Bolum tetikleri kareye degil, dunyanin kat ettigi YOLa bagli: dunya dash
// ile 2.4 katina kadar hizlandigi icin sabit kareler iyi oynayan oyuncuya
// bosluk aciyordu. yol her karede koridorun scroll_spd si kadar artiyor.
yol=0;
bolum=0;			// hangi bolume gelindi (bkz. Step_0)
bitis_kare=-1;		// atak bittigi kare; diyalog bunun 70 kare sonrasinda
atak_yol=6860;		// bu yola varilinca turuncu bolum bitiyor

// --- Sari ruh bolumu ---
// Turuncu koridor bitince baslar. Sari ruh kutunun merkezine cakili,
// sadece 8 yone nisan aliyor: bolum bir atis galerisi.
sari_on=false;
sari_t=0;
sari_son=900;		// bu karede bolum bitiyor (son varis 830)

// --- Kirmizi ruh bolumu ---
// Sari bolum bitince baslar. Ruh normal hareket ediyor. Kisa tutuldu:
// sadece iki eleman var, blaster cemberi ve yildirimlar.
kir_on=false;
kir_t=0;
kir_son=650;		// bu karede bolum bitiyor
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

///Tek bir bileklik koyar. Konum kalbe varana kadarki YOL cinsinden, cunku
///her bilekligin bir tuzak halkanin yay ortasina denk gelmesi gerekiyor.
///@arg d	kalbe varis mesafesi (px)
CarMark = function(_d)
{
	array_push(cars,{ y: 400-_d });
	car_on = true;
};

CarStop = function()
{
	car_on = false;
	cars = [];
};


//==========================================================================
// Beklenmedik Konuk (mini-boss) bu atakta YOK.
//==========================================================================
// Bir sonraki atakta kullanilacak. Calisan hali a02e0eb commitinde:
//   git show a02e0eb:objects/battle_turn_16/Create_0.gml
//   git show a02e0eb:objects/battle_turn_16/Step_0.gml
// Oraya donerken kendi nesnesine (battle_dr_guest) tasinacak ki her tur
// cagirabilsin; simdilik burada olu kod birakmiyoruz.

//==========================================================================
// PATTERN 3 -- kucuk kutular
//==========================================================================
// Deltarune deki bolumun 90 derece dondurulmus hali: kutular gidis yonunde
// (yani dikeyde) art arda diziliyor, mavi kenarlar kutunun ALT ve UST
// duvarlari oluyor. Duvarlar zaten var olan bar nesnesiyle yapiliyor
// (battle_dr_obstacle): mavi pencere tam kutu genisligi, gerisi beyaz.
// Boylece dunyayla birlikte kayma ve dash ile kirilma bedavaya geliyor.
// Kutunun YAN duvarlari kati: kalp kutunun icindeyken oraya hapis.
// Kutu boyu 120. Bir vurusun erisebildigi mesafe = menzil 78 + vurus
// penceresi 12 kare * dash sirasindaki dunya hizi ~7 = 162 px. 120 bunun
// altinda, yani alt duvari kiran dash zincirle ust duvari da kiriyor:
// kutu tek dash ile geciliyor. Kalp kutunun icinde zaten mavi pencereye
// hizali oldugu icin burada hizalanma sorunu yok, is tamamen zamanlamada.
// Kutular arasindaki bosluga yandan blaster geliyor; blasterlar da diger
// her sey gibi asagi kayiyor, dash olunca kayma hizlaniyor.
// Bosluk 340, serit sapmasi 40: kutudan cikan oyuncunun bir sonraki kutuya
// hizalanmasi 27 kare, guc dashini sarj etmesi 40 kare suruyor ve arada
// blaster var. 260/52 iken bunlarin hepsi ayni 43 kareye sigiyordu.
box_on=false;
boxes=[];			// { ox, w, h, y }
blasts=[];			// { y, side }
box_gap=260;

// Blasterlar oyunun kendi blaster nesnesi (battle_gasterblaster), sadece
// dr_mode acik: ateslendikten sonra geri tepmiyor, nisan aldigi yerde kalip
// dunyayla birlikte asagi kayiyor. Cizimi, sesi, isini ve hasari kendi
// yapiyor -- burada sadece dogus ani belirleniyor.
//
// Isin bastan sona uzuyor, yani yandan kacis yok. Kacis hiz: blaster
// dogumundan 77 kare sonra atesliyor ve normal hizda tam kalbin hizasinda
// patliyor. Dash atip dunyayi hizlandiran oyuncu daha ates etmeden gecmis
// oluyor -- ve ufak dash bile yetiyor. Once 232/16 idi: orada sadece guc
// dashi kurtariyordu, kutu duvarlariyla birlikte cok aciti.
blast_warn=120;		// blaster bu y de doguyor (erken: uzun uyari)
blast_len=20000;	// isin uzunlugu (px); kisaltmak istenirse buradan

///@arg side	-1 sol kenar, +1 sag kenar
///@arg y		dogdugu yukseklik
DrBlaster = function(_side,_y)
{
	var _hx = (_side < 0) ? (battle_board.x-battle_board.left-42) : (battle_board.x+battle_board.right+42);
	var _ang = (_side < 0) ? 0 : 180;
	// Son arg 1: giris animasyonu yok, blaster dogrudan yerinde doguyor.
	// BlastCooldown 55 + agiz animasyonunun 20 karesi = 77. karede ates.
	var _b = RegularBlaster(_hx,_y,_hx,_y,_ang,_ang,26,55,2,2,1);
	_b.dr_mode = true;
	_b.dr_len = blast_len;
	// Bir anda belirmesin: seffaf doguyor, 30 karede opaklasiyor. Ates 37.
	// karede oldugu icin agzini acmaya basladiginda coktan tam gorunur.
	// Blasterin kendi kodu image_alpha ya hic dokunmuyor, cakisma yok.
	_b.image_alpha = 0;
	Anim_Create(_b,"image_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,30);
	return _b;
};

///Art arda dizilmis mavi barlar. Tek guc dash i hepsini kiriyor: her
///kirilis vurus penceresini bastan baslatiyor. Oyuncu bu sirada sadece
///saga sola gidip bir sonraki mavi pencereye hizalaniyor; hizasiz kalan
///bar kirilmiyor ve zincir orada kopuyor. Kutulardan once geliyor, yani
///mekanigi kutu duvarlarinda kullanmadan once ogretiyor.
///@arg count	kac bar
///@arg gap		barlar arasi dikey mesafe
///@arg w		mavi pencere genisligi
ChainRun = function(_count,_gap,_w)
{
	// Zincir dash barlari kendisi kiriyor, oyuncunun tek isi hizalanmak.
	// Sapma 40 px: barlar arasi 120 px = 17 kare, kalp 3 px/kare ile 50 px
	// gidebiliyor, yani yetisiyor ama bosuna da durulmuyor.
	var _ofs = [-20,20,-20,20,-20,20];
	for (var _i = 0; _i < _count; _i++)
	{
		var _b = DrBone(_ofs[_i % array_length(_ofs)],_w);
		_b.y = -40-_i*_gap;
	}
	audio_play_sound(snd_exclamation,0,false);
};

///Yandan gelen bir blaster isaretcisi koyar. Konum, blasterin kalbe varana
///kadar kat edecegi YOL cinsinden veriliyor -- her sey gibi asagi kayiyor.
///Isaretci blast_warn'a ulasinca gercek blaster doguyor.
///@arg d		kalbe varis mesafesi (px)
///@arg side	-1 sol kenar, +1 sag kenar
BlastMark = function(_d,_side)
{
	array_push(blasts,{ y: 400-_d, side: _side, dogdu: false });
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
		// Ilk kutu ekranin uzerinde doguyor. Once 150 idi ve kutu tam
		// ekranin ortasinda birden beliriyordu: kutunun yesil yan duvarlari
		// dogrudan ekrana ciziliyor, yani barlar gibi kutu yuzeyi tarafindan
		// kirpilmiyorlar. -250 ile ust duvari -310'da doguyor ve her sey
		// gibi yukaridan kayarak giriyor.
		var _y = -250-_i*_adim;
		array_push(boxes,{ ox:_ox, w:_w, h:_h, y:_y });

		// Alt ve ust duvar. Mavi pencere tam kutu genisligi: kalp kutunun
		// icindeyken sadece maviye denk geliyor, yani gecmenin tek yolu dash.
		var _b1 = DrBone(_ox,_w);
		_b1.y = _y+_h/2;
		var _b2 = DrBone(_ox,_w);
		_b2.y = _y-_h/2;

		// Boslugun tam ortasina bir blaster, terk edilen kutunun tarafindan.
		if (_i < _count-1)
		{
			BlastMark(400-(_y-_h/2-_gap/2),(_ox < 0) ? -1 : 1);
		}
	}
	box_on = true;
	audio_play_sound(snd_exclamation,0,false);
};

BoxStop = function()
{
	box_on = false;
	boxes = [];
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

///Bir kosu birimi: bir dizi GERCEK halka, sonunda bir TUZAK + bileklik.
///
///Halkalar 260 px arayla -- bu ruhun jump_dist'i, yani bir yayin bitisi bir
///sonraki halkaya tam denk geliyor ve zincir kendiliginden suruyor. Her
///gercek halkanin 130 px arkasinda beyaz bar var: havada olmak zorunlu.
///
///TUZAK, son gercek halkayla AYNI SERITTE ve ondan yine 260 px sonra. Yani
///zincirin dogal devami: hicbir sey yapilmazsa zincir ona biniyor ve 130 px
///sonraki bileklige girilir. Dogru oynanis seritten cikip yere inmek --
///bileklik tam kalbin dusecegi noktada duruyor, kandirma orada.
///
///Birimin uzunlugu serit sayisina gore degisiyor. Hep ayni olsaydi (mesela
///her seferinde iki gercek halka) oyuncu tuzagin kacinci ziplamada
///gelecegini sayabilirdi; degisken olunca her seferinde bilekligin kendisine
///bakmak zorunda.
///@arg first	ilk halkanin kalbe varis mesafesi (px)
///@arg lanes	gercek halkalarin seritleri; tuzak sonuncusuyla ayni serite gider
JumpUnit = function(_first,_lanes)
{
	var _n = array_length(_lanes);
	for (var _i = 0; _i < _n; _i++)
	{
		var _d = _first+260*_i;
		JumpRing(_lanes[_i],_d-420);
		JumpBar(_d+130-424);
	}
	var _td = _first+260*_n;
	JumpRing(_lanes[_n-1],_td-420);			// tuzak: ayni serit, zincirin devami
	CarMark(_td+130);
};


///Turuncu koridordan sari ruha gecis. Koridor ve icindeki her sey
///temizleniyor, kutu kucuk bir kareye iniyor, ruh sari oluyor.
SariBasla = function()
{
	CarStop();
	BoxStop();
	with (battle_regularbone) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
	DrCorridorStop();

	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(40,40,40,40,45);
	battle_board.angle = 0;
	Battle_SetSoul(battle_soul_yellow_dr);
	Camera_Shake(4,4,3,3);

	sari_on = true;
	sari_t = 0;
};


///Kutunun etrafindaki cember uzerinde bir blaster; agzi merkeze bakiyor.
///Once cemberin disinda doguyor ve yerine ucuyor, sonra atesliyor.
///Ates ani: dogum + ucus(26) + cool + agiz animasyonu(21).
///@arg ang		cember uzerindeki aci
///@arg rad		cemberin yaricapi
///@arg cool	ateslemeden onceki ek bekleme
BlasterRing = function(_ang,_rad,_cool)
{
	var _cx = battle_board.x;
	var _cy = battle_board.y;
	var _tx = _cx+lengthdir_x(_rad,_ang);
	var _ty = _cy+lengthdir_y(_rad,_ang);
	var _sx = _cx+lengthdir_x(_rad+150,_ang);
	var _sy = _cy+lengthdir_y(_rad+150,_ang);
	var _bak = _ang+180;
	// XScale 1.5: isin 28*1.5 = 42 px. Kutu 130 px yuksekliginde, yani yatay
	// bir isin gectiginde ustte ve altta 36'sar px guvenli serit kaliyor.
	// 2 olsaydi o serit 29'a inip yatay isinlar neredeyse kacinilmaz olurdu.
	// BlastDuration 14: isinin tehlikeli suresi ~10 (acilma) + 14 + ~12
	// (sonme) = 36 kare. 40 verilmisti ve 20 kare arayla ateslenince ucu
	// birden acik kaliyor, merkezden gecen isinlar kutuyu kapatiyordu.
	return RegularBlaster(_sx,_sy,_tx,_ty,_bak,_bak,14,_cool,1.5,1.5,26);
};

///Kutunun etrafina blaster cemberi. Hepsi ayni anda doguyor ama sirayla
///atesliyorlar: cool = i*gap. Isinlar merkezden gectigi icin her atesle
///guvenli bolge donuyor, ruhun da onunla birlikte donmesi gerekiyor.
///@arg count	kac blaster
///@arg rad		cemberin yaricapi
///@arg ang0	ilk blasterin acisi
///@arg gap		atesler arasi kare
BlasterCircle = function(_count,_rad,_ang0,_gap)
{
	for (var _i = 0; _i < _count; _i++)
	{
		BlasterRing(_ang0+_i*(360/_count),_rad,_i*_gap);
	}
};

///Yukaridan dusen buyuk yildirim. Ekranin uzerinde dogup asagi iniyor,
///kutunun icine girdigi anda PATLIYOR: kaboom, kamera sarsintisi ve
///cevreye kavis cizerek dagilan boltlar. Sistem hazirdi, tur 14 de ayni
///cagriyi kullaniyor.
///Dogumdan patlamaya (kutu ustune) 48 kare var, uyari o.
///@arg ox		kutu merkezine gore x ofseti
///@arg fan		patlamadan cikan bolt sayisi
///@arg curve	o boltlarin kare basina yon degisimi (kavis)
Yildirim = function(_ox,_fan,_curve)
{
	return AlphysBigBolt(battle_board.x+_ox,-60,270,6,_fan,_curve);
};

///Sari bolumden kirmizi ruha gecis.
KirmiziBasla = function()
{
	with (battle_dr_target) { instance_destroy(); }
	with (battle_dr_shot) { instance_destroy(); }
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	// Kutu KARE: blaster cemberi merkezden gecen isinlar atiyor, dikdortgen
	// kutuda yatay isinlar dikeylerden cok daha dar bir guvenli serit
	// birakiyordu. 180x180 de her acidan 61 px kaliyor.
	Battle_SetBoardSizeCubic(90,90,90,90,45);
	Battle_SetSoul(battle_soul_red);
	battle_soul.x = battle_board.x;
	battle_soul.y = battle_board.y;
	with (battle_soul) { moveable = true; }
	Camera_Shake(4,4,3,3);

	kir_on = true;
	kir_t = 0;
};
